from mlxtend.frequent_patterns import apriori
from mlxtend.frequent_patterns import association_rules
import mysql.connector
from mysql.connector import Error
from mysql.connector import errorcode
from mysql.connector.cursor import MySQLCursorPrepared
import pandas as pd
import argparse

def getdata():
   db = mysql.connector.connect(host="localhost",database="be_project",user="root",password="")
   SelectQuery = "SELECT user, vehicle,value FROM buydataset order by id desc"
   resp = pd.read_sql_query(SelectQuery, db)       
   # disconnect from server
   db.close()
   return resp;

def getuserdata(userid):
   db = mysql.connector.connect(host="localhost",database="be_project",user="root",password="")
   SelectQuery = "SELECT user, vehicle,value FROM buydataset where user='%s' order by id desc" %(userid)
   resp = pd.read_sql_query(SelectQuery, db)       
   # disconnect from server
   db.close()
   return resp;
argparser = argparse.ArgumentParser()
argparser.add_argument('email', help='finance Sysmbol')
args = argparser.parse_args()
email=args.email

data=getdata()
df=data
if not data[data.duplicated(['user','vehicle'])].empty:
    data = data.drop_duplicates(['user','vehicle'])
    
df_for_knn = data.pivot(index='vehicle',columns='user',values='value').fillna(0)

def encode_units(x):
    if x<=0:
        return 0
    if x>=1:
        return 1

df_for_ar = df_for_knn.T.applymap(encode_units)
frequent_itemsets = apriori(df_for_ar, min_support=0.07, use_colnames=True)
rules = association_rules(frequent_itemsets, metric="lift", min_threshold=1)
rules.head()
all_antecedents=[]
for x in range(rules.shape[0]):
    val=rules.at[x,'antecedents']
    all_antecedents.append(next(iter(val)))

userdata=getuserdata(email)

if not userdata[userdata.duplicated(['user','vehicle'])].empty:
    userdata = userdata.drop_duplicates(['user','vehicle'])
anc1=userdata.at[0,'vehicle']
desired_indices=[]
for x in range(rules.shape[0]):
    val=rules.at[x,'antecedents']
    element=next(iter(val))
    if element==anc1:
        desired_indices.append(x)
    all_antecedents.append(next(iter(val)))
        

# desired_indices = [i for i in range(len(all_antecedents)) if all_antecedents[i][0]=='22']
apriori_recommendations=rules.iloc[desired_indices,].sort_values(by=['lift'],ascending=False)
apriori_recommendations.head()

apriori_recommendations_list = [list(x) for x in apriori_recommendations['consequents'].values]
print("Apriori Recommendations: \n")
for i in range(10):
    print("{0}: {1} with lift of {2}".format(i+1, apriori_recommendations_list[i], apriori_recommendations.iloc[i, 6]))
ids = []
for i in range(10):
    list1=apriori_recommendations_list[i]
    for x in range( len(list1)):
        ids.append(list1[x])
        

mylist = list(dict.fromkeys(ids))
idlist = ",".join(mylist)

print(idlist)

       
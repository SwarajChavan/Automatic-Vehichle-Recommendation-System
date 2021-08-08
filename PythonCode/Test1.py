# -*- coding: utf-8 -*-
"""
Created on Mon Mar 25 14:12:06 2019

@author: Mrunmayi
"""

import pandas as pd
transactions = [('eggs', 'bacon', 'soup'),
                ('eggs', 'bacon', 'apple'),
                ('soup', 'bacon', 'banana')]
from apyori import apriori
rules = apriori(transactions, min_support = 0.003, min_confidence = 0.2, min_length = 2)
results = list(rules)

lift = []
association = []
for i in range (0, len(results)):
    lift.append(results[:len(results)][i][2][0][3])
    association.append(list(results[:len(results)][i][0]))
    
    
rank = pd.DataFrame([association, lift]).T
rank.columns = ['Association', 'Lift']

rank.sort_values('Lift', ascending=False).head(10)

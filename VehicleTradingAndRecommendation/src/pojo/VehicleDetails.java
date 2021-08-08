package pojo;

public class VehicleDetails {
	
	private String id;
	private String regno;
	private String brand;
	private String type;
	private String model;
	private String vehicletype;
	private int yearsused;
	private int kmsdriven;
	private int milage;
	private int myear;
	private int price;
	private String fuel;
	private String purpose;
	private String dealer;
	private String inspection;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRegno() {
		return regno;
	}
	public void setRegno(String regno) {
		this.regno = regno;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getVehicletype() {
		return vehicletype;
	}
	public void setVehicletype(String vehicletype) {
		this.vehicletype = vehicletype;
	}
	public int getYearsused() {
		return yearsused;
	}
	public void setYearsused(int yearsused) {
		this.yearsused = yearsused;
	}
	public int getKmsdriven() {
		return kmsdriven;
	}
	public void setKmsdriven(int kmsdriven) {
		this.kmsdriven = kmsdriven;
	}
	public int getMilage() {
		return milage;
	}
	public void setMilage(int milage) {
		this.milage = milage;
	}
	public int getMyear() {
		return myear;
	}
	public void setMyear(int myear) {
		this.myear = myear;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getFuel() {
		return fuel;
	}
	public void setFuel(String fuel) {
		this.fuel = fuel;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public String getDealer() {
		return dealer;
	}
	public void setDealer(String dealer) {
		this.dealer = dealer;
	}
	public String getInspection() {
		return inspection;
	}
	public void setInspection(String inspection) {
		this.inspection = inspection;
	}
	@Override
	public String toString() {
		return "VehicleDetails [id=" + id + ", regno=" + regno + ", brand=" + brand + ", type=" + type + ", model="
				+ model + ", vehicletype=" + vehicletype + ", yearsused=" + yearsused + ", kmsdriven=" + kmsdriven
				+ ", milage=" + milage + ", myear=" + myear + ", price=" + price + ", fuel=" + fuel + ", purpose="
				+ purpose + ", dealer=" + dealer + ", inspection=" + inspection + "]";
	}
	
	
	
}

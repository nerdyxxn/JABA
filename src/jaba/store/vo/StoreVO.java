package jaba.store.vo;

public class StoreVO implements Comparable<StoreVO>{ //가져오는 arg로 순서 정하기 위해 implements로 compare class가져옴.
	private double distance;
	private String store_id;
	private String store_pw;
	private String store_name;
	private String store_phone;
	private String store_addr;
	private String store_time;
	private String store_img;
	private String store_description;
	private String store_lat;
	private String store_lng;
	
	
	public double getDistance() {
		return distance;
	}
	public void setDistance(double distance) {
		this.distance = distance;
	}
	public String getStore_id() {
		return store_id;
	}
	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}
	public String getStore_pw() {
		return store_pw;
	}
	public void setStore_pw(String store_pw) {
		this.store_pw = store_pw;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public String getStore_phone() {
		return store_phone;
	}
	public void setStore_phone(String store_phone) {
		this.store_phone = store_phone;
	}
//	public String getStroe_addr() {// 오타
//		return store_addr;
//	}  
	public String getStore_addr() {
		return store_addr;
	}
	public void setStore_addr(String store_addr) {
		this.store_addr = store_addr;
	}
	public String getStore_time() {
		return store_time;
	}
	public void setStore_time(String store_time) {
		this.store_time = store_time;
	}
	public String getStore_img() {
		return store_img;
	}
	public void setStore_img(String store_img) {
		this.store_img = store_img;
	}
	public String getStore_description() {
		return store_description;
	}
	public void setStore_description(String store_description) {
		this.store_description = store_description;
	}
	public String getStore_lat() {
		return store_lat;
	}
	public void setStore_lat(String store_lat) {
		this.store_lat = store_lat;
	}
	public String getStore_lng() {
		return store_lng;
	}
	public void setStore_lng(String store_lng) {
		this.store_lng = store_lng;
	}
	@Override //
	public int compareTo(StoreVO arg0) {
		if(this.distance > arg0.distance) 
			return 1; //좌측값이 큰 경우
		else if (this.distance < arg0.distance) 
			return -1; //우측값이 큰 경우
		else
			return 0; //일치하는 경우
	}
	
	
}

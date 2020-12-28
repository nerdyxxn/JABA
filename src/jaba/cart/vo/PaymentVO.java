package jaba.cart.vo;

import java.sql.Date;
//이름              널?       유형            
//--------------- -------- ------------- 
//PAY_ID          NOT NULL VARCHAR2(10)  
//CART_ID                  VARCHAR2(10)  
//PAY_TOTAL_PRICE          NUMBER(15)    
//PAY_TIME                 DATE          DEFAULT 
//PAY_REQUEST              VARCHAR2(100) 
//PICKUP_TIME              VARCHAR2(10) DEFAULT 'ASAP'
public class PaymentVO {
	private String pay_id;
	private String cart_id;
	private int pay_total_price;
	private Date pay_time;
	private String pay_request;
	private String pickup_time;
	
	public String getPay_id() {
		return pay_id;
	}
	public void setPay_id(String pay_id) {
		this.pay_id = pay_id;
	}
	public String getCart_id() {
		return cart_id;
	}
	public void setCart_id(String cart_id) {
		this.cart_id = cart_id;
	}
	public int getPay_total_price() {
		return pay_total_price;
	}
	public void setPay_total_price(int pay_total_price) {
		this.pay_total_price = pay_total_price;
	}
	public Date getPay_time() {
		return pay_time;
	}
	public void setPay_time(Date pay_time) {
		this.pay_time = pay_time;
	}
	public String getPay_request() {
		return pay_request;
	}
	public void setPay_request(String pay_request) {
		this.pay_request = pay_request;
	}
	public String getPickup_time() {
		return pickup_time;
	}
	public void setPickup_time(String pickup_time) {
		this.pickup_time = pickup_time;
	}

	
}

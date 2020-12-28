package jaba.cart.vo;

/*CREATE TABLE CART (
         order_id   VARCHAR2(10)   NOT NULL,
         cart_id   VARCHAR2(10)   NOT NULL,
         store_id   VARCHAR2(100)   NOT NULL,
         cart_total_price   NUMBER(15)   NULL,
         cart_check   number(1)   default 1
      );*/

public class CartVO {
	private String order_id;
	private String cart_id;
	private String store_id;
	private int cart_total_price;
	private int cart_check;

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public String getCart_id() {
		return cart_id;
	}

	public void setCart_id(String cart_id) {
		this.cart_id = cart_id;
	}

	public String getStore_id() {
		return store_id;
	}

	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}

	public int getCart_total_price() {
		return cart_total_price;
	}

	public void setCart_total_price(int cart_total_price) {
		this.cart_total_price = cart_total_price;
	}

	public int getCart_check() {
		return cart_check;
	}

	public void setCart_check(int cart_check) {
		this.cart_check = cart_check;
	}

}
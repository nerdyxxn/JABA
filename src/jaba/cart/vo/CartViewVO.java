package jaba.cart.vo;

//총가격, 주문수량, 메뉴이름, (내가 체크한 커스텀이름)
public class CartViewVO {
   private String menu_name;
   private int order_quantity;
   private int cart_total_price;
   
   public String getMenu_name() {
      return menu_name;
   }
   public void setMenu_name(String menu_name) {
      this.menu_name = menu_name;
   }
   public int getOrder_quantity() {
      return order_quantity;
   }
   public void setOrder_quantity(int order_quantity) {
      this.order_quantity = order_quantity;
   }
   public int getCart_total_price() {
      return cart_total_price;
   }
   public void setCart_total_price(int cart_total_price) {
      this.cart_total_price = cart_total_price;
   }
}
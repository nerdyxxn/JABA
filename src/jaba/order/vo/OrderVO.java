package jaba.order.vo;

/*create table MENU_ORDER (
      order_id   VARCHAR2(10),
      user_id       VARCHAR2(30),
      menu_id       VARCHAR2(10),
      order_quantity       NUMBER(10)
   );*/
public class OrderVO {
   private String order_id;
   private String user_id;
   private String menu_id;
   private int order_quantity;
   
   public String getOrder_id() {
      return order_id;
   }
   public void setOrder_id(String order_id) {
      this.order_id = order_id;
   }
   public String getUser_id() {
      return user_id;
   }
   public void setUser_id(String user_id) {
      this.user_id = user_id;
   }
   public String getMenu_id() {
      return menu_id;
   }
   public void setMenu_id(String menu_id) {
      this.menu_id = menu_id;
   }
   public int getOrder_quantity() {
      return order_quantity;
   }
   public void setOrder_quantity(int order_quantity) {
      this.order_quantity = order_quantity;
   }
   
}
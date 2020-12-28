package jaba.order.dao;

import static jaba.common.jdbcdriver.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jaba.order.vo.OrderVO;

public class OrderDAO {
   PreparedStatement pstmt = null;
   ResultSet rs = null;

   // MENU_ORDER 테이블에 데이터 추가하는 메소드 - INSERT
   public int insertOrder(Connection conn, String user_id, String menu_id, int order_quantity) {
      int result = 0;
      String sql = "insert into MENU_ORDER (order_id, user_id, menu_id, order_quantity) values (('O' || LPAD(ORDER_SEQ.nextval, 5, 0)),?,?,?)";
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, user_id);
         pstmt.setString(2, menu_id);
         pstmt.setInt(3, order_quantity);
         
         result = pstmt.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
      }
      return result;
   }
   
   // 현재 order_id를 가져오는 메소드
   public String currentOrderId (Connection conn) {
      String orderId = null;
      String sql = "select ('O' || LPAD(ORDER_SEQ.CURRVAL, 5, 0)) from dual";
      
      try {
         pstmt = conn.prepareStatement(sql);
         rs = pstmt.executeQuery();
         
         if (rs.next()) {
            orderId = rs.getString(1);         
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }
      return orderId;
   }
   
   // INSERT한 다음, 생성된 order_id로  OrderVO를 가져오는 메소드
   public OrderVO selectOrder(Connection conn, String order_id) {
      OrderVO selectOrder = null;
      String sql = "select * from MENU_ORDER where Order_id = ?";

      // 메뉴이름 중복되면 안된다. 
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, order_id);
         rs = pstmt.executeQuery();
         if (rs.next()) {
            selectOrder = new OrderVO();
            selectOrder.setOrder_id(rs.getString("order_id"));
            selectOrder.setUser_id(rs.getString("user_id"));
            selectOrder.setMenu_id(rs.getString("menu_id"));
            selectOrder.setOrder_quantity(rs.getInt("order_quantity"));
         } else { // store가 없으면
            System.out.println("DB에 일치하는 OrderVO 정보 없음");
            selectOrder = null;
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      return selectOrder;
   }
   

   
   // CARTNO 장바구니넘버 테이블 데이터 추가하는 메소드
   
   // CART 테이블에 데이터 추가하는 메소드
}
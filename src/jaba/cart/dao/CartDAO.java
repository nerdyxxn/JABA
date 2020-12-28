package jaba.cart.dao;

import static jaba.common.jdbcdriver.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jaba.cart.vo.CartNoVO;
import jaba.cart.vo.CartVO;

public class CartDAO {
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   
   // CARTNO 장바구니넘버 테이블 데이터 추가하는 메소드
   public int insertCartNo(Connection conn) {
      int result = 0;
      String sql = "insert into CARTNO (CART_ID) values (('N' || LPAD(CARTNO_SEQ.nextval, 5, 0)))";

      try {
         pstmt = conn.prepareStatement(sql);

         result = pstmt.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
      }
      return result;
   }
      
   // 현재 CART_ID를 가져오는 메소드
      public String currentCartId (Connection conn) {
         String cartId = null;
         String sql = "select ('N' || LPAD(CARTNO_SEQ.CURRVAL, 5, 0)) from dual";
         
         try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
               cartId = rs.getString(1);         
            }
         } catch (SQLException e) {
            e.printStackTrace();
         }
         return cartId;
      }
      
   // INSERT한 다음, CartNoVO를 가져오는 메소드   
      public CartNoVO selectCartNo(Connection conn, String cart_id) {
              CartNoVO selectCartNo = null;
            String sql = "select * from CARTNO where cart_id = ?";

            // 메뉴이름 중복되면 안된다. 
            try {
               pstmt = conn.prepareStatement(sql);
               pstmt.setString(1, cart_id);
               rs = pstmt.executeQuery();
               if (rs.next()) {
                  selectCartNo = new CartNoVO();
                  selectCartNo.setCart_id(rs.getString("cart_id"));
               } else { // store가 없으면
                  System.out.println("DB에 일치하는 CartNoVO 정보 없음");
                  selectCartNo = null;
               }
            } catch (Exception e) {
               e.printStackTrace();
            }
            return selectCartNo;
         }
      
   // CART 테이블에 데이터 추가하는 메소드
   public int insertCart(Connection conn, String order_id, String cart_id, String store_id, int cart_total_price) {
      int result = 0;
      String sql = "insert into CART (order_id, cart_id, store_id, cart_total_price) values (?,?,?,?)";

      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, order_id);
         pstmt.setString(2, cart_id);
         pstmt.setString(3, store_id);
         pstmt.setInt(4, cart_total_price);
         
         result = pstmt.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
      }
      close(pstmt);
      return result;
   }
   
   
   // cartNo로 cart 테이블을 조회해서 List를 뽑아오는 메소드
   public List<CartVO> selectCartList(Connection conn, String cart_id){
	   List<CartVO> cartList = null;
	   String sql = "SELECT * FROM CART WHERE CART_ID=?";
	   
	   try {
		   pstmt = conn.prepareStatement(sql);
		   pstmt.setString(1, cart_id);
		   rs = pstmt.executeQuery();
		   if(rs.next()) {
			   cartList = new ArrayList<CartVO>();
			   do {
				   CartVO vo = new CartVO();
				   vo.setOrder_id(rs.getString("order_id"));
				   vo.setCart_id(rs.getString("cart_id"));
				   vo.setOrder_id(rs.getString("order_id"));
				   vo.setCart_total_price(rs.getInt("cart_total_price"));
				   vo.setCart_check(rs.getInt("cart_check"));
				   cartList.add(vo);
			   }while(rs.next());
		   }else {
			   System.out.println();
		   }
	   }catch(SQLException e) {
		   e.printStackTrace();
	   }
	   close(rs);
	   close(pstmt);
	   return cartList;
   }
   
   // order_id를 가지고 order에 가서 orderVo를 반환하는 메소드 
   
   // -----------    payment에 데이터를 insert하는 메소드          ---------------- 
   public int insertPayment(Connection conn, String cart_id, int pay_total_price, String pay_request) {
	   int result = 0;
	   String sql = "insert into PAYMENT (pay_id, cart_id, pay_total_price, pay_request) values(('P' || LPAD(PAYMENT_SEQ.nextval, 5, 0)), ?, ?, ?)";
	   try {
		   pstmt = conn.prepareStatement(sql);
		   pstmt.setString(1, cart_id);
		   pstmt.setInt(2, pay_total_price);
		   pstmt.setString(3, pay_request);
		   result = pstmt.executeUpdate();
		   if(result == 0) {
			   System.out.println("DAO 에서 INSERT 실패");
		   }
	   }catch(SQLException e) {
		   e.printStackTrace();
	   }
	   close(pstmt);
	   return result;
   }
   
}
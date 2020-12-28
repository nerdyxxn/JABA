package jaba.admin.dao;

import static jaba.common.jdbcdriver.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jaba.admin.vo.AdminVO;
import jaba.client.vo.ClientVO;
import jaba.store.vo.StoreVO;


public class AdminDAO {
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public AdminVO selectLogin(Connection conn, String admin_id, String admin_pw) {
		AdminVO vo = null;
		String sql = "select * from admin where admin_id=? and admin_pw=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, admin_id);
			pstmt.setString(2, admin_pw);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new AdminVO();
				vo.setAdmin_id(rs.getString("admin_id"));
				vo.setAdmin_pw(rs.getString("admin_pw"));
				
			}else { // store가 없으면 
				System.out.println("DB에 일치하는 admin 정보 없음");
				vo = null;
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if(rs!=null) {
					rs.close();
				}
				if(pstmt!=null) {
					pstmt.close();
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return vo;
	}

	// admin_id 와도 중복되면 안되기 때문에 중복체크
	public int selectIdCheck(Connection conn, String user_id) {
		ClientVO vo = null;
		String sql = "select * from admin where admin_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return 1;	// 1이면 중복된 아이디
			}else {
				return 2;	// 2이면 사용가능한 아이디
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return 0;
	}
	
	//모든 회원 조회
	public List<ClientVO> selectAllClient(Connection conn) {
	      List<ClientVO> list = null;
	      String sql = "select * from client";
	      try {
	         pstmt = conn.prepareStatement(sql);
	         rs = pstmt.executeQuery();
	         if (rs.next()) {
	        	 list = new ArrayList<ClientVO>();
	            do {
//	            	USER_ID     NOT NULL VARCHAR2(100) 
//	            	USER_PW              VARCHAR2(50)  
//	            	USER_NAME            VARCHAR2(30)  
//	            	USER_PHONE           VARCHAR2(20)  
//	            	USER_GENDER          NUMBER(1)     
//	            	USER_BIRTH           NUMBER(8)     
//	            	USER_STATUS          NUMBER(8)     
//	            	USER_YELLOW          NUMBER(8)     

	               ClientVO vo = new ClientVO();
	               vo.setUser_id(rs.getString("user_id"));
	               vo.setUser_pw(rs.getString("user_pw"));
	               vo.setUser_name(rs.getString("user_name"));
	               vo.setUser_phone(rs.getString("user_phone"));
	               vo.setUser_gender(rs.getInt("user_gender"));
	               vo.setUser_birth(rs.getInt("user_birth"));
	               vo.setUser_status(rs.getInt("user_status"));
	               vo.setUser_yellow(rs.getInt("user_yellow"));
	               list.add(vo);
	            } while (rs.next());
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      close(rs);
	      close(pstmt);
	      return list;
	   }

	//모든 매장 조회
	public List<StoreVO> selectAllStore(Connection conn) {
	      List<StoreVO> list = null;
	      String sql = "select * from store";
	      try {
	         pstmt = conn.prepareStatement(sql);
	         rs = pstmt.executeQuery();
	         if (rs.next()) {
	        	 list = new ArrayList<StoreVO>();
	            do {
//	            	STORE_ID   NOT NULL VARCHAR2(100) 
//	            	STORE_PW            VARCHAR2(50)  
//	            	STORE_ADDR          VARCHAR2(200) 
//	            	STORE_NAME          VARCHAR2(100) 
//	            	STORE_TIME          VARCHAR2(100) 
//	            	STORE_IMG           VARCHAR2(100) 
  

	               StoreVO vo = new StoreVO();
	               vo.setStore_id(rs.getString("store_id"));
	               vo.setStore_pw(rs.getString("store_pw"));
	               vo.setStore_name(rs.getString("store_name"));
	               vo.setStore_addr(rs.getString("store_addr"));
	               vo.setStore_time(rs.getString("Store_time"));
	               vo.setStore_img(rs.getString("Store_img"));
	               list.add(vo);
	            } while (rs.next());
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      close(rs);
	      close(pstmt);
	      return list;
	   }
	
	

}

package jaba.store.model.service;

import java.sql.Connection;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import jaba.client.dao.ClientDAO;
import jaba.store.dao.StoreDAO;
import jaba.store.vo.StoreVO;

import static jaba.common.jdbcdriver.JDBCTemplate.*;

public class StoreService {
	
	public StoreService() {
	}
	
	public int selectLogin(String store_id, String store_pw) {
		try {
			Connection conn = getConnection();
			StoreDAO dao = new StoreDAO();
			StoreVO vo = dao.selectLogin(conn, store_id, store_pw);
			close(conn);
			if (vo != null) {
				System.out.println("Store 데이터 있음 return 1");
				return 1;
			} else {
				System.out.println("Store 데이터 없음 return 2");
				return 2;
			}
		} catch (Exception e) {
			System.out.println("Store 오류발생 return 3");
			return 3;
		}
	}
	
	// store id & pwd를 긁어오는 메소드
	public StoreVO selectStore(String store_id, String store_pw) {
		StoreVO vo = null;
		Connection conn = getConnection();
		try {
			StoreDAO dao = new StoreDAO();
			vo = dao.selectLogin(conn, store_id, store_pw);
			close(conn);
		} catch (Exception e) {
			System.out.println("Store 오류발생 return 3");

		}
		return vo;
	}

	// 아이디만 중복체크 store와 확인 (회원가입 할때 사용)
	public int selectIdCheck(String user_id) {
		int result = 0;
		try {
			Connection conn = getConnection();
			StoreDAO dao = new StoreDAO();
			result = dao.selectIdCheck(conn, user_id);
			close(conn);
		}catch(Exception e) {
			e.printStackTrace();
			return 3;	// 오류발생
		}
		return result;
	}
	
	   // store 리스트 정보를 긁어오는 메소드
	   public List<StoreVO> selectList(String store_name) {
	      List<StoreVO> list = null;
	      Connection conn = getConnection();
	      try {
	         StoreDAO dao = new StoreDAO();
	         list = dao.selectList(conn, store_name);
	         close(conn);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return list;
	   }
	   
		// 선택한 store 정보를 긁어오는 메소드 (explore -> menu로 이동하기 위함)
		public StoreVO selectStoreName(String store_name) {
			StoreVO vo = null;
			Connection conn = getConnection();
			try {
				StoreDAO dao = new StoreDAO();
		         vo = dao.selectStore(conn, store_name);
		         close(conn);
			} catch (Exception e) {
				System.out.println("Store 오류발생 return 3");

			}
			return vo;
		}
		public StoreVO selectStoreId(String store_id) {
			StoreVO vo = null;
			Connection conn = getConnection();
			try {
				StoreDAO dao = new StoreDAO();
				vo = dao.selectStorebyId(conn, store_id);
				close(conn);
			} catch (Exception e) {
				System.out.println("Store 오류발생 return 3");
				
			}
			return vo;
		}
		public StoreVO changeIdtoName(String store_id) {
			StoreVO vo = null;
			Connection conn = getConnection();
			try {
				StoreDAO dao = new StoreDAO();
				vo = dao.changeIdtoName(conn, store_id);
				close(conn);
			} catch (Exception e){
				System.out.println("이름변경 오류 발생");
			}
			return vo;
		}
		
}

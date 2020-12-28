package jaba.client.model.service;

import java.sql.Connection;

import jaba.client.dao.ClientDAO;
import jaba.client.vo.ClientVO;

import static jaba.common.jdbcdriver.JDBCTemplate.*;

public class ClientService {


	public ClientService() {

	}
	
	// client 로그인 메소드
	public int selectLogin(String user_id, String user_pw) {
		try {
			Connection conn = getConnection();
			ClientDAO dao = new ClientDAO();
			ClientVO vo = dao.selectLogin(conn, user_id, user_pw);
			close(conn);
			if (vo != null) {
				System.out.println("client 데이터 있음 return 1");
				return 1;
			} else {
				System.out.println("client 데이터 없음 return 2");
				return 2;
			}
		} catch (Exception e) {
			System.out.println("오류발생 return 3");
			return 3;
		}
	}
	
	// 아이디만 중복체크 (회원가입 할때 사용)
	public int selectIdCheck(String user_id) {
		int result = 0;
		try {
			Connection conn = getConnection();
			ClientDAO dao = new ClientDAO();
			result = dao.selectIdCheck(conn, user_id);
			close(conn);
		}catch(Exception e) {
			e.printStackTrace();
			return 3;	// 오류발생
		}
		return result;
	}
	
	// 아이디 register 회원가입 
	public int insertClient(String user_id, String user_pw, String user_name, String user_phone) {
		int result = 0;
		try {
			Connection conn = getConnection();
			ClientDAO dao = new ClientDAO();
			result = dao.insertClient(conn, user_id, user_pw, user_name, user_phone);
			close(conn);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("회원가입 insert 오류");
			return 3;	// 오류발생
		}
		return result;
	}
	// 로그인된 회원의 vo정보를 담는 메소드
		public ClientVO selectClientVo(String user_id) {
			ClientVO vo = null;
			Connection conn = getConnection();
			ClientDAO dao = new ClientDAO();
			try {
				vo = dao.selectClientVo(conn, user_id);
			}catch(Exception e){
				e.printStackTrace();
			}
			close(conn);
			return vo;
		}
		
		// 회원정보 update 
		public void updateClient(String user_id, String user_name, String user_phone, int user_gender, int user_birth) {
			int result = 0;
			Connection conn = getConnection();
			ClientDAO dao = new ClientDAO();
			try {
				result = dao.updateClient(conn, user_id, user_name, user_phone, user_gender, user_birth);
				System.out.println("updateClient result : " + result);
			}catch(Exception e) {
				e.printStackTrace();
			}
			close(conn);
		}
		
		
		// 비밀번호 변경
		public void updateClientPw(String user_id, String user_pw) {
			int result = 0;
			Connection conn = getConnection();
			ClientDAO dao = new ClientDAO();
			try {
				result = dao.updateClientPw(conn, user_id, user_pw);
				System.out.println("updateClientPw result : " + result);
			}catch(Exception e) {
				e.printStackTrace();
			}
			close(conn);
		}

	public String returnName(String user_id) {
		String result = null;
		try {
			Connection conn = getConnection();
			ClientDAO dao = new ClientDAO();
			result = (String) dao.returnName(conn, user_id);
			close(conn);
		}catch(Exception e) {
			e.printStackTrace();
			return "오류";	// 오류발생
		}
		return result;
	}
	

}

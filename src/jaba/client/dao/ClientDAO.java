package jaba.client.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jaba.client.vo.ClientVO;
import static jaba.common.jdbcdriver.JDBCTemplate.*;

public class ClientDAO {
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ClientVO selectLogin(Connection conn, String user_id, String user_pw) {
		ClientVO vo = null;
		String sql = "select * from client where user_id=? and user_pw=?";	// 

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, user_pw);
			rs = pstmt.executeQuery();
			
			if (rs.next()) { // ���̵� ������ vo�� ������ ��Ƽ� �Ѱ���
				vo = new ClientVO();
				vo.setUser_id(rs.getString("user_id"));
				vo.setUser_pw(rs.getString("user_pw"));
			} else { // ���̵� ������� vo�� null�� �ְ� ��ȯ
				System.out.println("DB에 일치하는 Client 정보 없음");
				vo = null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("sql 오류");
		}finally{
			close(rs);
			close(pstmt);
		}
		return vo;
	}
	
	
	public int selectIdCheck(Connection conn, String user_id) {
		String sql = "select * from client where user_id=?";
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
	
	public int insertClient(Connection conn, String user_id, String user_pw, String user_name, String user_phone) {
		String sql ="insert into client(user_id,user_pw,user_name,user_phone) values(?,?,?,?)";
		int result = 0;	// insert가 제대로 작동했는지 확인
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, user_pw);
			pstmt.setString(3, user_name);
			pstmt.setString(4, user_phone);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("sql insert 오류");
		}finally {
			close(pstmt);
		}
		return result;
	}

	// 로그인된 회원의 vo정보를 담는 메소드
	public ClientVO selectClientVo(Connection conn, String user_id) {
		ClientVO vo = new ClientVO();
		String sql="select * from client where user_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setUser_id(rs.getString("user_id"));
				vo.setUser_pw(rs.getString("user_pw"));
				vo.setUser_name(rs.getString("user_name"));
				vo.setUser_phone(rs.getString("user_phone"));
				vo.setUser_gender(rs.getInt("user_gender"));
				vo.setUser_birth(rs.getInt("user_birth"));
			}else {
				System.out.println("DB에서 " + user_id + "회원의 정보를 찾지 못했음");
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return vo;
	}
	
	// 회원정보 update 
	public int updateClient(Connection conn, String user_id, String user_name, String user_phone, int user_gender, int user_birth) {
		int result = 0;
		String sql="update client set user_name=?,user_phone=?,user_gender=?,user_birth=? where user_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_name);
			pstmt.setString(2, user_phone);
			pstmt.setInt(3, user_gender);
			pstmt.setInt(4, user_birth);
			pstmt.setString(5, user_id);
			result = pstmt.executeUpdate();
			if(result != 1) {
				System.out.println("Client Update 오류 발생");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		close(pstmt);
		return result; 
	}
	
	
	// 비밀번호 변경
	public int updateClientPw(Connection conn, String user_id, String user_pw) {
		int result = 0;
		String sql="update client set user_pw=? where user_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_pw);
			pstmt.setString(2, user_id);
			result = pstmt.executeUpdate();
			if(result != 1) {
				System.out.println("Client Pw Update 오류 발생");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		close(pstmt);
		return result; 
	}
	public String returnName(Connection conn, String user_id) {
		String sql = "select user_name from clien where user_id=?";
		ClientVO vo = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) { 
				vo = new ClientVO();
				vo.setUser_name(rs.getString("user_name"));
			} else { 
				System.out.println("DB에 일치하는 Client 정보 없음");
				vo = null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("sql 오류");
		}finally{
			close(rs);
			close(pstmt);
		}
		return vo.getUser_name();
	}


}

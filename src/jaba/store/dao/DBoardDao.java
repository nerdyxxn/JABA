package jaba.store.dao;

import static jaba.common.jdbcdriver.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import jaba.store.vo.DBoardVO;

public class DBoardDao {
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public int getBoardCount(Connection conn) {
		int cnt = 0;
		String sql = "select COUNT(*) from d_board";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);
				System.out.println(cnt);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return cnt;
	}

	public List<DBoardVO> getBoardAll(Connection conn) {
		List<DBoardVO> list = new ArrayList<DBoardVO>();
		String sql = "select * from d_board order by bref desc, bre_step asc";  // 과제 :댓글이 달리면 해당 ref 같은 글이 최상위로 올라오게 한다.
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				do {
					DBoardVO vo = new DBoardVO();
					vo.setBno(rs.getInt("bno"));
					vo.setBcnt(rs.getInt("bcnt"));
					vo.setBcontent(rs.getString("bcontent"));
					vo.setBdate(rs.getTimestamp("bdate"));
					vo.setBfilepath(rs.getString("Bfilepath"));
					vo.setBsubject(rs.getString("bsubject"));
					vo.setBwriter(rs.getString("bwriter"));
					vo.setBref(rs.getInt("bref"));
					vo.setBre_step(rs.getInt("bre_step"));
					vo.setBre_level(rs.getInt("bre_level"));
					list.add(vo);
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	public List<DBoardVO> getStoreFirstBoard(Connection conn, String store_name) {
		List<DBoardVO> list = new ArrayList<DBoardVO>();
		String sql = "select bcontent from d_board where bwriter=? and bdate = (select max(bdate) from d_board)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, store_name);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				DBoardVO vo = new DBoardVO();
				vo.setBcontent(rs.getString("bcontent"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public List<DBoardVO> getBoardAllbyWriter(Connection conn, String store_name) {
		List<DBoardVO> list = new ArrayList<DBoardVO>();
		String sql = "select * from d_board where bwriter=? order by bref desc, bre_step asc ";  // 과제 :댓글이 달리면 해당 ref 같은 글이 최상위로 올라오게 한다.
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, store_name);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				do {
					DBoardVO vo = new DBoardVO();
					vo.setBno(rs.getInt("bno"));
					vo.setBcnt(rs.getInt("bcnt"));
					vo.setBcontent(rs.getString("bcontent"));
					vo.setBdate(rs.getTimestamp("bdate"));
					vo.setBfilepath(rs.getString("Bfilepath"));
					vo.setBsubject(rs.getString("bsubject"));
					vo.setBwriter(rs.getString("bwriter"));
					vo.setBref(rs.getInt("bref"));
					vo.setBre_step(rs.getInt("bre_step"));
					vo.setBre_level(rs.getInt("bre_level"));
					list.add(vo);
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public List<DBoardVO> getBoardByPage(Connection conn, int start, int end) {
		List<DBoardVO> list = new ArrayList<DBoardVO>();
		String sql = "select * from "
				+ "(select ROWNUM rnum, d.* from "
				+ "(select * from d_board order by bref desc, bre_step asc) "
				+ "d) "
				+ "where rnum >= ? and rnum <= ?";  // 과제 :댓글이 달리면 해당 ref 같은 글이 최상위로 올라오게 한다.
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				do {
					DBoardVO vo = new DBoardVO();
					vo.setBno(rs.getInt("bno"));
					vo.setBcnt(rs.getInt("bcnt"));
					vo.setBcontent(rs.getString("bcontent"));
					vo.setBdate(rs.getTimestamp("bdate"));
					vo.setBfilepath(rs.getString("Bfilepath"));
					vo.setBsubject(rs.getString("bsubject"));
					vo.setBwriter(rs.getString("bwriter"));
					vo.setBref(rs.getInt("bref"));
					vo.setBre_step(rs.getInt("bre_step"));
					vo.setBre_level(rs.getInt("bre_level"));
					list.add(vo);
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return list;
	}
	
	public List<DBoardVO> getBoard(Connection conn, int bno) {
		List<DBoardVO> list = new ArrayList<DBoardVO>();
		String sql = "select * from d_board where bno =" + bno;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				do {
					DBoardVO vo = new DBoardVO();
					vo.setBno(rs.getInt("bno"));
					vo.setBcnt(rs.getInt("bcnt"));
					vo.setBcontent(rs.getString("bcontent"));
					vo.setBdate(rs.getTimestamp("bdate"));
					vo.setBfilepath(rs.getString("Bfilepath"));
					vo.setBsubject(rs.getString("bsubject"));
					vo.setBwriter(rs.getString("bwriter"));
					vo.setBpwd(rs.getString("bpwd"));
					vo.setBref(rs.getInt("bref"));
					vo.setBre_step(rs.getInt("bre_step"));
					vo.setBre_level(rs.getInt("bre_level"));
					list.add(vo);
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return list;
	}

	public int writeBoard(Connection conn, DBoardVO vo) { // d_board 에 1행 추가
		int result = 0;

		String bwriter = vo.getBwrite();
		String bsubject = vo.getBsubject();
		String bcontent = vo.getBcontent();
		String bfilepath = vo.getBfilepath();
		String bpwd = vo.getBpwd();
		
		int bno = vo.getBno();
		int bref = vo.getBref();
		int bre_step = vo.getBre_step();
		int bre_level = vo.getBre_level();

		// 가장 큰 bno를 읽어나오는 query
		String sql_max = "select nvl(max(bno),0) from D_Board";
		int maxBno = 0;
		try { 
			pstmt = conn.prepareStatement(sql_max);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				maxBno = rs.getInt(1) + 1;
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			//conn은 close 하지 않음. 계속 query를 전달해서 데이터를 받아올것이므로
		}

		// insert 
		try {
			if (bno == 0) { // 새글. 댓글아님
				bref = maxBno;
			} else { // bno의 댓글을 의미함.  update 문을 실행해야함.
				String sql_update = "update D_Board set bre_step=bre_step+1 where bref=? and bno<>bref and bre_step>?";
//				String sql_update = "update D_Board set bre_step=" + (bre_step+1) +
//						" where bref="+bref + " and bno<>ref " + 
//						" and bre_step>" +bre_step;
				System.out.println(bno+" : " + bref+" : " +bre_step+" : " +bre_level);
				pstmt = conn.prepareStatement(sql_update);
//				pstmt.setInt(1, bre_step+1);
				pstmt.setInt(1, bref);
				pstmt.setInt(2, bre_step);
				result = pstmt.executeUpdate();
				close(pstmt);
				bre_step++;
				bre_level++;
			}
			
			String sql = "insert into D_Board values (?,?,?,CURRENT_TIMESTAMP,0,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, maxBno);  // bno
			pstmt.setInt(8, bref);    // ref
			pstmt.setInt(9, bre_step);   // re_step
			pstmt.setInt(10, bre_level);  // re_level
			pstmt.setString(2, bsubject);
			pstmt.setString(3, bcontent);
			pstmt.setString(4, bwriter);
			pstmt.setString(5, bwriter);
			pstmt.setString(6, bfilepath);
			pstmt.setString(7, bpwd);
			result = pstmt.executeUpdate();
			if (result < 1) {
				System.out.println("[ejkim]!!! insert 실패 !!!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

}

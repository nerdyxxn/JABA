package jaba.biz.model.service;

import static jaba.common.jdbcdriver.JDBCTemplate.close;
import static jaba.common.jdbcdriver.JDBCTemplate.commit;
import static jaba.common.jdbcdriver.JDBCTemplate.getConnection;
import static jaba.common.jdbcdriver.JDBCTemplate.rollback;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import jaba.store.dao.DBoardDao;
import jaba.store.vo.DBoardVO;

public class DBoardService {

	public int getBoardCount() {
		Connection con = getConnection();
		DBoardDao dao = new DBoardDao();
		int result = dao.getBoardCount(con);
		close(con);
		return result;
	}

	public List<DBoardVO> getBoardAll() {
		Connection con = getConnection();
		List<DBoardVO> result = new DBoardDao().getBoardAll(con);
		close(con);
		return result;
	}
	public List<DBoardVO> getStoreFirstBoard(String store_name) {
		Connection con = getConnection();
		List<DBoardVO> result = new DBoardDao().getStoreFirstBoard(con, store_name);
		close(con);
		return result;
	}
	public List<DBoardVO> getStoreFirstBoardbyId(String store_id) {
		Connection con = getConnection();
		List<DBoardVO> result = new DBoardDao().getStoreFirstBoard(con, store_id);
		close(con);
		return result;
	}
	public List<DBoardVO> getBoardAllbyWriter(String store_name){
		Connection con = getConnection();
		List<DBoardVO> result = new DBoardDao().getBoardAllbyWriter(con, store_name);
		close(con);
		return result;
	}

	public List<DBoardVO> getBoardByPage(int start, int end) {
		Connection con = getConnection();
		List<DBoardVO> result = new DBoardDao().getBoardByPage(con, start, end);
		close(con);
		return result;
	}

	public List<DBoardVO> getBoard(int bno) {
		Connection con = getConnection();
		List<DBoardVO> result = new DBoardDao().getBoard(con, bno);
		close(con);
		return result;
	}

	public int writeBoard(DBoardVO vo) { // d_board 에 1행 추가
		Connection con = getConnection();
		int result = 0;
		try {
			con.setAutoCommit(false);
			result = new DBoardDao().writeBoard(con, vo);
			if (result > 0)
				commit(con);
			else
				rollback(con);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con);
		}
		return result;
	}

}

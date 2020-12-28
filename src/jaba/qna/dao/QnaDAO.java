package jaba.qna.dao;

import static jaba.common.jdbcdriver.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jaba.qna.vo.QnaVO;

public class QnaDAO {
	   PreparedStatement pstmt = null;
	   ResultSet rs = null;
	
	// qna 리스트를 전부 불러와서 List<QnaVO> 를 리턴하는 메소드
	public List<QnaVO> selectQnaList (Connection conn){
		List<QnaVO> qnaList = null;
		String sql = "select * from qna";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				qnaList = new ArrayList<QnaVO>();
				do {
					QnaVO vo = new QnaVO();
					vo.setQna_no(rs.getString("qna_no"));
					vo.setAdmin_id(rs.getString("admin_id"));
					vo.setQna_title(rs.getString("qna_title"));
					vo.setQna_content(rs.getString("qna_content"));
					qnaList.add(vo);
				}while(rs.next());
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		
		
		return qnaList;
	}

}

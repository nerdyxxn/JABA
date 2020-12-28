package jaba.qna.model.service;

import static jaba.common.jdbcdriver.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import jaba.qna.dao.QnaDAO;
import jaba.qna.vo.QnaVO;

public class QnaService {
	
	// qna 리스트를 전부 불러와서 List<QnaVO> 를 리턴하는 메소드
	public List<QnaVO> selectQnaList (){
		List<QnaVO> qnaList = null;
		Connection conn = getConnection();
		QnaDAO dao = new QnaDAO();
		try {
			qnaList = dao.selectQnaList(conn);
			if(qnaList == null) {
				System.out.println("QNA 리스트를 불러오지 못함");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		close(conn);
		return qnaList;
	}

}

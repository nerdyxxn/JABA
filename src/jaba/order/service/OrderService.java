package jaba.order.service;

import static jaba.common.jdbcdriver.JDBCTemplate.*;

import java.sql.Connection;

import jaba.order.dao.OrderDAO;
import jaba.order.vo.OrderVO;

public class OrderService {

	
	public OrderVO insertOrder(String user_id, String menu_id, int order_quantity) {
		OrderVO vo = null;
		Connection conn = getConnection();
		OrderDAO dao = new OrderDAO();
		int result = 0;	// insert 할때 result
		String order_id = null;
		// insert
		try {
			result = dao.insertOrder(conn, user_id, menu_id, order_quantity);
			if(result != 1) {
				System.out.println("insertOrder 실패");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		// order_id가져오기
		try {
			order_id = dao.currentOrderId(conn);
			if(order_id == null) {
				System.out.println("order_id가져오는데 오류 발생");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		// orderVo리턴하기
		try {
			vo = dao.selectOrder(conn, order_id);
			if(vo == null) {
				System.out.println("orderVo가져오는데 오류가 발생했음");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		close(conn);
		return vo;
	}
}

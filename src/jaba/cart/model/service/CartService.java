package jaba.cart.model.service;

import static jaba.common.jdbcdriver.JDBCTemplate.close;
import static jaba.common.jdbcdriver.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jaba.cart.dao.CartDAO;
import jaba.cart.vo.CartNoVO;
import jaba.cart.vo.CartVO;
import jaba.cart.vo.CartViewVO;
import jaba.menu.dao.MenuDAO;
import jaba.menu.vo.CustomVO;
import jaba.order.dao.OrderDAO;
import jaba.order.vo.OrderVO;

public class CartService {

	// CARTNO 장바구니넘버 테이블 insert 시켜주는 메소드
	public String insertCartNo() {
		CartNoVO vo = null;
		Connection conn = getConnection();
		CartDAO dao = new CartDAO();
		int result = 0; // insert 할때 result
		String cart_id = null;
		// insert
		try {
			result = dao.insertCartNo(conn);
			if (result != 1) {
				System.out.println("insertCartNo 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// cart_id가져오기
		try {
			cart_id = dao.currentCartId(conn);
			if (cart_id == null) {
				System.out.println("cart_id가져오는데 오류 발생");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// CartNoVO리턴하기
		try {
			vo = dao.selectCartNo(conn, cart_id);
			if (vo == null) {
				System.out.println("CartNoVO가져오는데 오류가 발생했음");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close(conn);
		return vo.getCart_id();
	}

	// CART 장바구니 테이블에 insert 시켜주는 메소드
	public void insertCart(String order_id, String cart_id, String store_id, int cart_total_price) {
		int result = 0;
		Connection conn = getConnection();
		CartDAO dao = new CartDAO();

		// insert
		try {
			result = dao.insertCart(conn, order_id, cart_id, store_id, cart_total_price);
			if (result != 1) {
				System.out.println("insertCart 실패!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close(conn);
	}

	// cartNo로 cart 테이블을 조회해서 List를 뽑아오는 메소드
	public List<CartVO> selectCartList(String cart_id) {
		List<CartVO> cartList = null;
		Connection conn = getConnection();
		CartDAO dao = new CartDAO();
		// select
		try {
			cartList = dao.selectCartList(conn, cart_id);
			if (cartList == null) {
				System.out.println("CART에 담긴게 없습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close(conn);
		return cartList;
	}

	// cartList를 받아와서 우리가원하는 List<List<~~~~>>형태로 반환하는 메소드
	// cartList에 총가격도 있고 주문id도 있어요
	public List<CartViewVO> cartViewList(List<CartVO> cartList) {
		List<CartViewVO> cartViewVoList = null;
		Connection conn = getConnection();
		String order_id = null;
		int cart_total_price = 0;

		cartViewVoList = new ArrayList<CartViewVO>();
		for (int i = 0; i < cartList.size(); i++) { // 제일큰 틀이 몇번 돌아갈지 판별해주는녀석이어서
			System.out.println((i + 1) + "번째 order의 cart");
			order_id = cartList.get(i).getOrder_id();
			cart_total_price = cartList.get(i).getCart_total_price();
			CartViewVO cartViewVo = new CartViewVO();
			cartViewVo.setCart_total_price(cart_total_price); // 얘는 그냥 바로 채울수있음

			// order_id 들고 order에 갔다오면 orderVo 하나가 나올거고
			// orderVo를 참고하면 바로 order_quantity를 얻을 수 있음
			OrderDAO orderDao = new OrderDAO();
			OrderVO orderVo = orderDao.selectOrder(conn, order_id);
			cartViewVo.setOrder_quantity(orderVo.getOrder_quantity()); // 얘는 집어넣으려면 order 갔다와야합니다.

			MenuDAO menuDao = new MenuDAO();
			// menu_id를 가지고 menu_name을 뽑아내는 메소드
			String menu_name = menuDao.selectMenuName(conn, orderVo.getMenu_id());
			// orderVo를 참고해서 menu_id를 들고 menu테이블을 가면 menu_name을 얻을 수 있음.
			cartViewVo.setMenu_name(menu_name); // 얘는 집어넣으려면 menu 갔다와야합니다.
			// 이 order_id를 이용해서 order 테이블을 조회해야해요
			cartViewVoList.add(cartViewVo);
		}
		close(conn);
		return cartViewVoList;
	}

	public List<List<String>> cartViewCustomList(List<CartViewVO> cartViewVoList, List<CartVO> cartList) {
		List<List<String>> cartViewList = null;
		Connection conn = getConnection();
		cartViewList = new ArrayList<List<String>>();

		MenuDAO menuDao = new MenuDAO();
		for (int i = 0; i < cartViewVoList.size(); i++) {
			List<String> customNameList = new ArrayList<String>();
			List<String> customIdList = new ArrayList<String>();
			// order_id를 통해서 custom_check 테이블을 조회한 다음에 List<Stirng> 형식인 custom_id를 뽑아내야해요
			customIdList = menuDao.selectCustomIdList(conn, cartList.get(i).getOrder_id());
			for (int j = 0; j < customIdList.size(); j++) {
				String custom_name = menuDao.selectCustomNameList(conn, customIdList.get(j));
				customNameList.add(custom_name);
			}
			cartViewList.add(customNameList);
		}
		close(conn);
		return cartViewList;
	}

	// ----------- payment에 데이터를 insert하는 메소드 ----------------

	public void insertPayment(String cart_id, int pay_total_price, String pay_request) {
		int result = 0;
		Connection conn = getConnection();
		CartDAO dao = new CartDAO();
		try {
			result = dao.insertPayment(conn, cart_id, pay_total_price, pay_request);
			if (result != 1) {
				System.out.println("insertPayment 실패!");
			}else {
				System.out.println("payment 성공적으로 insert");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close(conn);
	}
	
	// 현재 pay_id를 가져오는 메소드 
	
}
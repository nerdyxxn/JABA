package jaba.cart.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jaba.cart.model.service.CartService;
import jaba.cart.vo.CartVO;
import jaba.cart.vo.CartViewVO;

/**
 * Servlet implementation class CartListServlet
 */
@WebServlet("/cart/cartList.do")
public class CartListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		CartService cartService = new CartService();
		// new를 안해줘도 될것같은데..
		List<CartVO> cartList = null; // new ArrayList<CartVO>();
		// 세션에 담긴 cartNo를 받아온다.
		// cartNo를 통해 List<CartVO> cartList 를 받아와서 세션에 저장한다.
		String cart_id = (String) request.getSession().getAttribute("cartId");
		cartList = cartService.selectCartList(cart_id);

		if (cartList != null) {
			System.out.println("카트에 들어있는 카트리스트");
			request.getSession().setAttribute("cartList", cartList);
			// cartViewList
			List<CartViewVO> cartViewVoList = null;
			List<List<String>> cartViewList = null;
			
			cartViewVoList = cartService.cartViewList(cartList);
			// cartViewCustomList
			if(cartViewVoList != null) {
			cartViewList = cartService.cartViewCustomList(cartViewVoList, cartList);
			
			// cartViewVoList 세션에 저장
			request.getSession().setAttribute("cartViewVoList", cartViewVoList);
			for(int i=0; i<cartViewVoList.size(); i++) {
				System.out.println("----------------------");
				System.out.println(cartViewVoList.get(i).getMenu_name());
				System.out.println("----------------------");
				for(int j=0; j<cartViewList.get(i).size(); j++) {
					System.out.println(cartViewList.get(i).get(j));
				}
				System.out.println();
			}
			int total_price = 0;
			for(int i=0; i< cartViewVoList.size(); i++) {
				total_price += cartViewVoList.get(i).getCart_total_price();
			}
			request.getSession().setAttribute("total_price", total_price);
			
			// cartViewList 세션에 저장
			request.getSession().setAttribute("cartViewList", cartViewList);
			}
		} else {
			System.out.println("카트에 담긴것이 없거나 리스트를 찾을 수 없습니다.");
		}

		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

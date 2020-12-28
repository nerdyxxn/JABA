package jaba.biz.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jaba.menu.model.service.MenuService;
import jaba.menu.vo.CustomVO;
import jaba.menu.vo.MenuVO;
import jaba.store.model.service.StoreService;
import jaba.store.vo.StoreVO;

/**
 * Servlet implementation class CustomListViewServlet
 */
@WebServlet("/biz/menuDetailView.do")
public class CustomListViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CustomListViewServlet() {
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

		// 클릭한 메뉴정보 request로 가져오자
		StoreVO storevo = (StoreVO) request.getSession().getAttribute("storeVo");
		String store_id = storevo.getStore_id();

		// 만약 menuVo가 있다면 초기화 시켜줌
		// vo받아왔어요
		String menu_name = request.getParameter("menu_name");
		System.out.println("서블릿들어옴 메뉴이름은 : " + menu_name);
		// stroevo와 menu_name을 가지고 menu_id를 알아낼수있음.
		MenuService mService = new MenuService();
		// 선택된 menu_name를 받아와야함
		// menu_name 를 받아왔다고 가정
		// name을 id로 바꿔주는뭔가가 있어야하고
		MenuVO menuVo = mService.selectMenu(store_id, menu_name);
		request.getSession().setAttribute("menuVo", menuVo);

		// 현재 메뉴의 커스텀리스트들을 불러오는 코드

		List<List<CustomVO>> sortCustomList = null;
		sortCustomList = mService.selectCustomListList(menuVo.getMenu_id());

		request.getSession().setAttribute("sortCustomList", sortCustomList);
		
		out.print(menuVo.getMenu_price());
		
		if(sortCustomList.get(0) != null) {	
			System.out.println("해당하는 menu 의 커스텀List 찾았음");
		}else {
			System.out.println("해당하는 menu 의 커스텀List 못 찾았음");
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

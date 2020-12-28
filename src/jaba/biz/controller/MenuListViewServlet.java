package jaba.biz.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jaba.biz.model.service.MenuService;
import jaba.biz.vo.MenuVO;
import jaba.store.model.service.DBoardService;
import jaba.store.model.service.StoreService;
import jaba.store.vo.DBoardVO;
import jaba.store.vo.StoreVO;

/**
 * Servlet implementation class MenuListViewServlet
 */
@WebServlet("/biz/menuList.do")
public class MenuListViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MenuListViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		
		// email 을 파라미터로 가져옴 
		String store_id = request.getParameter("storeId");
		String store_name = request.getParameter("storeName");
		
		
		if(store_id != null) {
		System.out.println(store_id);
		System.out.println(store_id + "의 vo 정보를 가져옴");
		StoreService sService = new StoreService();
		
		StoreVO storeVo = sService.selectStoreId(store_id);	// 이부분 name 으로 수정 
		if(storeVo == null) {
			System.out.println("해당하는 store 정보 없음");
		}
		request.getSession().setAttribute("storeVo", storeVo);	// 찾아온 값을 BizMain.jsp로 넘겨주기위해 세션에 설정해줌
		
		// 현재 매장의 메뉴리스트들을 불러오는 코드 
		System.out.println(request.getRequestedSessionId());
			// 메뉴vo 는 store의 id값을 외래키로 가짐 
		MenuService mService = new MenuService();
		List<List<MenuVO>> sortList = mService.selectmenuListList(store_id);
		request.getSession().setAttribute("sortList", sortList);
		if(sortList != null) {
			System.out.println("해당하는 store 의 메뉴List 찾았음");
		}
		
		//해당 매장 게시판 코드
		DBoardService dService = new DBoardService();
		store_name = storeVo.getStore_name();
		List<DBoardVO> dboardList = dService.getStoreFirstBoard(store_name);
		if(dboardList == null) {
			System.out.println("store에 게시글이 없습니다.");
		}
		System.out.println("store 게시판 불러오기 성공");
		request.getSession().setAttribute("dboardList", dboardList);
		System.out.println(dboardList);
		} else {
			System.out.println(store_name);
			System.out.println(store_name + "의 vo 정보를 가져옴");
			StoreService sService = new StoreService();
			
			StoreVO storeVo = sService.selectStoreName(store_name);	// 이부분 name 으로 수정 
			if(storeVo == null) {
				System.out.println("해당하는 store 정보 없음");
			}
			request.getSession().setAttribute("storeVo", storeVo);	// 찾아온 값을 BizMain.jsp로 넘겨주기위해 세션에 설정해줌
			store_id = storeVo.getStore_id();
			// 현재 매장의 메뉴리스트들을 불러오는 코드 
			System.out.println(request.getRequestedSessionId());
				// 메뉴vo 는 store의 id값을 외래키로 가짐 
			MenuService mService = new MenuService();
			List<List<MenuVO>> sortList = mService.selectmenuListList(store_id);
			request.getSession().setAttribute("sortList", sortList);
			if(sortList != null) {
				System.out.println("해당하는 store 의 메뉴List 찾았음");
			}
			
			//해당 매장 게시판 코드
			DBoardService dService = new DBoardService();
			store_name = storeVo.getStore_name();
			List<DBoardVO> dboardList = dService.getStoreFirstBoard(store_name);
			if(dboardList == null) {
				System.out.println("store에 게시글이 없습니다.");
			}
			System.out.println("store 게시판 불러오기 성공");
			request.getSession().setAttribute("dboardList", dboardList);
			System.out.println(dboardList);
		}
		DBoardService dService = new DBoardService();
		//공지사항으로 들어갈 때 전체 게시판 글들 조회하는 코드
		List<DBoardVO> dboardAllList = dService.getBoardAllbyWriter(store_name);
		if(dboardAllList == null) {
			System.out.println("store의 게시판에 글이 하나도 없습니다");
		}
		System.out.println("store 전체 게시판 조회 성공");
		request.getSession().setAttribute("dboardAllList", dboardAllList);
		
		// 메뉴리스트~~~
		request.getRequestDispatcher("/BizMain.jsp").forward(request, response);
		
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package jaba.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jaba.menu.model.service.MenuService;
import jaba.menu.vo.MenuVO;
import jaba.store.model.service.DBoardService;
import jaba.store.model.service.StoreService;
import jaba.store.vo.DBoardVO;
import jaba.store.vo.StoreVO;

/**
 * Servlet implementation class SelectAllMenuServlet
 */
@WebServlet("/admin/selectStore.do")
public class SelectAllMenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAllMenuServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	execute(request, response);
    	
    }
    

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		execute(request, response);
	}
	
	private void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		
		// store_name 을 파라미터로 가져옴 
		String store_name = request.getParameter("storename");
		System.out.println(store_name);
		System.out.println(store_name + "의 vo 정보를 가져옴");
		StoreService sService = new StoreService();
		StoreVO storeVo = sService.selectStoreName(store_name);	// 이부분 name 으로 수정 
		if(storeVo == null) {
			System.out.println("해당하는 store 정보 없음");
		}
		request.getSession().setAttribute("storeVo", storeVo);	// 찾아온 값을 menu.jsp로 넘겨주기위해 세션에 설정해줌
		
		// 현재 매장의 메뉴리스트들을 불러오는 코드 
		String store_id = storeVo.getStore_id();	// 메뉴vo 는 store의 id값을 외래키로 가짐 
		MenuService mService = new MenuService();
		List<MenuVO> menuList = mService.selectList(store_id);
		request.getSession().setAttribute("menuList", menuList);
		if(menuList != null) {
			System.out.println("해당하는 store 의 메뉴List 찾았음");
		}
		
		DBoardService dService = new DBoardService();
		List<DBoardVO> boardList = dService.getBoardAllbyWriter(store_name);
		request.getSession().setAttribute("boardList", boardList);
		// 메뉴리스트~~~
//		request.getRequestDispatcher("/admin/selectStore.do").forward(request, response); -- 같은 페이지로 다시 이동하니까 무한 루프 걸리는 거 같아
		if(boardList !=null) {
			System.out.println("해당 store의 board를 찾았음");
		} else {
			System.out.println("해당 store의 board 못찾았어");
		}
		out.flush();
		out.close();
	
		
		int pageSize = 5; //  한 페이지당글수
		int pageBlock = 2; // 한 화면에 나타날 페이지 링크 수
		try { 
			// 총 글 개수
			dService = new DBoardService();
			int bCount = dService.getBoardCount();
			// 현재 page 값으로 들고 들어온 것을 확인
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null) {
				pageNum = "1"; // 현재 page 값을 들고 들오온게 없다면 1번째 page 보여주기
				
			}
			int currentPage = Integer.parseInt(pageNum); // 현재 page  

			// 총 페이지 개수 = (충 글개수 / 페이지당글수) + (총 글개수에서 페이지당글개수 나눈 나머지가 0 이라면 0, 나머지가 있다면 페이지 개수를 1 증가함) 
			int pageCount = (bCount / pageSize) + (bCount % pageSize == 0 ? 0 : 1);

			int startPage = 1; // 화면에 나타날 시작 페이지
			int endPage = 1; // 화면에 나나날 마지막 페이지

			if (currentPage % pageBlock == 0) { // 즉 currentPage가 10, 20, 30.. 인 경우 11~20인 페이지, 21~30인 페이지가 보일 수 있음을 방지함
				startPage = ((currentPage / pageBlock) - 1) * pageBlock + 1;
			} else {
				startPage = ((currentPage / pageBlock)) * pageBlock + 1;
			}

			endPage = startPage + pageBlock - 1; // - 1 빼줘야 함. 1~10 --> 즉 1 + 9 = 10, 총 글 35개, 총페이지는 4개, 10
			if (endPage > pageCount)
				endPage = pageCount;

			// 화면에 보여줄 게시글 rownum 구하기
			int startRnum = (currentPage - 1) * pageSize + 1;
			int endRnum = startRnum + pageSize - 1; // currentPage*pageSize
			List<DBoardVO> boardlist = dService.getBoardByPage(startRnum, endRnum);

			if(boardlist != null) {
				System.out.println("aaaaaa");
				request.setAttribute("boardlist", boardlist);
				request.setAttribute("currentPage", currentPage);
				request.setAttribute("startPage", startPage);
				request.setAttribute("endPage", endPage);
				request.setAttribute("bCount", bCount);
				request.getRequestDispatcher("/adminStore.jsp").forward(request, response);
			} else {
				System.out.println("bbbbbb");
				request.setAttribute("errMsg", "작성된 글이 없습니다.");
				request.getRequestDispatcher("/adminStore.jsp").forward(request, response);
			}
		} catch (Exception e) {
			System.out.println("cccccc");
			request.setAttribute("errMsg", "잠시 후 다시 확인해 주세요");
//			request.getRequestDispatcher("/adminStore.jsp").forward(request, response);
		}
		
		
	}
}

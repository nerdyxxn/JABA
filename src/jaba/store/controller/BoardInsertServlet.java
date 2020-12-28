package jaba.store.controller;


import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import jaba.store.model.service.DBoardService;
import jaba.store.vo.DBoardVO;

/**
 * Servlet implementation class BoardInsertServlet
 */
@WebServlet("/boardInsert.lo")
public class BoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String realFolder = "";   // 웹상의 절대 경로
	private final String saveFolder = "/fileSave";
	private final String encType = "utf-8";  // 인코딩 타입
	private final int maxSize = 5*1024*1024; // 최대 업로드 파일크기 5Mb
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardInsertServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	private void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		//request.getContextPath()  --> 프로젝트이름- url 상의 context root 이름
		realFolder = getServletContext().getRealPath(saveFolder);
		//realFolder = "D:\\abc";
		System.out.println(realFolder);
		try { 
			// 전송할 파일명, 서버상의 절대경로, 최대 업로드 크기, 문자코드인코딩방식, 기본보안적용.
			// 전송할 콤포넌트 생성과 파일을 전송함.
			MultipartRequest mRequest = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());			

			// 전송된 파일 정보를 가져옴
			String fileName1 = "";
			Enumeration<?> files = mRequest.getFileNames();
			while(files.hasMoreElements()) {
				String name = (String)files.nextElement();   // input file로 된 name="xxx"
				String filename = mRequest.getFilesystemName(name);   // 서버에 저장된 파일이름
				fileName1 = filename;
				String original = mRequest.getOriginalFileName(name);  // 전송되어오기전 원래이름
				String type = mRequest.getContentType(name);  // 전송된 파일의 타입
				File f1= mRequest.getFile(name);  // name을 이용해서 파일 객체 생성 여부 확인 작업.
				if (f1==null) {  // name을 이용해서 파일 객체 생성에 실패하면
					System.out.println("파일 업로드 실패");   // 실패 오류메시지  
					fileName1 = "";
				} else {
					System.out.println(f1.length());   // 그 파일의 크기 
				}
				System.out.println(name);
				System.out.println(filename);
				System.out.println(original);
				System.out.println(type);
			}
			
			// form 에서 받아온 데이터 목록을 가져와서 하나씩 꺼냄.
//			Enumeration<?> params = mRequest.getParameterNames();
//			while(params.hasMoreElements()) {
//				String name = (String)params.nextElement();
//				String value = mRequest.getParameter(name);
//				System.out.println(name+" : "+ value);
//			}
			
			//내장객체
			DBoardVO vo = new DBoardVO();
			// hidden으로 들고 들어온 데이터 - 원본글, 댓글에 대한 정보를 가지고 있음.
			vo.setBno(Integer.parseInt(mRequest.getParameter("bno")));
			vo.setBref(Integer.parseInt(mRequest.getParameter("bref")));
			vo.setBre_step(Integer.parseInt(mRequest.getParameter("bre_step")));
			vo.setBre_level(Integer.parseInt(mRequest.getParameter("bre_level")));
			// 직접 입력한 데이터들
			vo.setBwriter(mRequest.getParameter("bwriter"));
			vo.setBsubject(mRequest.getParameter("bsubject"));
			vo.setBcontent(mRequest.getParameter("bcontent"));
			vo.setBfilepath(fileName1);
			vo.setBpwd(mRequest.getParameter("bpwd"));
			
			DBoardService dService = new DBoardService();
			int result = dService.writeBoard(vo);
			String store_name = vo.getBwrite(); //오타인데 바꾸기 쉽지 않네요,,,
			
			
			if(result>=1) {
				System.out.println("aaa");
				request.getRequestDispatcher("/biz/menuList.do?storeName="+store_name).forward(request, response);
			} else{
				System.out.println("bbb");
				request.getRequestDispatcher("/BizMain.jsp").forward(request, response);
			}
		} catch (NumberFormatException e) {
			System.out.println("ccc");
			request.getRequestDispatcher("/BizMain.jsp").forward(request, response);
		} catch (NullPointerException e) {
			System.out.println("ddd");
			request.getRequestDispatcher("/BizMain.jsp").forward(request, response);
		}
		
	}
}

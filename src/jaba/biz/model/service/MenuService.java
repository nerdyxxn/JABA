package jaba.biz.model.service;

import static jaba.common.jdbcdriver.JDBCTemplate.close;
import static jaba.common.jdbcdriver.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import jaba.biz.dao.MenuDAO;
import jaba.biz.vo.CustomVO;
import jaba.biz.vo.MenuVO;

public class MenuService {
   public MenuService() {

   }

   // menu 리스트 정보를 긁어오는 메소드
   public List<MenuVO> selectList(String store_id) {
      List<MenuVO> list = null;
      Connection conn = getConnection();
      try {
         MenuDAO dao = new MenuDAO();
         list = dao.selectList(conn, store_id);
         close(conn);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return list;
   }
   
	// distinct 메뉴 카테고리 해서 카테고리 갯수와 카테고리 이름을 가져오는 메소드 - 서비스
   public List<String> selectCategoryList(String store_id){
	   List<String> categoryList = null;
	   Connection conn = getConnection();
	   try {
		   MenuDAO dao = new MenuDAO();
		   categoryList = dao.selectCategoryList(conn, store_id);
		   System.out.println("서비스파일부분 test");
		   close(conn);
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
	   
	   return categoryList;
   }
   
   // store_id 와 메뉴 카테고리 이름으로 menu_ListVo를 불러오는 메소드 - 서비스
   public List<MenuVO> selectListByCategory(String store_id, String menu_category){
	   List<MenuVO> list = null;
	   Connection conn = getConnection();
	   try {
		   MenuDAO dao = new MenuDAO();
		   list = dao.selectListByCategory(conn, store_id, menu_category);
		   close(conn);
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
	   return list;
   }
   
   
   // store_id를 받아와서 메뉴카테고리 별로 List<menu_ListVo>를 만들어주는 메소드
   public List<List<MenuVO>> selectmenuListList(String store_id){
	   List<List<MenuVO>> sortList = null;
	   // 매장 id를 통해서 카테고리 리스트를 불러옴
	   List<String> categoryList = selectCategoryList(store_id);
	   // sortList 객체 생성
	   sortList = new ArrayList<List<MenuVO>>();
	   // 사이즈 categoryList 만큼 반복
	   for(int i=0; i<categoryList.size(); i++) {
		   List<MenuVO> list = selectListByCategory(store_id, categoryList.get(i));
		   sortList.add(list);
	   }
	   return sortList;
   }
   
   // 메뉴의이름과 store_id를 가지고 menu_id를 String 으로 전달하는 메소드 
   public MenuVO selectMenu(String store_id, String menu_name) {
	   MenuVO vo = new MenuVO();
	   Connection conn = getConnection();
	   try {
		   MenuDAO dao = new MenuDAO();
		   vo = dao.selectMenu(conn, store_id, menu_name);
		   close(conn);
	   }catch(Exception e) {
		   e.printStackTrace();
		   System.out.println("menu_name을 menu_id로 가져올수없음");
	   }
	   return vo;
   }
   
   // ******************************** CUSTOM ********************************
   // custom 리스트 정보를 긁어오는 메소드
   
   public List<CustomVO> selectCustomList(String menu_id) {
	      List<CustomVO> list = null;
	      Connection conn = getConnection();
	      try {
	         MenuDAO dao = new MenuDAO();
	         list = dao.selectCustomList(conn, menu_id);
	         close(conn);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return list;
	   }
   
   
   // distinct 커스텀 카테고리 해서 커스텀 카테고리 갯수와 커스텀 카테고리 이름을 가져오는 메소드 - 서비스
   public List<String> selectCustomCategoryList(String menu_id){
	   List<String> categoryCustomList = null;
	   Connection conn = getConnection();
	   try {
		   MenuDAO dao = new MenuDAO();
		   categoryCustomList = dao.selectCustomCategoryList(conn, menu_id);
		   System.out.println("서비스파일부분 Custom test");
		   close(conn);
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
	   
	   return categoryCustomList;
   }
   
   
   // menu_id 와 커스텀 카테고리 이름으로 category_ListVo를 불러오는 메소드
   //
   public List<CustomVO> selectListByCustomCategory(String menu_id, String custom_category){
	   List<CustomVO> list = null;
	   Connection conn = getConnection();
	   try {
		   MenuDAO dao = new MenuDAO();
		   list = dao.selectListByCustomCategory(conn, menu_id, custom_category);
		   close(conn);
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
	   return list;
   }
   
   
   // menu_id를 받아와서 커스텀 메뉴카테고리 별로 List<?????_ListVo>를 만들어주는 메소드
   
   public List<List<CustomVO>> selectCustomListList(String menu_id){
	   List<List<CustomVO>> sortCustomList = null;
	   // 매장 id를 통해서 카테고리 리스트를 불러옴
	   List<String> categoryCustomList = selectCustomCategoryList(menu_id);
	   // sortList 객체 생성
	   sortCustomList = new ArrayList<List<CustomVO>>();
	   // 사이즈 categoryList 만큼 반복
	   for(int i=0; i<categoryCustomList.size(); i++) {
		   List<CustomVO> list = selectListByCustomCategory(menu_id, categoryCustomList.get(i));
		   sortCustomList.add(list);
	   }
	   return sortCustomList;
   }
// Custom_check 테이블에 체크된 커스텀 항목들 데이터 추가하는 메소드 (ORDER_ID와 CUSTOM_ID를 이용해서 한 개 INSERT)
	public int insertCustomCheck(String menu_id, String custom_name,String order_id) {
		int finalResult = 0;
		Connection conn = getConnection();
		MenuDAO dao = new MenuDAO();
		int result = 0; // insert 할때 result
		String custom_id = null;

		// custom_check_id 가져오기
		try {
			custom_id = dao.selectCustomId(conn, menu_id, custom_name);
			if (custom_id == null) {
				System.out.println("custom_check_id가져오는데 오류 발생");
			}else {
				System.out.println("custom_name의 custom_id : " + custom_id);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// insert
		try {
			result = dao.insertCustomCheck(conn, custom_id, order_id);
			if (result != 1) {
				System.out.println("insertCustomCheck 실패");
			}else {
				System.out.println("custom_check에 성공적으로 insert");
				// 성공하면 result를 1로 
				finalResult = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close(conn);
		return finalResult;
	}


   
}
package jaba.biz.dao;

import static jaba.common.jdbcdriver.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jaba.biz.vo.CustomVO;
import jaba.biz.vo.MenuVO;
import jaba.store.vo.StoreVO;

public class MenuDAO {

	PreparedStatement pstmt = null;
	ResultSet rs = null;

	// 해당 매장의 모든 메뉴를 List로 불러오는 메소드작성
	public List<MenuVO> selectList(Connection conn, String store_id) {
		List<MenuVO> list = null;
		String sql = "select * from menu where store_id=?"; // 외래키로 가져와야 한다!
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, store_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				list = new ArrayList<MenuVO>();
				do {
					MenuVO vo = new MenuVO();

					vo.setMenu_id(rs.getString("menu_id"));
					vo.setStore_id(rs.getString("store_id"));
					vo.setMenu_name(rs.getString("menu_name"));
					vo.setMenu_price(rs.getInt("menu_price"));
					vo.setMenu_img(rs.getString("menu_img"));
					vo.setMenu_description(rs.getString("menu_description"));
					vo.setMenu_category(rs.getString("menu_category"));
					vo.setMenu_available(rs.getInt("menu_available"));

					list.add(vo);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return list;
	}

	// 카테고리별로 뽑아올 MENU List

	// distinct 메뉴 카테고리 해서 카테고리 갯수와 카테고리 이름을 가져오는 메소드
	public List<String> selectCategoryList(Connection conn, String store_id) {
		List<String> categoryList = null;
		String sql = "SELECT DISTINCT MENU_CATEGORY from menu where store_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, store_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				categoryList = new ArrayList<String>();
				do {
					String menu_category = rs.getString("MENU_CATEGORY");
					categoryList.add(menu_category);
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return categoryList;
	}

	// store_id 와 메뉴 카테고리 이름으로 menu_ListVo를 불러오는 메소드
	public List<MenuVO> selectListByCategory(Connection conn, String store_id, String menu_category) {
		List<MenuVO> list = null;
		String sql = "select * from menu where store_id=? and MENU_CATEGORY=?"; // 외래키로 가져와야 한다!
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, store_id);
			pstmt.setString(2, menu_category);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				list = new ArrayList<MenuVO>();
				do {
					MenuVO vo = new MenuVO();

					vo.setMenu_id(rs.getString("menu_id"));
					vo.setStore_id(rs.getString("store_id"));
					vo.setMenu_name(rs.getString("menu_name"));
					vo.setMenu_price(rs.getInt("menu_price"));
					vo.setMenu_img(rs.getString("menu_img"));
					vo.setMenu_description(rs.getString("menu_description"));
					vo.setMenu_category(rs.getString("menu_category"));
					vo.setMenu_available(rs.getInt("menu_available"));

					list.add(vo);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return list;
	}

	// store_name 과 menu_name을 가지고 menuVO 한개를 return
	public MenuVO selectMenu(Connection conn, String store_id, String menu_name) {
		MenuVO selectMenu = null;
		String sql = "select * from menu where store_id=? and menu_name=?";
		// 메뉴이름 중복되면 안된다.
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, store_id);
			pstmt.setString(2, menu_name);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				selectMenu = new MenuVO();
				selectMenu.setMenu_id(rs.getString("menu_id"));
				selectMenu.setStore_id(rs.getString("store_id"));
				selectMenu.setMenu_name(rs.getString("menu_name"));
				selectMenu.setMenu_price(rs.getInt("menu_price"));
				selectMenu.setMenu_img(rs.getString("menu_img"));
				selectMenu.setMenu_description(rs.getString("menu_description"));
				selectMenu.setMenu_category(rs.getString("menu_category"));
				selectMenu.setMenu_available(rs.getInt("menu_available"));
			} else { // store가 없으면
				System.out.println("DB에 일치하는 Menu 정보 없음");
				selectMenu = null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return selectMenu;
	}
	
	// menu_id 를 가지고 menu_name을 String 타입으로 반환하는 메소드 
	public String selectMenuName(Connection conn, String menu_id) {
		String menu_name = null;
		String sql = "select * from menu where menu_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, menu_id);
			rs = pstmt.executeQuery();
			// 한개만 나올것을 알고있기 때문에 do-while을 쓰지않아요
			if(rs.next()) {
				menu_name = rs.getString("menu_name");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return menu_name;
	}
	

	// *************************************** CUSTOM
	// ***************************************

	// 해당 메뉴의 id를 참고하여 해당메뉴의 커스텀을 불러오고 List<customVO> 를 return 하는 메소드
	public List<CustomVO> selectCustomList(Connection conn, String menu_id) {
		List<CustomVO> list = null;
		String sql = "select * from custom where menu_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, menu_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				list = new ArrayList<CustomVO>();
				do {
					CustomVO vo = new CustomVO();

					vo.setCustom_id(rs.getString("custom_id"));
					vo.setMenu_id(rs.getString("menu_id"));
					vo.setCustom_name(rs.getString("custom_name"));
					vo.setCustom_price(rs.getInt("custom_price"));
					vo.setCustom_category(rs.getString("custom_category"));

					list.add(vo);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return list;
	}

	// 해당 메뉴의 커스텀 목록 이름을 List<String> 형태로 가져오는 메소드
	public List<String> selectCustomCategoryList(Connection conn, String menu_id) {
		List<String> customList = null;
		String sql = "SELECT DISTINCT CUSTOM_CATEGORY FROM CUSTOM WHERE menu_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, menu_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				customList = new ArrayList<String>();
				do {
					String custom_category = rs.getString("custom_category");
					customList.add(custom_category);
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return customList;
	}

	// menu_id 와 커스텀 카테고리 이름으로 category_ListVo를 불러오는 메소드
	public List<CustomVO> selectListByCustomCategory(Connection conn, String menu_id, String custom_category) {
		List<CustomVO> list = null;
		String sql = "select * from custom where menu_id=? and CUSTOM_CATEGORY=?"; // 외래키로 가져와야 한다!
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, menu_id);
			pstmt.setString(2, custom_category);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				list = new ArrayList<CustomVO>();
				do {
					CustomVO vo = new CustomVO();

					vo.setCustom_id(rs.getString("custom_id"));
					vo.setMenu_id(rs.getString("menu_id"));
					vo.setCustom_name(rs.getString("custom_name"));
					vo.setCustom_price(rs.getInt("custom_price"));
					vo.setCustom_category(rs.getString("custom_category"));

					list.add(vo);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return list;
	}

	// *************************************** CUSTOM_CHECK
	// ***************************************

	// Custom_check 테이블에 체크된 커스텀 항목들 데이터 추가하는 메소드 (ORDER_ID와 CUSTOM_ID를 이용해서 한 개
	// INSERT)
	public int insertCustomCheck(Connection conn, String custom_id, String order_id) {
		int result = 0;
		String sql = "insert into Custom_check (custom_check_id, custom_id, order_id) values (('K' || LPAD(CUSTOM_SEQ.nextval, 5, 0)),?,?)";
		/*
		 * custom_check_id VARCHAR2(10) NOT NULL, custom_id` VARCHAR2(10) NOT NULL,
		 * order_id VARCHAR2(10) NOT NULL
		 */
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, custom_id);
			pstmt.setString(2, order_id);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(pstmt);
		return result;
	}
	
	// select * from custom where menu_id=? and custom_name=?
    // SELECT * FROM CUSTOM WHERE MENU_ID=? AND CUSTOM_NAME=? --> 1개의 커스텀메뉴가 찾아짐
    // 거기서 커스텀 CUSTOM_ID를 리턴해야함 STRING
    public String selectCustomId(Connection conn, String menu_id, String custom_name) {
       String sql = "SELECT * FROM CUSTOM WHERE MENU_ID=? AND CUSTOM_NAME=?";
       String custom_id = null;
       
       try {
          pstmt = conn.prepareStatement(sql);
          pstmt.setString(1, menu_id);
          pstmt.setString(2, custom_name);
          
          rs = pstmt.executeQuery();
          
          if (rs.next()) {
             custom_id = rs.getString("custom_id");
          }
       } catch (SQLException e) {
          e.printStackTrace();
       }
       close(rs);
       close(pstmt);
       return custom_id;
    }
    
    // order_id를 통해서 custom_check 테이블을 조회한 다음에 List<Stirng> 형식인 custom_id를 뽑아내야해요 
    public List<String> selectCustomIdList(Connection conn, String order_id){
    	List<String> CustomIdList = null;
        String sql = "SELECT * FROM CUSTOM_CHECK WHERE ORDER_ID=?";
        try {
        	pstmt = conn.prepareStatement(sql);
        	pstmt.setString(1, order_id);
        	rs = pstmt.executeQuery();
        	if(rs.next()) {
        		CustomIdList = new ArrayList<String>();
        		do {
        			String custom_id = rs.getString("custom_id");
        			CustomIdList.add(custom_id);
        		}while(rs.next());
        	}
        }catch(SQLException e) {
        	e.printStackTrace();
        }
    	close(rs);
    	close(pstmt);
    	return CustomIdList;
    }
    
    // custom_check 에서 들고온 custom_id를 가지고 custom_name 을 뽑아내는 메소드
    public String selectCustomNameList(Connection conn, String custom_id) {
    	String custom_name = null;
    	String sql = "select * from custom where custom_id=?";
    	try {
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1, custom_id);
    		rs = pstmt.executeQuery();
    		// custom_id가 pk이기 때문에 rs는 1개
    		if(rs.next()) {
    			custom_name = rs.getString("custom_name");
    		}else {
    			System.out.println("custom_name을 가져오는데 실패(DAO)");
    		}
    	}catch(SQLException e) {
    		e.printStackTrace();
    	}
    	close(rs);
    	close(pstmt);
    	return custom_name;
    }
    
    
    

}
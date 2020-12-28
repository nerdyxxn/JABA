package jaba.qna.vo;
//이름          널?       유형             
//----------- -------- -------------- 
//QNA_NO      NOT NULL VARCHAR2(10)   
//ADMIN_ID             VARCHAR2(100)  
//QNA_TITLE            VARCHAR2(200)  
//QNA_CONTENT          VARCHAR2(2000) 
//QNA_TIME             DATE     

import java.sql.Date;

public class QnaVO {
	String qna_no;
	String admin_id;
	String qna_title;
	String qna_content;
	Date qna_time;
	
	public String getQna_no() {
		return qna_no;
	}
	public void setQna_no(String qna_no) {
		this.qna_no = qna_no;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public Date getQna_time() {
		return qna_time;
	}
	public void setQna_time(Date qna_time) {
		this.qna_time = qna_time;
	}
	

}

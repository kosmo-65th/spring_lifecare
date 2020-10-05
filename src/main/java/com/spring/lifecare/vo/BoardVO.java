package com.spring.lifecare.vo;

import java.sql.Timestamp;

public class BoardVO {
	private int  board_sortnum; //글번호
	private String customer_id;	//작성자
	private String board_subject; //글 제목
	private String board_content; //글 내용
	private Timestamp board_writedate;	//작성날짜
	private String board_replycode; // 답변 상태코드
	private String board_reply; // 답변글
	private int rNum; // 순서용
	private Timestamp board_replydate;	//답변작성날짜
	
	public int getrNum() {
		return rNum;
	}
	public Timestamp getBoard_replydate() {
		return board_replydate;
	}
	public void setBoard_replydate(Timestamp board_replydate) {
		this.board_replydate = board_replydate;
	}
	public void setrNum(int rNum) {
		this.rNum = rNum;
	}
	public int getBoard_sortnum() {
		return board_sortnum;
	}
	public void setBoard_sortnum(int board_sortnum) {
		this.board_sortnum = board_sortnum;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getBoard_subject() {
		return board_subject;
	}
	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public Timestamp getBoard_writedate() {
		return board_writedate;
	}
	public void setBoard_writedate(Timestamp board_writedate) {
		this.board_writedate = board_writedate;
	}
	public String getBoard_replycode() {
		return board_replycode;
	}
	public void setBoard_replycode(String board_replycode) {
		this.board_replycode = board_replycode;
	}
	public String getBoard_reply() {
		return board_reply;
	}
	public void setBoard_reply(String board_reply) {
		this.board_reply = board_reply;
	}
	
}


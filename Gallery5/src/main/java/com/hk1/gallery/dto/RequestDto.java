package com.hk1.gallery.dto;

import java.util.Date;

public class RequestDto {

	private int r_no;
	private int r_send;
	private String r_sendname;
	private int r_receive;
	private String r_receivename;
	private String r_title;
	private String r_content;
	private Date r_regdate;
	private int r_agree;
	
	
	public RequestDto() {
		super();
	}


	public int getR_no() {
		return r_no;
	}


	public RequestDto setR_no(int r_no) {
		this.r_no = r_no;
		return this;
	}


	public int getR_send() {
		return r_send;
	}


	public RequestDto setR_send(int r_send) {
		this.r_send = r_send;
		return this;
	}


	public String getR_sendname() {
		return r_sendname;
	}


	public RequestDto setR_sendname(String r_sendname) {
		this.r_sendname = r_sendname;
		return this;
	}


	public int getR_receive() {
		return r_receive;
	}


	public RequestDto setR_receive(int r_receive) {
		this.r_receive = r_receive;
		return this;
	}


	public String getR_receivename() {
		return r_receivename;
	}


	public RequestDto setR_receivename(String r_receivename) {
		this.r_receivename = r_receivename;
		return this;
	}


	public String getR_title() {
		return r_title;
	}


	public RequestDto setR_title(String r_title) {
		this.r_title = r_title;
		return this;
	}


	public String getR_content() {
		return r_content;
	}


	public RequestDto setR_content(String r_content) {
		this.r_content = r_content;
		return this;
	}


	public Date getR_regdate() {
		return r_regdate;
	}


	public RequestDto setR_regdate(Date r_regdate) {
		this.r_regdate = r_regdate;
		return this;
	}


	public int getR_agree() {
		return r_agree;
	}


	public RequestDto setR_agree(int r_agree) {
		this.r_agree = r_agree;
		return this;
	}


	@Override
	public String toString() {
		return "RequestDto [r_no=" + r_no + ", r_send=" + r_send + ", r_sendname=" + r_sendname + ", r_receive="
				+ r_receive + ", r_receivename=" + r_receivename + ", r_title=" + r_title + ", r_content=" + r_content
				+ ", r_regdate=" + r_regdate + ", r_agree=" + r_agree + "]";
	}

}

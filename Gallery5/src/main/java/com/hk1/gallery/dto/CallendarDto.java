package com.hk1.gallery.dto;

public class CallendarDto {
	private int c_no;
	private String c_title;
	private String c_content;
	private String c_start;
	private String c_end;
	private int g_no;
	
	public CallendarDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public int getC_no() {
		return c_no;
	}

	public CallendarDto setC_no(int c_no) {
		this.c_no = c_no;
		return this;
	}

	public String getC_title() {
		return c_title;
	}

	public CallendarDto setC_title(String c_title) {
		this.c_title = c_title;
		return this;
	}

	public String getC_content() {
		return c_content;
	}

	public CallendarDto setC_content(String c_content) {
		this.c_content = c_content;
		return this;
	}

	public String getC_start() {
		return c_start;
	}

	public CallendarDto setC_start(String c_start) {
		this.c_start = c_start;
		return this;
	}

	public String getC_end() {
		return c_end;
	}

	public CallendarDto setC_end(String c_end) {
		this.c_end = c_end;
		return this;
	}

	public int getG_no() {
		return g_no;
	}

	public CallendarDto setG_no(int g_no) {
		this.g_no = g_no;
		return this;
	}

	@Override
	public String toString() {
		return "CallendarDto [c_no=" + c_no + ", c_title=" + c_title + ", c_content=" + c_content + ", c_start="
				+ c_start + ", c_end=" + c_end + ", g_no=" + g_no + "]";
	}
}

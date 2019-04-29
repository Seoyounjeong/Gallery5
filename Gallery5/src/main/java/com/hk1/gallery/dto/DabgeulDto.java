package com.hk1.gallery.dto;

import java.util.Date;

public class DabgeulDto {
	private int d_no;
	private int e_no;
	private String d_content;
	private int m_no;
	private String m_name;
	private Date m_regdate;
	
	public DabgeulDto() {
		super();
		// TODO Auto-generated constructor stub
	}


	public int getD_no() {
		return d_no;
	}

	public DabgeulDto setD_no(int d_no) {
		this.d_no = d_no;
		return this;
	}

	public int getE_no() {
		return e_no;
	}

	public DabgeulDto setE_no(int e_no) {
		this.e_no = e_no;
		return this;
	}

	public String getD_content() {
		return d_content;
	}

	public DabgeulDto setD_content(String d_content) {
		this.d_content = d_content;
		return this;
	}

	public int getM_no() {
		return m_no;
	}

	public DabgeulDto setM_no(int m_no) {
		this.m_no = m_no;
		return this;
	}

	public String getM_name() {
		return m_name;
	}

	public DabgeulDto setM_name(String m_name) {
		this.m_name = m_name;
		return this;
	}

	public Date getM_regdate() {
		return m_regdate;
	}

	public DabgeulDto setM_regdate(Date m_regdate) {
		this.m_regdate = m_regdate;
		return this;
	}

	@Override
	public String toString() {
		return "DabgeulDto [d_no=" + d_no + ", e_no=" + e_no + ", d_content=" + d_content + ", m_no=" + m_no
				+ ", m_name=" + m_name + ", m_regdate=" + m_regdate + "]";
	}
	
}

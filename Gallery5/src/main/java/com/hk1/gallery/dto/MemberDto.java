package com.hk1.gallery.dto;

public class MemberDto {
	private int m_no;
	private String m_id;
	private String m_name;
	private String m_address;
	private String m_tel;
	private int m_grade;
	
	
	public MemberDto() {
		super();
	}


	public int getM_no() {
		return m_no;
	}


	public MemberDto setM_no(int m_no) {
		this.m_no = m_no;
		return this;
	}


	public String getM_id() {
		return m_id;
	}


	public MemberDto setM_id(String m_id) {
		this.m_id = m_id;
		return this;
	}


	public String getM_name() {
		return m_name;
	}


	public MemberDto setM_name(String m_name) {
		this.m_name = m_name;
		return this;
	}


	public String getM_address() {
		return m_address;
	}


	public MemberDto setM_address(String m_address) {
		this.m_address = m_address;
		return this;
	}


	public String getM_tel() {
		return m_tel;
	}


	public MemberDto setM_tel(String m_tel) {
		this.m_tel = m_tel;
		return this;
	}


	public int getM_grade() {
		return m_grade;
	}


	public MemberDto setM_grade(int m_grade) {
		this.m_grade = m_grade;
		return this;
	}


	@Override
	public String toString() {
		return "MemberDto [m_no=" + m_no + ", m_id=" + m_id + ", m_name=" + m_name + ", m_address=" + m_address
				+ ", m_tel=" + m_tel + ", m_grade=" + m_grade + "]";
	}
	
	

}

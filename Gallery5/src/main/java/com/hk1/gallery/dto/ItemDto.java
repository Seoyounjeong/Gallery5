package com.hk1.gallery.dto;

public class ItemDto {
	private int i_no;
	private int e_no;
	private String i_name;
	private String i_explain;
	private String i_img;
	private int i_price;
	private int a_no;
	private int m_no;
	
	
	public ItemDto() {
		super();
	}

	public ItemDto(int i_no, int e_no, String i_name, String i_explain, String i_img, int i_price, int a_no, int m_no) {
		super();
		this.i_no = i_no;
		this.e_no = e_no;
		this.i_name = i_name;
		this.i_explain = i_explain;
		this.i_img = i_img;
		this.i_price = i_price;
		this.a_no = a_no;
		this.m_no = m_no;
	}
	
	

	public int getI_no() {
		return i_no;
	}


	public ItemDto setI_no(int i_no) {
		this.i_no = i_no;
		return this;
	}


	public int getE_no() {
		return e_no;
	}


	public ItemDto setE_no(int e_no) {
		this.e_no = e_no;
		return this;
	}


	public String getI_name() {
		return i_name;
	}


	public ItemDto setI_name(String i_name) {
		this.i_name = i_name;
		return this;
	}


	public String getI_explain() {
		return i_explain;
	}


	public ItemDto setI_explain(String i_explain) {
		this.i_explain = i_explain;
		return this;
	}


	public String getI_img() {
		return i_img;
	}


	public ItemDto setI_img(String i_img) {
		this.i_img = i_img;
		return this;
	}


	public int getI_price() {
		return i_price;
	}


	public ItemDto setI_price(int i_price) {
		this.i_price = i_price;
		return this;
	}


	public int getA_no() {
		return a_no;
	}


	public ItemDto setA_no(int a_no) {
		this.a_no = a_no;
		return this;
	}


	public int getM_no() {
		return m_no;
	}


	public ItemDto setM_no(int m_no) {
		this.m_no = m_no;
		return this;
	}


	@Override
	public String toString() {
		return "ItemDto [i_no=" + i_no + ", e_no=" + e_no + ", i_name=" + i_name + ", i_explain=" + i_explain
				+ ", i_img=" + i_img + ", i_price=" + i_price + ", a_no=" + a_no + ", m_no=" + m_no + "]";
	}
	
}

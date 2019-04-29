package com.hk1.gallery.dto;

public class ExhibitionDto {

	private int e_no;
	private String e_title;
	private String e_explain;
	private int a_no;
	private String a_name;
	private int e_click;
	private String e_img;      
	
	public ExhibitionDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ExhibitionDto(int e_no,String e_title,String e_explain,int a_no,
			String a_name,int e_click,String e_img) {
		super();
		this.e_no=e_no;
		this.e_title=e_title;
		this.e_explain=e_explain;
		this.a_no=a_no;
		this.a_name=a_name;
		this.e_click=e_click;
		this.e_img=e_img;
		
	}
	
	

	public int getE_no() {
		return e_no;
	}

	public ExhibitionDto setE_no(int e_no) {
		this.e_no = e_no;
		return this;
	}

	public String getE_title() {
		return e_title;
	}

	public ExhibitionDto setE_title(String e_title) {
		this.e_title = e_title;
		return this;
	}

	public String getE_explain() {
		return e_explain;
	}

	public ExhibitionDto setE_explain(String e_explain) {
		this.e_explain = e_explain;
		return this;
	}

	public int getA_no() {
		return a_no;
	}

	public ExhibitionDto setA_no(int a_no) {
		this.a_no = a_no;
		return this;
	}

	public String getA_name() {
		return a_name;
	}

	public ExhibitionDto setA_name(String a_name) {
		this.a_name = a_name;
		return this;
	}

	public int getE_click() {
		return e_click;
	}

	public ExhibitionDto setE_click(int e_click) {
		this.e_click = e_click;
		return this;
	}

	@Override
	public String toString() {
		return "ExhibitionDto [e_no=" + e_no + ", e_title=" + e_title + ", e_explain=" + e_explain + ", a_no=" + a_no
				+ ", a_name=" + a_name + ", e_click=" + e_click + "]";
	}

	public String getE_img() {
		return e_img;
	}

	public ExhibitionDto setE_img(String e_img) {
		this.e_img = e_img;
		return this;
	}
	
}

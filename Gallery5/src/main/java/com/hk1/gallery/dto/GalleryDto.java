package com.hk1.gallery.dto;

public class GalleryDto {
	private int g_no;
	private int m_no;
	private String g_name;
	private String g_adress;
	private String g_tel;
	private String g_img1;
	private String g_img2;
	private String g_img3;
	private String g_img4;
	private String g_intro;
	private int g_state;
	private String yg_state;
	
	public GalleryDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getG_no() {
		return g_no;
	}

	public GalleryDto setG_no(int g_no) {
		this.g_no = g_no;
		return this;
	}

	public int getM_no() {
		return m_no;
	}

	public GalleryDto setM_no(int m_no) {
		this.m_no = m_no;
		return this;
	}

	public String getG_name() {
		return g_name;
	}

	public GalleryDto setG_name(String g_name) {
		this.g_name = g_name;
		return this;
	}

	public String getG_adress() {
		return g_adress;
	}

	public GalleryDto setG_adress(String g_adress) {
		this.g_adress = g_adress;
		return this;
	}

	public String getG_tel() {
		return g_tel;
	}

	public GalleryDto setG_tel(String g_tel) {
		this.g_tel = g_tel;
		return this;
	}

	public String getG_img1() {
		return g_img1;
	}

	public GalleryDto setG_img1(String g_img1) {
		this.g_img1 = g_img1;
		return this;
	}

	public String getG_img2() {
		return g_img2;
	}

	public GalleryDto setG_img2(String g_img2) {
		this.g_img2 = g_img2;
		return this;
	}

	public String getG_img3() {
		return g_img3;
	}

	public GalleryDto setG_img3(String g_img3) {
		this.g_img3 = g_img3;
		return this;
	}

	public String getG_img4() {
		return g_img4;
	}

	public GalleryDto setG_img4(String g_img4) {
		this.g_img4 = g_img4;
		return this;
	}

	public String getG_intro() {
		return g_intro;
	}

	public GalleryDto setG_intro(String g_intro) {
		this.g_intro = g_intro;
		return this;
	}

	public int getG_state() {
		return g_state;
	}

	public GalleryDto setG_state(int g_state) {
		this.g_state = g_state;
		return this;
	}
	
	public String getYg_state() {
		return yg_state;
	}

	public void setYg_state(String yg_state) {
		this.yg_state = yg_state;
	}

	

	@Override
	public String toString() {
		return "GalleryDto [g_no=" + g_no + ", m_no=" + m_no + ", g_name=" + g_name + ", g_adress=" + g_adress
				+ ", g_tel=" + g_tel + ", g_img1=" + g_img1 + ", g_img2=" + g_img2 + ", g_img3=" + g_img3 + ", g_img4="
				+ g_img4 + ", g_intro=" + g_intro + ", g_state=" + g_state + "]";
	}
	
	
}

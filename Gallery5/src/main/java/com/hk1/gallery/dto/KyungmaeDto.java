package com.hk1.gallery.dto;

public class KyungmaeDto {

	private int k_no ;
	private int i_no ;
	private String i_name;
	private String i_img;
	private int k_first_price;
	private int k_first_no;
	private String k_first_name;
	private int k_second_price;
	private int k_second_no;
	private String k_second_name;
	private String k_regdate; //종료일 입니다 / 등록일+7일
	private String k_state;
	
	public int getK_no() {
		return k_no;
	}
	public KyungmaeDto setK_no(int k_no) {
		this.k_no = k_no;
		return this;
	}
	public int getI_no() {
		return i_no;
	}
	public KyungmaeDto setI_no(int i_no) {
		this.i_no = i_no;
		return this;
	}
	public String getI_name() {
		return i_name;
	}
	public KyungmaeDto setI_name(String i_name) {
		this.i_name = i_name;
		return this;
	}
	public String getI_img() {
		return i_img;
	}
	public KyungmaeDto setI_img(String i_img) {
		this.i_img = i_img;
		return this;
	}
	public int getK_first_price() {
		return k_first_price;
	}
	public KyungmaeDto setK_first_price(int k_first_price) {
		this.k_first_price = k_first_price;
		return this;
	}
	public int getK_first_no() {
		return k_first_no;
	}
	public KyungmaeDto setK_first_no(int k_first_no) {
		this.k_first_no = k_first_no;
		return this;
	}
	public String getK_first_name() {
		return k_first_name;
	}
	public KyungmaeDto setK_first_name(String k_first_name) {
		this.k_first_name = k_first_name;
		return this;
	}
	public int getK_second_price() {
		return k_second_price;
	}
	public KyungmaeDto setK_second_price(int k_second_price) {
		this.k_second_price = k_second_price;
		return this;
	}
	public int getK_second_no() {
		return k_second_no;
	}
	public KyungmaeDto setK_second_no(int k_second_no) {
		this.k_second_no = k_second_no;
		return this;
	}
	public String getK_second_name() {
		return k_second_name;
	}
	public KyungmaeDto setK_second_name(String k_second_name) {
		this.k_second_name = k_second_name;
		return this;
	}
	public String getK_regdate() {
		return k_regdate;
	}
	public KyungmaeDto setK_regdate(String k_regdate) {
		this.k_regdate = k_regdate;
		return this;
	}
	public String getK_state() {
		return k_state;
	}
	public KyungmaeDto setK_state(String k_state) {
		this.k_state = k_state;
		return this;
	}
	
	
}

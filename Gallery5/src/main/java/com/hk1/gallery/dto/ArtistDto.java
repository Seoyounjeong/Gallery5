package com.hk1.gallery.dto;




public class ArtistDto {
	private int a_no;
	private String a_name;
	private String a_solo;
	private String a_squard;
	private String a_career;
	private int a_state;
	private String e_img;
	private String ya_state;
	
	public ArtistDto() {
		super();
		// TODO Auto-generated constructor stub
	}





	public int getA_no() {
		return a_no;
	}


	public ArtistDto setA_no(int a_no) {
		this.a_no = a_no;
		return this;
	}


	public String getA_name() {
		return a_name;
	}


	public ArtistDto setA_name(String a_name) {
		this.a_name = a_name;
		return this;
	}


	public String getA_solo() {
		return a_solo;
	}


	public ArtistDto setA_solo(String a_solo) {
		this.a_solo = a_solo;
		return this;
	}


	public String getA_Squard() {
		return a_squard;
	}


	public ArtistDto setA_Squard(String a_squard) {
		this.a_squard = a_squard;
		return this;
	}


	public String getA_career() {
		return a_career;
	}


	public ArtistDto setA_career(String a_career) {
		this.a_career = a_career;
		return this;
	}


	public int getA_state() {
		return a_state;
	}


	public ArtistDto setA_state(int a_state) {
		this.a_state = a_state;
		return this;
	}
	
	public String getYa_state() {
		return ya_state;
	}


	public void setYa_state(String ya_state) {
		this.ya_state = ya_state;
	}


	@Override
	public String toString() {
		return "ArtistDto [a_no=" + a_no + ", a_name=" + a_name + ", a_solo=" + a_solo + ", a_squard=" + a_squard
				+ ", a_career=" + a_career + ", a_state=" + a_state + ", e_img=" + e_img + "]";
	}





	public String getE_img() {
		return e_img;
	}





	public ArtistDto setE_img(String e_img) {
		this.e_img = e_img;
		return this;
	}
	
}

package com.hk1.utils;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import com.hk1.gallery.dto.CallendarDto;



public class Util {
	
	//usebean을 쓰기 위란 구조를 만든다 dto처럼 멤버필드가 있고, get/set메서드가 있는 구조
	private String todates; // 날짜를 나타내는 문자영(mdate)을 날짜 형식(yyyy-MM-dd hh:mm)으로 만들어서 저장할 변수
	
	
	//static, non-static, 파라미터 존재여부, 반환타입 (o,x)
	//한자릿수값을 두자릿 수 값으로 반환해주는 메서드
	public static String isTwo(String s) {
		
		return s.length()<2 ? "0"+s : s;
	}


	//화면에서 getproperty 태그가 호줄해줄 메서드
	public String getTodates() {
		return todates;
	}

	//문자열을 날짜 형식으로 표현하는 메서드 
	// 화면에서 setproperty 태그가 호출해줄 메서드 
	public void setTodates(String mDate) { //mdate 화면으로 부터 12자리 문자열을 받게될 파라미터
		
		//date형식 : yyyy-MM-dd hh:mm:ss -- 날짜 형식으로 변환하려면 date 형식으로 모양을 바꿔줘야 한다.
						   //dd 공백 hh
		
		//문자열을 -- date 타입으로 변환해야 한다.
		
		String m=mDate.substring(0, 4)+"-" 	//year
				+ mDate.substring(4, 6)+"-" //month
				+mDate.substring(6, 8)+" "	//date
				+mDate.substring(8, 10)+":"	
				+mDate.substring(10)+":00";
		
		SimpleDateFormat asd= new SimpleDateFormat("yyyy년MM월dd일 hh시mm분");
		
		Timestamp tm = Timestamp.valueOf(m); //문자열을 날짜형태로
		
		
		asd.format(tm);
		
		this.todates = asd.format(tm);;
	}
	
	

	//달력에서 i(현재일울) 파라미터로 박아서 토요일/ 일요ㅛ일을 구별해서 "blue" 또는 "red" 문자열을 반환하는 메서드
	public static String fontColor(int dayOfWeek, int i){
		
	String color= "";
	
	if((dayOfWeek-1+i)%7==0){
		color ="blue";
	}else if((dayOfWeek-1+i)%7==1){
		color="red";
	}else{
		color = "black";
	}
	
	return color;
}
		

public static String getCalView(List<CallendarDto> list, int i) {
		
		
		//list에는 mdate에 "201903011530"로 저장되어있음
		//- mdate에서 "01" 추출 == i에서 int i -- "01"

		String d = isTwo(i+""); // 숫자 1 을 문자열  "01"로 바꿔줌 
		
		String calList = ""; //화면에 출력 해줄 문자열(결과값)
		
		
		//<p>title</p> <p>title</p> <p>title</p> 
		for (CallendarDto calDto : list) {

			for (int j = Integer.parseInt(calDto.getC_start().substring(4, 6)); j <= Integer.parseInt(calDto.getC_end().substring(4, 6)); j++) {
		
				
			if (j==Integer.parseInt(d)) {
					
				if (calDto.getC_start().substring(4, 6).equals(d)) {
					
					calList+="<p title='"+calDto.getC_title()+"' class='clist' style='font-size:8px; background-color: pink; margin: 0; height: 20px;' onclick='c_update("+i+","+calDto.getC_start()+")'>"
							+(calDto.getC_title().length()>4? calDto.getC_title().substring(0, 3)+".." : calDto.getC_title())
							+"시작"+"</p>";
				}else if(calDto.getC_end().substring(4, 6).equals(d)) {
					
					calList+="<p title='"+calDto.getC_title()+"' class='clist' style='font-size:8px; background-color: pink; margin: 0; height: 20px;' onclick='c_update("+i+","+calDto.getC_start()+")'>"
							+(calDto.getC_title().length()>4? calDto.getC_title().substring(0, 3)+".." : calDto.getC_title())
							+"끝"+"</p>";
				}else {
					calList+="<p title='class='clist' style='background-color:pink; padding: 0; margin: 0;' onclick='c_update("+i+","+calDto.getC_start()+")'>"
							   +"&nbsp;"+"</p>";
						i++;
				}


				}
			
			}
			
	
		}
		
		return calList;
	}


}

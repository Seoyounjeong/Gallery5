package com.hk1.gallery.service;

import java.util.List;

import com.hk1.gallery.dto.CallendarDto;

public interface ICallendarService {
	boolean insertCallendar(CallendarDto callendarDto);	//U , M
	boolean updateCallendar(CallendarDto callendarDto);	//U , M
	boolean deleteCallendar(int c_no);			//U , M		
	CallendarDto selectCallendar(int c_no);		//U , M
	List<CallendarDto> selectCallendarList(CallendarDto callendarDto);		//U , M
	List<CallendarDto> selectCallendarList();		//M
	CallendarDto selectCallendarList3(CallendarDto callendarDto);
	List<CallendarDto> selectCallendarList_g_no(int g_no);
	
	public int calendarpagenum(CallendarDto callendarDto);
	public List<CallendarDto> getpagelist(CallendarDto callendarDto);
}

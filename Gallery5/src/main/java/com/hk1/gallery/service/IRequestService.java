package com.hk1.gallery.service;

import java.util.List;

import com.hk1.gallery.dto.ItemDto;
import com.hk1.gallery.dto.RequestDto;

public interface IRequestService {

	boolean insertRequest(RequestDto requestDto); 	//U , M

	boolean updateRequest(RequestDto requestDto); 	//U , M

	boolean deleteRequest(int r_no); 			//U , M

	RequestDto selectRequest(int r_no);			//U , M


	List<RequestDto> selectR_receiveRequestList(int r_receive);
	
	List<RequestDto> selectR_sendRequestList(int r_send);
	
	List<RequestDto> selectRequestList();			//M


}

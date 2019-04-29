package com.hk1.gallery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk1.gallery.dao.IRequestDao;
import com.hk1.gallery.dto.ItemDto;
import com.hk1.gallery.dto.RequestDto;

@Service
public class RequestService implements IRequestService {

	@Autowired
	private IRequestDao requestDao;

	@Override
	public boolean insertRequest(RequestDto requestDto) {
		// TODO Auto-generated method stub
		return requestDao.insertRequest(requestDto);
	}

	@Override
	public boolean updateRequest(RequestDto requestDto) {
		// TODO Auto-generated method stub
		return requestDao.updateRequest(requestDto);
	}

	@Override
	public boolean deleteRequest(int r_no) {
		// TODO Auto-generated method stub
		return requestDao.deleteRequest(r_no);
	}

	@Override
	public RequestDto selectRequest(int r_no) {
		// TODO Auto-generated method stub
		return requestDao.selectRequest(r_no);
	}


	@Override
	public List<RequestDto> selectRequestList() {
		// TODO Auto-generated method stub
		return requestDao.selectRequestList();
	}

	@Override
	public List<RequestDto> selectR_receiveRequestList(int r_receive) {
		// TODO Auto-generated method stub
		return requestDao.selectR_receiveRequestList(r_receive);
	}

	@Override
	public List<RequestDto> selectR_sendRequestList(int r_send) {
		// TODO Auto-generated method stub
		return requestDao.selectR_sendRequestList(r_send);
	}
}

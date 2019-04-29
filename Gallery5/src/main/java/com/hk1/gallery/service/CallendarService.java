package com.hk1.gallery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk1.gallery.dao.ICallendarDao;
import com.hk1.gallery.dto.CallendarDto;

@Service
public class CallendarService implements ICallendarService{

	@Autowired
	private ICallendarDao callendarDao;

	@Override
	public boolean insertCallendar(CallendarDto callendarDto) {
		// TODO Auto-generated method stub
		return callendarDao.insertCallendar(callendarDto);
	}

	@Override
	public boolean updateCallendar(CallendarDto callendarDto) {
		// TODO Auto-generated method stub
		return callendarDao.updateCallendar(callendarDto);
	}

	@Override
	public boolean deleteCallendar(int c_no) {
		// TODO Auto-generated method stub
		return callendarDao.deleteCallendar(c_no);
	}

	@Override
	public CallendarDto selectCallendar(int c_no) {
		// TODO Auto-generated method stub
		return callendarDao.selectCallendar(c_no);
	}

	@Override
	public List<CallendarDto> selectCallendarList(CallendarDto callendarDto) {
		// TODO Auto-generated method stub
		return callendarDao.selectCallendarList(callendarDto);
	}

	@Override
	public List<CallendarDto> selectCallendarList() {
		// TODO Auto-generated method stub
		return callendarDao.selectCallendarList();
	}
	
	@Override
	public CallendarDto selectCallendarList3(CallendarDto callendarDto) {
		// TODO Auto-generated method stub
		return callendarDao.selectCallendarList3(callendarDto);
	}
	
	@Override
	public List<CallendarDto> selectCallendarList_g_no(int g_no) {
		// TODO Auto-generated method stub
		return callendarDao.selectCallendarList_g_no(g_no);
	}
}

package com.hk1.gallery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk1.gallery.dao.IDabgeulDao;
import com.hk1.gallery.dto.DabgeulDto;

@Service
public class DabgeulService implements IDabgeulService{

	@Autowired
	private IDabgeulDao dabgeulDao;

	@Override
	public boolean InsertDabgeul(DabgeulDto dabgeulDto) {
		// TODO Auto-generated method stub
		return dabgeulDao.InsertDabgeul(dabgeulDto);
	}

	@Override
	public boolean updateDabgeul(DabgeulDto dabgeulDto) {
		// TODO Auto-generated method stub
		return dabgeulDao.updateDabgeul(dabgeulDto);
	}

	@Override
	public boolean deleteDabgeul(int d_no) {
		// TODO Auto-generated method stub
		return dabgeulDao.deleteDabgeul(d_no);
	}

	@Override
	public DabgeulDto selectDabgeul(int d_no) {
		// TODO Auto-generated method stub
		return dabgeulDao.selectDabgeul(d_no);
	}

	@Override
	public List<DabgeulDto> selectDabgeulList(int e_no) {
		// TODO Auto-generated method stub
		return dabgeulDao.selectDabgeulList(e_no);
	}

	@Override
	public List<DabgeulDto> selectDabgeulList() {
		// TODO Auto-generated method stub
		return dabgeulDao.selectDabgeulList();
	}
}

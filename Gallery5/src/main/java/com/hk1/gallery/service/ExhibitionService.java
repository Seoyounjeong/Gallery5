package com.hk1.gallery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk1.gallery.dao.IExhibitionDao;
import com.hk1.gallery.dto.ExhibitionDto;

@Service
public class ExhibitionService implements IExhibitionService{

	@Autowired
	private IExhibitionDao exhibitionDao;

	@Override
	public boolean insertExhibition(ExhibitionDto exhibitionDto) {
		// TODO Auto-generated method stub
		return exhibitionDao.insertExhibition(exhibitionDto);
	}

	@Override
	public boolean updateExhibition(ExhibitionDto exhibitionDto) {
		// TODO Auto-generated method stub
		return exhibitionDao.updateExhibition(exhibitionDto);
	}

	@Override
	public boolean deleteExhibition(int e_no) {
		// TODO Auto-generated method stub
		return exhibitionDao.deleteExhibition(e_no);
	}

	@Override
	public ExhibitionDto selectExhibition(int e_no) {
		// TODO Auto-generated method stub
		return exhibitionDao.selectExhibition(e_no);
	}

	@Override
	public List<ExhibitionDto> selectExhibitionList(int a_no) {
		// TODO Auto-generated method stub
		return exhibitionDao.selectExhibitionList(a_no);
	}

	@Override
	public List<ExhibitionDto> selectExhibitionList() {
		// TODO Auto-generated method stub
		return exhibitionDao.selectExhibitionList();
	}
}

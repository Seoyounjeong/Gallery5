package com.hk1.gallery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk1.gallery.dao.IGalleryDao;
import com.hk1.gallery.dto.GalleryDto;

@Service
public class GalleryService implements IGalleryService{

	@Autowired
	private IGalleryDao galleryDao;

	@Override
	public boolean insertGallery(GalleryDto galleryDto) {
		// TODO Auto-generated method stub
		return galleryDao.insertGallery(galleryDto);
	}

	@Override
	public boolean updateGallery(GalleryDto galleryDto) {
		// TODO Auto-generated method stub
		return galleryDao.updateGallery(galleryDto);
	}

	@Override
	public boolean deleteGallery(int g_no) {
		// TODO Auto-generated method stub
		return galleryDao.deleteGallery(g_no);
	}

	@Override
	public GalleryDto selectGallery(int g_no) {
		// TODO Auto-generated method stub
		return galleryDao.selectGallery(g_no);
	}

	@Override
	public List<GalleryDto> selectGalleryList() {
		// TODO Auto-generated method stub
		return galleryDao.selectGalleryList();
	}

	@Override
	public List<GalleryDto> selectG_stateGalleryList(int g_state) {
		// TODO Auto-generated method stub
		return galleryDao.selectG_stateGalleryList(g_state);
	}

	@Override
	public List<GalleryDto> selectM_noGalleryList(int m_no) {
		// TODO Auto-generated method stub
		return galleryDao.selectM_noGalleryList(m_no);
	}

	
}

package com.hk1.gallery.dao;

import java.util.List;

import com.hk1.gallery.dto.GalleryDto;

public interface IGalleryDao {
	boolean insertGallery(GalleryDto galleryDto);		//U , M
	boolean updateGallery(GalleryDto galleryDto);		//U , M
	boolean deleteGallery(int g_no); 			//U , M
	GalleryDto selectGallery(int g_no);			//U , M
	List<GalleryDto> selectGalleryList();			//U , M
	
	List<GalleryDto> selectG_stateGalleryList(int g_state);
	List<GalleryDto> selectM_noGalleryList(int m_no);

}

package com.hk1.gallery.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk1.gallery.dto.GalleryDto;

@Repository
public class GalleryDao implements IGalleryDao {
	private String namespace = "com.hk1.Gallery.";
	@Autowired
	private SqlSessionTemplate sqlSession;


	//갤러리 추가
	@Override
	public boolean insertGallery(GalleryDto galleryDto) {
		int count=sqlSession.insert(namespace+"insertGallery", galleryDto);

		return count>0?true:false;
	}
	//갤러리 수정
	@Override
	public boolean updateGallery(GalleryDto galleryDto) {
		int count=sqlSession.update(namespace+"updateGallery", galleryDto);
		return count>0?true:false;
	}
	//갤러리 삭제 
	@Override
	public boolean deleteGallery(int g_no) {
		int count=sqlSession.delete(namespace+"deleteGallery", g_no);
		return count>0?true:false;
	}
	
	
	//내 갤러리 1나 볼때 gno로 볼때
	@Override
	public GalleryDto selectGallery(int g_no) {

		return sqlSession.selectOne(namespace+"selectGallery", g_no);
	}
	
	//갤러리 상세
	@Override
	public List<GalleryDto> selectGalleryList() {

		return sqlSession.selectList(namespace+"selectGalleryList1");
	}

	
	// 스테이트 3 인거 가져올때
	@Override
	public List<GalleryDto> selectG_stateGalleryList(int yg_state) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+"selectGalleryList2",yg_state);
	}

	//내 갤러리 볼때  mno로 볼때 여려개 돈많은놈
	@Override
	public List<GalleryDto> selectM_noGalleryList(int m_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+"selectGalleryList3",m_no);
	}


}

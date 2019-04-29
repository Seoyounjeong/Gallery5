package com.hk1.gallery.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk1.gallery.dto.ExhibitionDto;

@Repository
public class ExhibitionDao implements IExhibitionDao {
	private String namespace = "com.hk1.Exhibition.";
	@Autowired
	private SqlSessionTemplate sqlSession;
	  @Override
	   public boolean insertExhibition(ExhibitionDto exhibitionDto) {
	 
	      int count = sqlSession.insert(namespace + "insertExhibition", exhibitionDto);
	      
	      return count>0?true:false;   

	   }
	   @Override
	   public boolean updateExhibition(ExhibitionDto exhibitionDto) {
	      int count = sqlSession.update(namespace + "updateExhibition", exhibitionDto);
	      
	      return count>0?true:false;   
	   }
	   @Override
	   public boolean deleteExhibition(int e_no) {
	      int count = sqlSession.delete(namespace + "deleteExhibition", e_no);
	      
	      return count>0?true:false;   
	   }
	   @Override
	   public ExhibitionDto selectExhibition(int e_no) {
	     
	      return sqlSession.selectOne(namespace + "selectExhibition", e_no);
	   }
	   @Override
	   public List<ExhibitionDto> selectExhibitionList(int a_no) {

	      
	      return sqlSession.selectList(namespace + "selectExhibitionList", a_no);
	   }
	   @Override
	   public List<ExhibitionDto> selectExhibitionList() {

	      return sqlSession.selectList(namespace + "selectExhibitionList1");
	   }



}

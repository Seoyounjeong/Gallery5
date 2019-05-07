package com.hk1.gallery.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk1.gallery.dto.ArtistDto;

@Repository
public class ArtistDao implements IArtistDao {

   private String namespace = "com.hk1.Artist.";
   @Autowired
   private SqlSessionTemplate sqlSession;
   @Override
      public boolean insertArtist(ArtistDto artistDto) {
         int count = sqlSession.insert(namespace+"insertArtist",artistDto);
         return count>0?true:false;
      }
      @Override
      public boolean updateArtist(ArtistDto artistDto) {
         int count = sqlSession.update(namespace+"updateArtist",artistDto);
         return count>0?true:false;
      }
      @Override
      public boolean deleteArtist(int a_no) {
         int count = sqlSession.delete(namespace+"deleteArtist", a_no);
         return count>0?true:false;
      }
      @Override
      public ArtistDto selectArtist(int a_no) {
        
         return sqlSession.selectOne(namespace+"selectArtist", a_no);
      }
      @Override
      public List<ArtistDto> selectArtistList(int a_state) {
         
         return sqlSession.selectList(namespace+"selectArtistList1",a_state);
      }
      @Override
      public List<ArtistDto> selectArtistList() {
        
         return sqlSession.selectList(namespace+"selectArtistList2");
      }
      
      @Override
      public List<ArtistDto> selectArtistListImg() {
        
         return sqlSession.selectList(namespace+"selectArtistListImg");
      }
      
      //메일 아이디 가져오기 추가
      public ArtistDto selectMemberId(int a_no) {
         return sqlSession.selectOne(namespace+"selectMemberId",a_no);
      }
      
      @Override
      public boolean updateArtistState(ArtistDto artistDto) {
         int count = sqlSession.update(namespace+"updateArtistState",artistDto);
            return count>0?true:false;
      }
      
      
}
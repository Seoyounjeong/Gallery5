package com.hk1.gallery.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk1.gallery.dto.ExhibitionDto;
import com.hk1.gallery.dto.ItemDto;
import com.hk1.gallery.dto.RequestDto;

@Repository
public class RequestDao implements IRequestDao {
   private String namespace = "com.hk1.Request.";
   @Autowired
   private SqlSessionTemplate sqlSession;
   @Override
   public boolean insertRequest(RequestDto requestDto) {
      int count = sqlSession.insert(namespace + "insertRequest", requestDto);
      
      return count>0?true:false;   
   }
   @Override
   public boolean updateRequest(RequestDto requestDto) {
      int count = sqlSession.update(namespace + "updateRequest", requestDto);
      
      return count>0?true:false;   
   }
   @Override
   public boolean deleteRequest(int r_no) {
      int count = sqlSession.delete(namespace + "deleteRequest", r_no);
      
      return count>0?true:false;   
   }
   @Override
   public RequestDto selectRequest(int r_no) {
      
      return sqlSession.selectOne(namespace + "selectRequest", r_no);
   }
   
   @Override
   public List<RequestDto> selectRequestList() {
      
      return sqlSession.selectList(namespace + "selectRequestList1");
   }

   @Override
   public List<RequestDto> selectR_receiveRequestList(int r_receive){
     
      return sqlSession.selectList(namespace + "selectRequestList2", r_receive);
      
   }
   
   
   @Override
   public List<RequestDto> selectR_sendRequestList(int r_send){
      
      return sqlSession.selectList(namespace + "selectRequestList3", r_send);
      
   }
   
  
   
}
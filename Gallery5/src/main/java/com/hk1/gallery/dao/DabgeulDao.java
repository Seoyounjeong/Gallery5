package com.hk1.gallery.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk1.gallery.dto.DabgeulDto;



@Repository
public class DabgeulDao implements IDabgeulDao {
   private String namespace = "com.hk1.Dabgeul.";
   @Autowired
   private SqlSessionTemplate sqlSession;
   
   @Override
    public boolean InsertDabgeul(DabgeulDto dabgeulDto) {
      
      int count = sqlSession.insert(namespace + "InsertDabgeul", dabgeulDto);
      
      return count>0?true:false;
      }
      @Override
      public boolean updateDabgeul(DabgeulDto dabgeulDto) {
         int count = sqlSession.update(namespace + "updateDabgeul", dabgeulDto);
         
         return count>0?true:false;
      }
      @Override
      public boolean deleteDabgeul(int d_no) {
         int count = sqlSession.delete(namespace + "deleteDabgeul", d_no);
         
         return count>0?true:false;
      }
      @Override
      public DabgeulDto selectDabgeul(int d_no) {
     
         return sqlSession.selectOne(namespace + "selectDabgeul" , d_no);
      }
      @Override
      public List<DabgeulDto> selectDabgeulList(int e_no) {
        
         return sqlSession.selectList(namespace + "selectDabgeulList1" , e_no);
      }
      @Override
      public List<DabgeulDto> selectDabgeulList() {
         
         return sqlSession.selectList(namespace +"selectDabgeulList");
      }
}
      
   
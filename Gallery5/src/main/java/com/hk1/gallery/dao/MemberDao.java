package com.hk1.gallery.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk1.gallery.dto.MemberDto;

@Repository
public class MemberDao implements IMemberDao {
	private String namespace = "com.hk1.Member.";
	@Autowired
	private SqlSessionTemplate sqlSession;
	 
	   @Override
	   public boolean insertMember(MemberDto memberDto) {
	      int count = sqlSession.insert(namespace+"insertMember", memberDto);
	      return count>0?true:false;
	   }
	   @Override
	   public boolean updateMember(MemberDto memberDto) {
	      int count = sqlSession.update(namespace+"updateMember", memberDto);
	      return count>0?true:false;
	   }
	   @Override
	   public boolean deleteMember(int m_no) {
	      int count = sqlSession.delete(namespace+"deleteMember", m_no);
	      return count>0?true:false;
	   }
	   
	   @Override
	   public List<MemberDto> selectMemberList() {
	     
	      return sqlSession.selectList(namespace+"selectMemberList");
	   }
	   @Override
	   public MemberDto selectMember(int m_no) {
	      
	      return sqlSession.selectOne(namespace+"selectMember1", m_no);
	   }

	   @Override
	   public MemberDto selectMember(String m_id) {
		   
		   return sqlSession.selectOne(namespace+"selectMember2", m_id);
	   }
	   
	   @Override
	   public List<MemberDto> selectCheckMemberList(){
		   
		   return sqlSession.selectList(namespace+"selectMember3");
	   }



}

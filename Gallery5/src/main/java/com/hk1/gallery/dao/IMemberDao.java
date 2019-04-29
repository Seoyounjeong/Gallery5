package com.hk1.gallery.dao;

import java.util.List;

import com.hk1.gallery.dto.MemberDto;

public interface IMemberDao {
	boolean insertMember(MemberDto memberDto); 	//U , M
	boolean updateMember(MemberDto memberDto); 	//U , M
	boolean deleteMember(int m_no);	//U , M
	MemberDto selectMember(String m_id);		//U 로그인
	List<MemberDto> selectMemberList();		//M 회원전체정보
	MemberDto selectMember(int m_no);			//U , M
	public List<MemberDto> selectCheckMemberList();
}

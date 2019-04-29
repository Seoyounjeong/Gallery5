package com.hk1.gallery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk1.gallery.dao.IMemberDao;
import com.hk1.gallery.dto.MemberDto;

@Service
public class MemberService implements IMemberService {

	@Autowired
	private IMemberDao memberDao;

	@Override
	public boolean insertMember(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return memberDao.insertMember(memberDto);
	}

	@Override
	public boolean updateMember(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return memberDao.updateMember(memberDto);
	}

	@Override
	public boolean deleteMember(int m_no) {
		// TODO Auto-generated method stub
		return memberDao.deleteMember(m_no);
	}

	@Override
	public MemberDto selectMember(String m_id) {
		// TODO Auto-generated method stub
		return memberDao.selectMember(m_id);
	}

	@Override
	public List<MemberDto> selectMemberList() {
		// TODO Auto-generated method stub
		return memberDao.selectMemberList();
	}

	@Override
	public MemberDto selectMember(int m_no) {
		// TODO Auto-generated method stub
		return memberDao.selectMember(m_no);
	}

	@Override
	public List<MemberDto> selectCheckMemberList(){
		
		return memberDao.selectCheckMemberList();
	}
	
}

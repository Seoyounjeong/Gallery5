package com.hk1.gallery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk1.gallery.dao.IArtistDao;
import com.hk1.gallery.dao.IKyungmaeDao;
import com.hk1.gallery.dto.KyungmaeDto;

@Service
public class KyungmaeService implements IKyungmaeService {
	@Autowired
	private IKyungmaeDao kyungmaedao;

	
	@Override
	public boolean insertKyungmae(KyungmaeDto kyungmaeDto) {
		return kyungmaedao.insertKyungmae(kyungmaeDto);
	}

	@Override
	public boolean updateKyungmae(KyungmaeDto kyungmaeDto) {
		// TODO Auto-generated method stub
		return kyungmaedao.updateKyungmae(kyungmaeDto);
	}

	@Override
	public boolean deleteKyungmae(int k_no) {
		// TODO Auto-generated method stub
		return kyungmaedao.deleteKyungmae(k_no);
	}

	@Override
	public List<KyungmaeDto> selectKyungmaeList() {
		// TODO Auto-generated method stub
		return kyungmaedao.selectKyungmaeList();
	}

	@Override
	public KyungmaeDto selectK_noKyungmae(int k_no) {
		// TODO Auto-generated method stub
		return kyungmaedao.selectK_noKyungmae(k_no);
	}

	@Override
	public KyungmaeDto selectI_noKyungmae(int i_no) {
		// TODO Auto-generated method stub
		return kyungmaedao.selectI_noKyungmae(i_no);
	}

	@Override
	public List<KyungmaeDto> selectKyungmaeList(String COLNAME, String colvalue) {
		// TODO Auto-generated method stub
		return kyungmaedao.selectKyungmaeList(COLNAME, colvalue);
	}

}

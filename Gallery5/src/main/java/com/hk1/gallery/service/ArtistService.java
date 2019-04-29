package com.hk1.gallery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk1.gallery.dao.IArtistDao;
import com.hk1.gallery.dto.ArtistDto;

@Service
public class ArtistService implements IArtistService {
	@Autowired
	private IArtistDao artistDao;

	@Override
	public boolean insertArtist(ArtistDto artistDto) {
		// TODO Auto-generated method stub
		return artistDao.insertArtist(artistDto);
	}

	@Override
	public boolean updateArtist(ArtistDto artistDto) {
		// TODO Auto-generated method stub
		return artistDao.updateArtist(artistDto);
	}

	@Override
	public boolean deleteArtist(int a_no) {
		// TODO Auto-generated method stub
		return artistDao.deleteArtist(a_no);
	}

	@Override
	public ArtistDto selectArtist(int a_no) {
		// TODO Auto-generated method stub
		return artistDao.selectArtist(a_no);
	}

	@Override
	public List<ArtistDto> selectArtistList(int ya_state) {
		// TODO Auto-generated method stub
		return artistDao.selectArtistList(ya_state);
	}

	@Override
	public List<ArtistDto> selectArtistList() {
		// TODO Auto-generated method stub
		return artistDao.selectArtistList();
	}

	@Override
	public List<ArtistDto> selectArtistListImg() {
		// TODO Auto-generated method stub
		return artistDao.selectArtistListImg();
	}
	
	
}

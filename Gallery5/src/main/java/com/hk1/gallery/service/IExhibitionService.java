package com.hk1.gallery.service;

import java.util.List;

import com.hk1.gallery.dto.ExhibitionDto;

public interface IExhibitionService {
	boolean insertExhibition(ExhibitionDto exhibitionDto);	//U , M
	
	boolean updateExhibition(ExhibitionDto exhibitionDto);	//U , M

	boolean deleteExhibition(int e_no);			//U , M

	ExhibitionDto selectExhibition(int e_no);		//U , M
	
	List<ExhibitionDto> selectExhibitionList(int a_no);	//U , M
	List<ExhibitionDto> selectExhibitionList();
}

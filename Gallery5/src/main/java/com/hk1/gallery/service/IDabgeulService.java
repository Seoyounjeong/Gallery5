package com.hk1.gallery.service;

import java.util.List;

import com.hk1.gallery.dto.DabgeulDto;

public interface IDabgeulService {
	boolean InsertDabgeul(DabgeulDto dabgeulDto);		//U , M

	boolean updateDabgeul(DabgeulDto dabgeulDto); 	//U , M

	boolean deleteDabgeul(int d_no); 			//U , M

	DabgeulDto selectDabgeul(int d_no);			//U , M

	List<DabgeulDto> selectDabgeulList(int e_no);		//U , M
	List<DabgeulDto> selectDabgeulList();			//M

}

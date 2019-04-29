package com.hk1.gallery.dao;

import java.util.List;

import com.hk1.gallery.dto.ItemDto;

public interface IItemDao {
	boolean insertItem(ItemDto itemDto); 		//U , M
	boolean updateItem(ItemDto itemDto);		//U , M
	boolean updateItem(int[] i_nos , int e_no);		//U , M
	boolean deleteItem(int i_no); 			//U , M
	ItemDto selectItem(int i_no);				//U , M
	
	
	
	List<ItemDto> 	selectM_noItemList(int m_no);	
	List<ItemDto> 	selectA_noItemList(int a_no);
	List<ItemDto> 	selectE_noItemList(int e_no);
	
	List<ItemDto> selectItemList();			//M
}

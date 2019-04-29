package com.hk1.gallery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.hk1.gallery.dao.IItemDao;
import com.hk1.gallery.dto.ItemDto;

@Service
public class ItemService implements IItemService {
	@Autowired
	private IItemDao itemDao;

	@Override
	public boolean insertItem(ItemDto itemDto) {
		// TODO Auto-generated method stub
		return itemDao.insertItem(itemDto);
	}

	@Override
	public boolean updateItem(ItemDto itemDto) {
		// TODO Auto-generated method stub
		return itemDao.updateItem(itemDto);
	}

	@Override
	public boolean updateItem(int[] i_nos, int e_no) {
		// TODO Auto-generated method stub
		return itemDao.updateItem(i_nos, e_no);
	}

	@Override
	public boolean deleteItem(int i_no) {
		// TODO Auto-generated method stub
		return itemDao.deleteItem(i_no);
	}

	@Override
	public ItemDto selectItem(int i_no) {
		// TODO Auto-generated method stub
		return itemDao.selectItem(i_no);
	}

	@Override
	public List<ItemDto> selectM_noItemList(int m_no) {
		// TODO Auto-generated method stub
		return itemDao.selectM_noItemList(m_no);
	}

	@Override
	public List<ItemDto> selectA_noItemList(int a_no) {
		// TODO Auto-generated method stub
		return itemDao.selectA_noItemList(a_no);
	}

	@Override
	public List<ItemDto> selectE_noItemList(int e_no) {
		// TODO Auto-generated method stub
		return itemDao.selectE_noItemList(e_no);
	}

	@Override
	public List<ItemDto> selectItemList() {
		// TODO Auto-generated method stub
		return itemDao.selectItemList();
	}
	
	
}

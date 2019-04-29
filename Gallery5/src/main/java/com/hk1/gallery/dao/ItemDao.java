package com.hk1.gallery.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk1.gallery.dto.ItemDto;

@Repository
public class ItemDao implements IItemDao {
	private String namespace = "com.hk1.Item.";
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Override
	   public boolean insertItem(ItemDto itemDto) {
	      int count=sqlSession.insert(namespace+"insertItem", itemDto);
	      
	      return count>0?true:false;
	   }

	   @Override
	   public boolean updateItem(ItemDto itemDto) {
	      int count=sqlSession.update(namespace+"updateItem1", itemDto);
	      return count>0?true:false;
	   }

	   //여기모름 ! 수정하시길!!! 꼭!!!!!!!
	   @Override
	   public boolean updateItem(int[] i_nos, int e_no) {
	      Map<String, int[]>map=new HashMap<String, int[]>();
	      int[] e_nos = {e_no};
	      map.put("i_nos", i_nos);
	      map.put("e_nos", e_nos);
	      int count=sqlSession.update(namespace+"updateItem2", map);
	      return count>0?true:false;
	   }

	   @Override
	   public boolean deleteItem(int i_no) {
	      int count=sqlSession.delete(namespace+"deleteItem", i_no);
	      return count>0?true:false;
	   }

	   @Override
	   public ItemDto selectItem(int i_no) {
	      
	      return sqlSession.selectOne(namespace+"selectItem", i_no);
	   }

	   

	   @Override
	   public List<ItemDto> selectItemList() {
	      
	      return sqlSession.selectList(namespace+"selectItemList1");
	   }

	@Override
	public List<ItemDto> selectM_noItemList(int m_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+"selectItemList2",m_no);
	}

	@Override
	public List<ItemDto> selectA_noItemList(int a_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+"selectItemList3",a_no);
	}

	@Override
	public List<ItemDto> selectE_noItemList(int e_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+"selectItemList4",e_no);
	}

	


}

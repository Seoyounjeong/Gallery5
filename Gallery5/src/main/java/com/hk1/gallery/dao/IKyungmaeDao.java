package com.hk1.gallery.dao;

import java.util.List;

import com.hk1.gallery.dto.KyungmaeDto;

public interface IKyungmaeDao {


	//insertKyungmae 경매등록 (사용자가 작품경매참가버튼 눌렀을 때 , 구매목록에서자신이 가진 작품을 경매에 내놓을 때)  / 전시상세보기페이지 사용 
	boolean insertKyungmae(KyungmaeDto kyungmaeDto);

	//updateKyungmae 경매수정 (다른 사용자가 작품 경매 참가버튼 눌렀을 때) / 전시상세보기 - 경매 참여 시 사용 
	boolean updateKyungmae(KyungmaeDto kyungmaeDto);

	//deleteKyungmae 경매 삭제 (매니저가 테이블 초기화 및 관리를 위해 필요) / 매니저 페이지 
	boolean deleteKyungmae(int k_no);

	//selectKyungmae 경매 상세 (진행중인 경매를 상세보기 할 시)  / 메인페이지-(진행중인경매클릭시) , 전시 상세보기 
	KyungmaeDto selectK_noKyungmae(int k_no);
	
	//selectKyungmae 진행중인 경매인지 테스트 시 
	KyungmaeDto selectI_noKyungmae(int i_no);

	//selectKyungmaeList 경매 목록 ( 모든 경매목록 보여주기 )  
	List<KyungmaeDto> selectKyungmaeList();
	
	//selectKyungmaeList 경매 목록 
	//( 진행중인 경매 보여주기 ) ( 오늘 종료해야 할 경매 보여주기 )
	List<KyungmaeDto> selectKyungmaeList(String COLNAME ,String colvalue);
	
}

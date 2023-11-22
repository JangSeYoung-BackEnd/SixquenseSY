package com.web.accompany.service;

import static com.web.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.web.accompany.model.dao.AccompanyWH;
import com.web.accompany.model.dto.AccompanyComment;
import com.web.accompany.model.dto.AccompanyDTO;
import com.web.accompany.model.dto.AccompanyOffer;
import com.web.member.dto.MemberToAcompanyWH;
import com.web.product.dto.ProductDto;


public class AccompanyServiceWH {
		private AccompanyWH dao=new AccompanyWH();
		
		
		//글을 클릭했을 때 해당하는 글번호로 조회하는 메소드 
		public AccompanyDTO selectBoardByNo(int no, boolean readResult) {
			Connection conn = getConnection();
			AccompanyDTO accompanyView  = dao.selectAccompanyByNo(conn,no);
			
			//offerstatus불러올려면 list로 가져온다.
//			List<AccompanyOffer> offers=dao.selectselectOffer(conn,no);
//			accompanyView.setAcOffer(offers);
			//System.out.println(offers);
			//만약에 게시글이 null이 아니면 조회수 올리기 
			if(accompanyView!=null&&!readResult) {
				int result=dao.updateAccompanyReadCount(conn, no);
				if(result>0) {
					commit(conn);
					accompanyView.setAccompanyReadCount(accompanyView.getAccompanyReadCount()+1);
				}
				else {
					rollback(conn);
				}
			}
			close(conn);
			return accompanyView;
		}
		
		public MemberToAcompanyWH selectMemberToAcompany(int userNo, int no) {
			Connection conn = getConnection();
			MemberToAcompanyWH member  = dao.selectMemberToAcompany(conn,userNo,no);
			close(conn);
			return member;
		}
		
		
		//글번호로 관련된 댓글을 가져오는 메소드 
		public List<AccompanyComment> selectAccompanyComment(int no) {
			Connection conn= getConnection();
			List <AccompanyComment> list = dao.selectAccompanyComment(conn,no);
			close(conn);
			//System.out.println(list+"dao");
			return list;
		}
		
		//글번호에 해당하는 offerStatus를 가져옴 
		public List<AccompanyOffer> selectOfferByNo(int no) {
			Connection conn= getConnection();
			List <AccompanyOffer> offer = dao.selectOfferByNo(conn,no);
			close(conn);
			return offer;
		}

		//댓글 삽입하는 메소드 
		public int insertAccompanyComment(AccompanyComment ac) {
			Connection conn = getConnection();
			int result = dao.insertAccompanyComment(conn,ac);
			if(result > 0) commit(conn);
			else rollback(conn);
			close(conn);
			return result;
		}
		
		public int deletecomment(int userNo) {
			Connection conn = getConnection();
			int result = dao.deletecomment(conn,userNo);
			if(result > 0) commit(conn);
			else rollback(conn);
			close(conn);
			return result;
		}

		//동행글에서 모집여부를 업데이트하는 메소드 
		public int updateAccompanyOffer(int acompanyBNo, String value) {
			Connection conn=getConnection();
			int result=dao.updateAccompanyOffer(conn,acompanyBNo,value);
			//System.out.println(value);
			if(result>0) commit(conn);
			else rollback(conn);
			close(conn);
			return result;
		}

		//동행글에서 동행 신청하기 눌렀을 때 신청하는 메소드 
		public int insertAccompanyOffer(int userNo, int acompanyBNo) {
			Connection conn=getConnection();
			int result=dao.insertAccompanyOffer(conn,userNo,acompanyBNo);
			if(result>0) commit(conn);
			else rollback(conn);
			close(conn);
			return result;
		}
		//동행신청후 거절눌렀을 때 거절되는 메소드
		public int deleteAccompanyOffer(int userNo, int acompanyBNo) {
			Connection conn=getConnection();
			int result=dao.deleteAccompanyOffer(conn,userNo,acompanyBNo);
			if(result>0) commit(conn);
			else rollback(conn);
			close(conn);
			return result;
		}


		public int updateAcceptOffer(int acompanyBNo, int memberNo) {
			Connection conn=getConnection();
			int result=dao.updateAcceptOffer(conn,acompanyBNo,memberNo);
			if(result>0) commit(conn);
			else rollback(conn);
			close(conn);
			return result;
		}


		public int updateDeclineOffer(int acompanyBNo, int memberNo) {
			Connection conn=getConnection();
			int result=dao.updateDeclineOffer(conn,acompanyBNo,memberNo);
			if(result>0) commit(conn);
			else rollback(conn);
			close(conn);
			return result;
		}

		public List<ProductDto> selectsearchAll(String searchValue) {
			Connection conn=getConnection();
			System.out.println(searchValue);
			List<ProductDto> result=dao.selectsearchAll(conn,searchValue);
			if(result!=null) {
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
			return	result;
		}

		public List<AccompanyDTO> selectsearchAccompanyAll(String searchValue) {
			Connection conn=getConnection();
			List<AccompanyDTO> a = dao.selectsearchAccompanyAll(conn,searchValue);
			if(a!=null) {
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
			return	a;
		}

		


		


		


		
		
}

package com.web.accompany.service;

import static com.web.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.web.accompany.model.dao.AccompanyWH;
import com.web.accompany.model.dto.AccompanyComment;
import com.web.accompany.model.dto.AccompanyDTO;


public class AccompanyServiceWH {
		private AccompanyWH dao=new AccompanyWH();
		
		
		//글을 클릭했을 때 해당하는 글번호로 조회하는 메소드 
		public AccompanyDTO selectBoardByNo(int no, boolean readResult) {
			Connection conn = getConnection();
			AccompanyDTO accompanyView  = dao.selectAccompanyByNo(conn,no);
			
			//만약에 게시글이 null이 아니면 조회수 올리기 
			if(accompanyView!=null&&!readResult) {
				int result=dao.updateAccompanyReadCount(conn, no);
				
				if(result>0) {
					commit(conn);
					accompanyView.setAccompanyReadCount(accompanyView.getAccompanyReadCount()+1);
				}
				else rollback(conn);
			}
			close(conn);
			return accompanyView;
		}
		
		
		//글번호로 관련된 댓글을 가져오는 메소드 
		public List<AccompanyComment> selectAccompanyComment(int no) {
			Connection conn= getConnection();
			List <AccompanyComment> list = dao.selectAccompanyComment(conn,no);
			close(conn);
			return list;
		}


		public int insertAccompanyComment(AccompanyComment ac) {
			Connection conn = getConnection();
			int result = dao.insertAccompanyComment(conn,ac);
			if(result > 0) commit(conn);
			else rollback(conn);
			close(conn);
			return result;
			
			
			
		}
}

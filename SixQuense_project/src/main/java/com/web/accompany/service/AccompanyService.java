package com.web.accompany.service;

import static com.web.common.JDBCTemplate.close;
import static com.web.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.web.accompany.model.dao.AccompanyDAO;
import com.web.accompany.model.dto.AccompanyComment;
import com.web.accompany.model.dto.AccompanyDTO;
import com.web.common.JDBCTemplate;

public class AccompanyService {
		private AccompanyDAO dao=new AccompanyDAO();
		
		public List<AccompanyDTO> selectAccompanyAll(){
			Connection conn=getConnection();
			List<AccompanyDTO> a=dao.selectBoardAll(conn);
			close(conn);
			return	a;
		}
		
		//글을 클릭했을 때 해당하는 글번호로 조회하는 메소드 
		public AccompanyDTO selectBoardByNo(int no, boolean readResult) {
			Connection conn = getConnection();
			AccompanyDTO accompanyView  = dao.selectAccompanyByNo(conn,no);
			
			if(accompanyView!=null &&!readResult) {
				int result= dao.updateAccompanyReadCount(conn,no);
				if(result>0) {
					JDBCTemplate.commit(conn);
					accompanyView.setAccompanyReadCount(accompanyView.getAccompanyReadCount());
				}
				else JDBCTemplate.rollback(conn);
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
}

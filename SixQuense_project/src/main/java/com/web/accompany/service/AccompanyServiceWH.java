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
		public AccompanyDTO selectBoardByNo(int no) {
			Connection conn = getConnection();
			AccompanyDTO accompanyView  = dao.selectAccompanyByNo(conn,no);

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

package com.web.accompany.service;

import static com.web.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.web.accompany.model.dao.AccompanyDAOKH;
import com.web.accompany.model.dto.AccompanyComment;
import com.web.accompany.model.dto.AccompanyDTO;
import com.web.common.JDBCTemplate;

public class AccompanyServiceKH {
		private AccompanyDAOKH dao=new AccompanyDAOKH();
		
		public List<AccompanyDTO> selectAccompanyAll(){
			Connection conn=getConnection();
			List<AccompanyDTO> a=dao.selectBoardAll(conn);
			if(a!=null) {
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
			return	a;
		}
		
		public int insertAccompany(AccompanyDTO a, String nation, String userId) {
			Connection conn=getConnection();
			int result=dao.insertAccompany(conn, a, nation, userId);
			if(result>0) commit(conn);
			else rollback(conn);
			close(conn);
			return result;
			
		}
}
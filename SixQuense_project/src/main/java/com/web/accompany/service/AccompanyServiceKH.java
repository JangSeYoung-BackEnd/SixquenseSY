package com.web.accompany.service;

import static com.web.common.JDBCTemplate.close;
import static com.web.common.JDBCTemplate.getConnection;

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
			close(conn);
			return	a;
		}
}
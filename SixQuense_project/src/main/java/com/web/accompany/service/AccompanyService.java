package com.web.accompany.service;

import java.sql.Connection;
import java.util.List;

import com.web.accompany.model.dao.AccompanyDAO;
import com.web.accompany.model.dto.AccompanyDTO;
import static com.web.common.JDBCTemplate.*;

public class AccompanyService {
		private AccompanyDAO dao=new AccompanyDAO();
		
		public List<AccompanyDTO> selectAccompanyAll(){
			Connection conn=getConnection();
			List<AccompanyDTO> a=dao.selectBoardAll(conn);
			close(conn);
			return	a;
		}
}

package com.web.community.service;

import java.sql.Connection;
import java.util.List;

import com.web.community.model.dao.CommunityDAO;
import com.web.community.model.dto.CommunityDTO;
import static com.web.common.JDBCTemplate.*;

public class CommunityService {
	private CommunityDAO dao=new CommunityDAO();
	
	public List<CommunityDTO> selectCommunityAll() {
		Connection conn=getConnection();
		List<CommunityDTO> l=dao.selectCommunityAll(conn);
		if(l!=null) commit(conn);
		else rollback(conn);
		close(conn);
		return l;
	}
}

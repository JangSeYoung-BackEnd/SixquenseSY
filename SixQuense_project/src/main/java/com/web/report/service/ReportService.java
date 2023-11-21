package com.web.report.service;

import java.sql.Connection;

import com.web.report.model.dao.ReportDao;
import static com.web.common.JDBCTemplate.*;

public class ReportService {
	private ReportDao dao=new ReportDao();
	
	public int InterReport(String reportType, String reortContent) {
		Connection conn=getConnection();
		int result=dao.InterReport(conn,reportType,reortContent);
		if(result>0) commit(conn);
		else rollback(conn);
		return result;
	}

}

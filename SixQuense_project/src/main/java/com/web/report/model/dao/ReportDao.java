package com.web.report.model.dao;

import java.io.Closeable;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.web.accompany.model.dao.AccompanyDAOKH;
import static com.web.common.JDBCTemplate.*;

public class ReportDao {
	private Properties sql=new Properties();
	{
		String path=ReportDao.class.getResource("/sql/report/report_sql.properties").getPath();
		try(FileReader fr=new FileReader(path)) {
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int InterReport(Connection conn, String reportType, String reortContent) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("InterReport"));
			pstmt.setString(1, reportType);
			pstmt.setString(2, reortContent);
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
}

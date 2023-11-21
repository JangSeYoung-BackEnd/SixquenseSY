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
	
	public int InterReport(Connection conn, String report, String reporttext,int accompanyNo, int memberNo) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("InterReport"));
			pstmt.setString(1, report);
			pstmt.setInt(2, accompanyNo);
			pstmt.setInt(3, 0);
			pstmt.setInt(4, memberNo);
			pstmt.setString(5, reporttext!=null?reporttext:null);
			result=pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
}

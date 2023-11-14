package com.web.product.dao;

import static com.web.common.JDBCTemplate.*;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;




public class ProductDao {
//	private Properties sql=new Properties();
//	{
//		String path=BoardDao.class
//				.getResource("/sql/board/board_sql.properties").getPath();
//		try(FileReader fr=new FileReader(path)) {
//			sql.load(fr);
//		}catch(IOException e) {
//			e.printStackTrace();
//		}
//	}
//	public List<Prodcuct> selectBoard(Connection conn){
//		PreparedStatement pstmt=null;
//		ResultSet rs=null;
//		List<Prodcuct> result=new ArrayList<>();
//		try {
//			pstmt=conn.prepareCall(sql.getProperty("selectBoard"));
//			rs=pstmt.executeQuery();
//			while(rs.next()) {
//				result.add(getProduct(rs));
//			}
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(rs);
//			close(pstmt);
//		}return result;
//	}
	/*
	 * private Product getProduct(ResultSet rs) throws SQLException {
	 * return.builder()
	 * 
	 * }
	 */
}

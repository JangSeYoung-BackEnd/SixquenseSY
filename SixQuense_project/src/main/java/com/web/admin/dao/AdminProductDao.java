package com.web.admin.dao;

import static com.web.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import com.web.product.dao.ProductDao;
import com.web.product.dto.ProductDto;
import com.web.product.dto.GuideDto;

public class AdminProductDao {
	private Properties sql = new Properties();
	{
		String path = ProductDao.class.getResource("/sql/product/adminproduct_sql.properties").getPath();
		try (FileReader fr = new FileReader(path)) {
			sql.load(fr);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertProduct(Connection conn, String nation, String guideName, ProductDto p) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("insertProduct"));
			pstmt.setString(1, p.getProductName());
			pstmt.setInt(2, p.getMinCount());
			pstmt.setInt(3, p.getMaxCount());
			pstmt.setInt(4, p.getProductPrice());
			pstmt.setString(5, "%" + guideName + "%");
			pstmt.setDouble(6, p.getProductDiscountRate());
			pstmt.setString(7, p.getProductDetail());
			pstmt.setInt(8, p.getProductDuration());
			pstmt.setString(9, String.join(",", p.getProductDay()));
			pstmt.setString(10, "%" + nation + "%");
			pstmt.setString(11, p.getEditorNote());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	/*
	 * public int insertGuide(Connection conn, GuideDto g) { PreparedStatement pstmt
	 * = null; int result = 0; try { pstmt =
	 * conn.prepareStatement(sql.getProperty("insertGuide")); pstmt.setString(1,
	 * g.getGuideName()); pstmt.setString(2, g.getGuidePhone()); result =
	 * pstmt.executeUpdate(); } catch (SQLException e) { e.printStackTrace(); }
	 * finally { close(pstmt); } return result; }
	 */

	public int insertFiles(Connection conn, List<Map<String, String>> files) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			for (Map<String, String> fileData : files) {
				System.out.println("파일데이터" + fileData);
				String rename = fileData.get("rename");
				String oriName = fileData.get("oriName");
				pstmt = conn.prepareStatement(sql.getProperty("insertFiles"));
				pstmt.setString(1, rename);
				pstmt.setString(2, oriName);
				result += pstmt.executeUpdate();
				close(pstmt);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertCourse(Connection conn, List<Map<String, String>> courseList) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			for (Map<String, String> courseMap : courseList) {
				for (Map.Entry<String, String> entry : courseMap.entrySet()) {
					System.out.println(entry);
					String courseName = entry.getKey();
					String courseDetail = entry.getValue();
					pstmt = conn.prepareStatement(sql.getProperty("insertCourse"));
					pstmt.setString(1, courseName);
					pstmt.setString(2, courseDetail);
					result += pstmt.executeUpdate();
					close(pstmt);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

}

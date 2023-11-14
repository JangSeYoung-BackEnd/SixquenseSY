package com.web.product.dao;

import static com.web.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.web.product.dto.ProductDto;
import com.web.product.dto.ProductattachmentDto;




public class ProductDao {
	private Properties sql=new Properties();
	{
		String path=ProductDao.class
				.getResource("/sql/product/product_sql.properties").getPath();
		try(FileReader fr=new FileReader(path)) {
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
///	public List<Prodcuct> selectBoard(Connection conn){
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
	
	//최신순으로 조회해서 가져오는 메소드
	public ProductDto selectRecentproductByCountry(Connection conn, int coodinateNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProductDto recentProduct = null;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectrecentproductByCountry"));
			pstmt.setInt(1, coodinateNo);
			rs = pstmt.executeQuery();
			if(rs.next()) recentProduct = getProduct(rs);
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return recentProduct;
	}
	
	//첨부파일 조회해서 가져오는 메소드
	public List<ProductattachmentDto> selectImages(Connection conn, int ProductNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductattachmentDto> images= new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectImages"));
			pstmt.setInt(1, ProductNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				images.add(getImage(rs));
			}
		}catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
		}
		return images;
	}
	
	public static ProductDto getProduct(ResultSet rs) throws SQLException {
		return ProductDto.builder()
				.ProductNo(rs.getInt("product_no"))
				.ProductName(rs.getString("productName"))
				.ProductReadcount(rs.getInt("product_readcount"))
				.ProductInsertdate(rs.getDate("product_insertdate"))
				.MinCount(rs.getInt("min_count"))
				.MaxCount(rs.getInt("max_count"))
				.ProductPrice(rs.getInt("product_price"))
				.GuideNo(rs.getInt("guide_no"))
				.ProductDiscountRate(rs.getDouble("product_discount_rate"))
				.ProductDetail(rs.getString("product_detail"))
				.ProductDuration(rs.getInt("product_duration"))
				.ProductDay(rs.getString("product_day").split(","))
				.CoodinateNo(rs.getInt("coordinate_no"))
				.EditorNote(rs.getString("editor_note"))
				/* .attachment() */
				.build();
	}
	
	public static ProductattachmentDto getImage(ResultSet rs) throws SQLException{
		List<ProductattachmentDto> images = new ArrayList<>();
		
		return ProductattachmentDto.builder()
				.ProductNo(rs.getInt("product_no"))
				.OrginalFilename(rs.getString("original_filename"))
				.RenameFilename(rs.getString("rename_filename"))
				.build();
	}
	
	
	
	
	
}

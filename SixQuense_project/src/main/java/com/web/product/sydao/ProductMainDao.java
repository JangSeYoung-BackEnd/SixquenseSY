package com.web.product.sydao;

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

import com.web.product.dao.ProductDao;
import com.web.product.dto.ProductDto;
import com.web.product.dto.ProductattachmentDto;

public class ProductMainDao {
	private Properties sql=new Properties();
	{
		String path = ProductDao.class.getResource("/sql/product/product_sql.properties").getPath();
		try (FileReader fr = new FileReader(path)) {
			sql.load(fr);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public ProductDto SelectProductByNo(Connection conn, int productNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductDto> products = new ArrayList<ProductDto>();
		try {
			pstmt = conn.prepareStatement(sql.getProperty(""));
			pstmt.setInt(1, productNo);
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return products.get(0);
		
	}
	
		public static ProductDto getProduct(ResultSet rs) throws SQLException {
			return ProductDto.builder()
					.ProductNo(rs.getInt("product_no"))
					.ProductName(rs.getString("product_name"))
					.ProductReadcount(rs.getInt("product_readcount"))
					.ProductInsertdate(rs.getDate("product_insertdate"))
					.MinCount(rs.getInt("min_count"))
					.MaxCount(rs.getInt("max_count"))
					.ProductPrice(rs.getInt("prodcut_price"))
					.GuideNo(rs.getInt("guide_no"))
					.ProductDiscountRate(rs.getDouble("product_discount_rate"))
					.ProductDetail(rs.getString("product_detail"))
					.ProductDuration(rs.getInt("product_duration"))
					.ProductDay(rs.getString("product_day") != null ? rs.getString("product_day").split(",") : null)
					.CoodinateNo(rs.getInt("coordinate_no")).EditorNote(rs.getString("editor_note"))
					.attachment(new ArrayList()).review(new ArrayList())
					.course(new ArrayList()).wishlist(new ArrayList())
					.build();
		}

		
		public static ProductattachmentDto getImage(ResultSet rs) throws SQLException {
			return ProductattachmentDto.builder()
					.OrginalFilename(rs.getString("original_filename"))
					.RenameFilename(rs.getString("rename_filename"))
					.ProductNo(rs.getInt("product_no"))
					.build();
		}
}

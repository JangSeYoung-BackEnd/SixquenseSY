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
import java.util.Objects;
import java.util.Properties;

import com.web.product.dto.ProductDto;
import com.web.product.dto.ProductattachmentDto;

public class ProductBookingDao {
	private Properties sql = new Properties();

    {
        String path = BookinginfoDao.class.getResource("/sql/product/product_sql").getPath();
        try(FileReader fr = new FileReader(path)) {
            sql.load(fr);
        } catch(IOException e) {
            e.printStackTrace();
        }
    }
    //번호로 받기
    public ProductDto selectProductByNo(Connection conn, int productNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProductDto product = null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectProductByNo"));
			pstmt.setInt(1, productNo);
			rs=pstmt.executeQuery();
			if(rs.next()) product=getProduct(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return product;
	}
    private void addProductAndImage(List<ProductDto> products, ResultSet rs) throws SQLException {
		int pk = rs.getInt("product_no");
		if (products.stream().anyMatch(e -> pk == e.getProductNo())) {
			products.stream().filter(e -> Objects.equals(e.getProductNo(), pk)).forEach(e -> {
				try {
					if (rs.getString("original_filename") != null) {
						e.getAttachment().add(getImage(rs));
					}
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			});
		} else {
			ProductDto product = getProduct(rs);
			if (rs.getString("original_filename") != null) {
				product.getAttachment().add(getImage(rs));
				products.add(product);
			}
		}
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
				.ProductDay(rs.getString("product_day").split(","))
				.CoodinateNo(rs.getInt("coordinate_no"))
				.EditorNote(rs.getString("editor_note"))
				.attachment(new ArrayList<ProductattachmentDto>())
				.build();
	}
    
    public static ProductattachmentDto getImage(ResultSet rs) throws SQLException {

		return ProductattachmentDto.builder().ProductNo(rs.getInt("product_no"))
				.OrginalFilename(rs.getString("original_filename")).RenameFilename(rs.getString("rename_filename"))
				.build();
	}
}

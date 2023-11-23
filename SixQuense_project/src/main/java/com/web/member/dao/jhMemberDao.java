package com.web.member.dao;

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

import com.web.member.dto.Member;
import com.web.product.dto.ProductDto;
import com.web.product.dto.ProductattachmentDto;
import com.web.product.dto.ProductorderinfoDto;
import com.web.product.dto.ProductpaymentDto;
import com.web.product.dto.ProductwishilistDto;

public class jhMemberDao {

	private Properties sql=new Properties();
	
	{
		String path=jhMemberDao.class
					.getResource("/sql/mypage/mypage_sql.properties").getPath();
		
		try(FileReader fr=new FileReader(path);) {
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	public int mypageupdate(Connection conn, Member m) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("mypageupdate")); 
			pstmt.setString(1, m.getUserPw());
			pstmt.setString(2, m.getUserName());
			pstmt.setString(3, m.getPhone());
			pstmt.setDate(4, m.getUserDd());
			pstmt.setString(5, m.getUserIntroduce());
			pstmt.setString(6, m.getGender());
			pstmt.setString(7, m.getNotificatIonset());	
			pstmt.setInt(8, m.getUserNo());			

			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int selectMemberByNo(Connection conn, int userNo) {
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    int result = 0;
	    try {
	        pstmt = conn.prepareStatement(sql.getProperty("selectMemberByNo"));
	        pstmt.setInt(1, userNo);
	        rs = pstmt.executeQuery();

	        // ResultSet에서 결과가 있는지 확인
	        if (rs.next()) {
	            result = 1; // 결과가 있다면 1로 설정
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rs);
	        close(pstmt);
	    }
	    return result;
	}
	public List<ProductwishilistDto> selectWishListByNo(Connection conn, int memberNo ) {
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		List<ProductwishilistDto> wish = new ArrayList<>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectWishListByNo")); 
			pstmt.setInt(1, memberNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				wish.add(getProductwishilistDto(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return wish;
	}
	//++++++++++++++++++ selectProductByNo ++++++++++++++++++++++
	public List<ProductorderinfoDto> selectProductByNo(Connection conn, int userNo){
		PreparedStatement pstmt=null;
		ResultSet rs =null;
		List<ProductorderinfoDto> info= new ArrayList<>();
		System.out.println(userNo +"dao ");
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectProductByNo"));
			pstmt.setInt(1, userNo);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				info.add(getProductorderinfoDto(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return info;
		
	}
	public List<ProductpaymentDto> selectpayByNo(Connection conn, int userNo){
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		List<ProductpaymentDto> pay= new ArrayList<>();
		System.out.println(userNo +"dao ");
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectpayByNo"));
			pstmt.setInt(1, userNo);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				pay.add(getProductpaymentDto(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return pay;
		
	}
	public List<ProductDto> selectproductnameByNo(Connection conn, int userNo) {
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		List<ProductDto> pro= new ArrayList<>();
		System.out.println(userNo +"dao ");
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectproductnameByNo"));
			pstmt.setInt(1, userNo);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				addProductAndAttachment(pro, rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return pro;
	}




	private void addProductAndAttachment(List<ProductDto> products, ResultSet rs) throws SQLException {
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
			if (rs.getString("original_filename") != null)
				product.getAttachment().add(getImage(rs));
			products.add(product);
		}
	}
	
	public static ProductattachmentDto getImage(ResultSet rs) throws SQLException {
		return ProductattachmentDto.builder().OrginalFilename(rs.getString("original_filename"))
				.RenameFilename(rs.getString("rename_filename")).ProductNo(rs.getInt("product_no")).build();
	}
	

	private ProductwishilistDto getProductwishilistDto(ResultSet rs) throws SQLException{
		return ProductwishilistDto.builder()
				.ProductWishlistNo(rs.getInt("PRODUCT_WISHLIST_NO"))
				.MemberNo(rs.getInt("MEMBER_NO"))
				.ProductNo(rs.getInt("PRODUCT_NO"))
				.ProductName(rs.getString("PRODUCT_NAME"))
				.OrginalFilename(rs.getString("ORIGINAL_FILENAME"))
				.RenameFilename(rs.getString("RENAME_FILENAME"))
				.build();				
	}
	private ProductorderinfoDto getProductorderinfoDto(ResultSet rs) throws SQLException{
		return ProductorderinfoDto.builder()
				.OrderNo(rs.getInt("ORDER_NO"))
				.OrderCount(rs.getInt("ORDER_COUNT"))
				.OrderDate(rs.getDate("ORDER_DATE"))
				.MemberNO(rs.getInt("MEMBER_NO"))
				.ProductNo(rs.getInt("Product_No"))
				.paymentId(rs.getString("PAYMENT_ID"))
				.ProductName(rs.getString("PRODUCT_NAME"))
				.totalAmount(rs.getInt("TOTAL_AMOUNT"))
				.build();
	}
	private ProductpaymentDto getProductpaymentDto (ResultSet rs) throws SQLException{
		return ProductpaymentDto.builder()
				.paymentId(rs.getString("payment_Id"))
				.paymentDate(rs.getDate("payment_Date"))
				.totalAmount(rs.getInt("total_Amount"))
				.paymentStatus(rs.getString("payment_Status"))
				.OrderNo(rs.getInt("Order_No"))
				.build();
	}
//	private ProductDto getProductDto(ResultSet rs)throws SQLException{
//		return ProductDto.builder()
//				.ProductNo(rs.getInt("Product_No"))
//				.ProductName(rs.getString("Product_Name"))
//				.ProductReadcount(rs.getInt("Product_Readcount"))
//				.ProductInsertdate(rs.getDate("Product_Insertdate"))
//				.MinCount(rs.getInt("Min_Count"))
//				.MaxCount(rs.getInt("Max_Count"))
//				.ProductPrice(rs.getInt("Product_Price"))
//				.GuideNo(rs.getInt("Guide_No"))
//				.ProductDiscountRate(rs.getDouble("Product_Discount_Rate"))
//				.ProductDetail(rs.getString("Product_Detail"))
//				.ProductDuration(rs.getInt("Product_Duration"))
//				.ProductDay(rs.getString("product_day") != null ? rs.getString("product_day").split(",") : null)
//				.CoodinateNo(rs.getInt("Coodinate_No"))
//				.EditorNote(rs.getString("Editor_Note"))				
//				.build();
//	
//	}
	
	public static ProductDto getProduct(ResultSet rs) throws SQLException {
		return ProductDto.builder().ProductNo(rs.getInt("product_no")).ProductName(rs.getString("product_name"))
				.ProductReadcount(rs.getInt("product_readcount")).ProductInsertdate(rs.getDate("product_insertdate"))
				.MinCount(rs.getInt("min_count")).MaxCount(rs.getInt("max_count"))
				.ProductPrice(rs.getInt("prodcut_price")).GuideNo(rs.getInt("guide_no"))
				.ProductDiscountRate(rs.getDouble("product_discount_rate"))
				.ProductDetail(rs.getString("product_detail")).ProductDuration(rs.getInt("product_duration"))
				.ProductDay(rs.getString("product_day") != null ? rs.getString("product_day").split(",") : null)
				.CoodinateNo(rs.getInt("coordinate_no")).EditorNote(rs.getString("editor_note"))
				.attachment(new ArrayList())
				.build();
	}
}

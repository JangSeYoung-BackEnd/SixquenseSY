package com.web.product.model.service;

import static com.web.common.JDBCTemplate.*;

import java.sql.Connection;

import com.web.product.dao.ProductDao;
import com.web.product.dto.ProductDto;

public class ProductService {
	
	private ProductDao dao = new ProductDao();
	
	//할인율 있는 상품 조회
	//public List<Product> selectProductByDiscount(double productDiscountRate){
		
	//}
	
	//나라별 패키지 상품 조회
	/*
	 * public ProductDto selectBestproductByCountry(int coordinateNO){ Connection
	 * conn = getConnection(); ProductDto bestProduct =
	 * dao.selectBestproductByCountry(conn, coordinateNO); close(conn); return
	 * bestProduct; }
	 * 
	 * public ProductDto selectRecentproductByCountry(int coordinateNO){ Connection
	 * conn = getConnection(); ProductDto recentProduct =
	 * dao.selectRecentproductByCountry(conn, coordinateNO); close(conn); return
	 * recentProduct; }
	 * 
	 * public ProductDto selectDiscountproductByCountry(int coordinateNO){
	 * Connection conn = getConnection(); ProductDto discountProduct =
	 * dao.selectDiscountproductByCountry(conn, coordinateNO); close(conn); return
	 * discountProduct; }
	 */
	
	//상품번호별 조회, 조회수 관련
	//public Product selectProductByNo(int boardNo, boolean readResult) {
		
	//}
	
	//상품 등록
	//public int insertProduct(Product p) {
		
	//}
	
	//상품 수정
	
	
	//상품 삭제
	
	
	//리뷰 코멘트 등록
	//public int insertProductComment(ProductComment pc) {
		
	//}
	
	//리뷰 코멘트 수정
	
	
	//리뷰 코멘트 삭제
	
	
	//상품 번호에 맞는 리뷰 찾기
	//public List<ProductComment> selectProductComment(int ProductNo){
		
	//}
	
	//주문 등록
	
	
	//주문 삭제 
	
	
	//주문 수정은 없어도 될거 같음 환불 취소 -> 다시 주문
	
	
	//위시리스트 등록
	
	
	//위시리스트 삭제
	
	
	
	
	
	
	
	
	
	
	
	

}

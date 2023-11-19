package com.web.product.model.service;

import static com.web.common.JDBCTemplate.close;
import static com.web.common.JDBCTemplate.commit;
import static com.web.common.JDBCTemplate.getConnection;
import static com.web.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.web.product.dao.ProductDao;
import com.web.product.dto.ProductCoordinateDto;
import com.web.product.dto.ProductDto;
import com.web.product.dto.ProductcourseDto;
import com.web.product.dto.ProductsreviewDto;
import com.web.product.dto.ProductwishilistDto;

public class ProductService {

	private ProductDao dao = new ProductDao();
	//나라별 전체 상품 조회
	public List<ProductDto> selectproductAllByCountry(int coordinateNo) {
		Connection conn = getConnection();
		List<ProductDto> allProducts = dao.selectRecentproductByCountry(conn, coordinateNo);
		close(conn);
		return allProducts;
	}
	
	
	
	// 나라별 최신상품 리스트 가져오기
	public List<ProductDto> selectRecentproductByCountry(int coordinateNo) {
		Connection conn = getConnection();
		List<ProductDto> recentProducts = dao.selectRecentproductByCountry(conn, coordinateNo);

//		recentProducts.forEach(e->{
//			List<ProductattachmentDto> images = dao.selectImages(conn, e.getProductNo());
//			e.setAttachment(images);
//		});
		close(conn);
		return recentProducts;
	}

	// 나라별 할인상품 리스트 가져오기
	public List<ProductDto> selectDicountproductByCountry(int coordinateNo) {
		Connection conn = getConnection();
		List<ProductDto> discountProducts = dao.selectDicountproductByCountry(conn, coordinateNo);

//		discountProducts.forEach(e -> {
//			List<ProductattachmentDto> images = dao.selectImages(conn, e.getProductNo());
//			e.setAttachment(images);
//		});
		close(conn);
		return discountProducts;
	}

	// 나라별 베스트 상품(조회수) 리스트 가져오기

	public List<ProductDto> selectBestproductByCountry(int coordinateNo) {
		Connection conn = getConnection();
		List<ProductDto> bestProducts = dao.selectBestproductByCountry(conn, coordinateNo);

		/*
		 * bestProducts.forEach(e -> { List<ProductattachmentDto> images =
		 * dao.selectImages(conn, e.getProductNo()); e.setAttachment(images); });
		 */

		close(conn);
		return bestProducts;
	}

	// 번호별 상품 가져오는 메소드
	public ProductDto selectProductByNo(int productNo, boolean readResult) {
		Connection conn = getConnection();
		ProductDto product = dao.selectProductByNo(conn, productNo);
		if (product != null && !readResult) {
			int result = dao.updateProductReadCount(conn, productNo);
			if (result > 0) {
				commit(conn);
				product.setProductReadcount(product.getProductReadcount() + 1);
			} else
				rollback(conn);
		}
		close(conn);
		return product;
	};

	// 댓글 입력하는 메소드

	public int insertProductComment(ProductsreviewDto pr) {
		Connection conn = getConnection();
		int result = dao.insertProductComment(conn, pr);
		if (result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	// 댓글 조회하는 메소드

	public List<ProductsreviewDto> selectProductComment(int productNo) {
		Connection conn = getConnection();
		List<ProductsreviewDto> comments = dao.selectProductComment(conn, productNo);
		close(conn);
		return comments;

	}

	// 댓글 카운트 하는 메소드
	public int selectProductCountByNo(int productNo) {
		Connection conn = getConnection();
		int commentCount = dao.selectProductCountByNo(conn, productNo);
		close(conn);
		return commentCount;

	}
	
	//위시리스트 인서트 하는 메소드
	public int insertwishlist(ProductwishilistDto wishlist) {
		Connection conn = getConnection();
		int result = dao.insertwishlist(conn, wishlist);
		if (result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	//위시리스트 삭제하는 메소드
	public int removewishlist(ProductwishilistDto wishlist) {
		Connection conn = getConnection();
		int result = dao.removewishlist(conn, wishlist);
		if (result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	//위시리스트 조회하는 메소드
	public List<ProductwishilistDto> selectwishlistByNo(int productNo) {
		Connection conn = getConnection();
		List<ProductwishilistDto> wishlists = dao.selectwishlistByNo(conn, productNo);
		close(conn);
		return wishlists;

	}
	
	//위시리스트 카운트 하는 메소드
	public int selectWishlistCountByNo(int productNo) {
		Connection conn = getConnection();
		int commentCount = dao.selectWishlistCountByNo(conn, productNo);
		close(conn);
		return commentCount;

	}
	
	//상품 코스 조회하는 메소드
	public List<ProductcourseDto> selectCourseByNo(int productNo) {
		Connection conn = getConnection();
		List<ProductcourseDto> course = dao.selectCourseByNo(conn, productNo);
		close(conn);
		return course;
	}
	
	//나라 조회하는 메소드
	public ProductCoordinateDto selectCoordinateByNo(int coordinateNo) {
		Connection conn = getConnection();
		ProductCoordinateDto coordinate = dao.selectCoordinateByNo(conn, coordinateNo);
		close(conn);
		return coordinate;
	}

	// 상품 등록
	// public int insertProduct(Product p) {

	// }

	// 상품 수정

	// 상품 삭제

	// 리뷰 코멘트 등록
	// public int insertProductComment(ProductComment pc) {

	// }

	// 리뷰 코멘트 수정

	// 리뷰 코멘트 삭제

	// 주문 등록

	// 주문 삭제

	// 주문 수정은 없어도 될거 같음 환불 취소 -> 다시 주문

	// 위시리스트 등록

	// 위시리스트 삭제

}

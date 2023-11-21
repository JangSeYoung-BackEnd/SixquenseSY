package com.web.product.syservice;

import static com.web.common.JDBCTemplate.close;
import static com.web.common.JDBCTemplate.getConnection;

import java.sql.Connection;


import com.web.product.dto.ProductDto;
import com.web.product.sydao.ProductMainDao;


public class ProductMainService {
	private ProductMainDao dao = new ProductMainDao();
	
	public ProductDto selectProductByNo(int productNo, boolean readResult) {
		Connection conn = getConnection();
		ProductDto product = dao.SelectProductByNo(conn, productNo);
		close(conn);
		return product;
	};
}

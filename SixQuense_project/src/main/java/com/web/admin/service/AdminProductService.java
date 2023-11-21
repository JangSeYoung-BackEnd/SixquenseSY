package com.web.admin.service;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.web.admin.dao.AdminProductDao;
import com.web.product.dto.GuideDto;
import com.web.product.dto.ProductDto;
import static com.web.common.JDBCTemplate.*;

public class AdminProductService {
	private AdminProductDao dao = new AdminProductDao();

	public boolean insertProduct(String nation, String guideName, ProductDto p, List<Map<String, String>> files,
			Map<String, String> courseMap) {
		boolean result = false;
		Connection conn = getConnection();
		int productResult = dao.insertProduct(conn, nation, guideName, p);
		if (productResult > 0) {
			/* int guideResult = dao.insertGuide(conn, g); */
			int filesResult = dao.insertFiles(conn, files);
			int CourseResult = dao.insertCourse(conn, courseMap);

			if (filesResult > 0 && CourseResult > 0) {
				commit(conn);
				result = true;
			} else {
				rollback(conn);
			}
			close(conn);
		}
		return result;
	}

}
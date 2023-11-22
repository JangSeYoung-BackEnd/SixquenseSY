package com.web.member.service;

import static com.web.common.JDBCTemplate.close;
import static com.web.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.web.member.dao.jhMemberDao;
import com.web.member.dto.Member;
import com.web.product.dto.ProductDto;
import com.web.product.dto.ProductorderinfoDto;
import com.web.product.dto.ProductpaymentDto;
import com.web.product.dto.ProductwishilistDto;

public class jhMemberService {
    private jhMemberDao dao = new jhMemberDao();
    
    public int mypageupdate(Member m) {
		Connection conn=getConnection();
		int result=dao.mypageupdate(conn,m);
		close(conn);
		return result;
	}
    public int selectMemberByNo(int userNo) {
        Connection conn = getConnection();
        int result = dao.selectMemberByNo(conn, userNo);
        close(conn);
        return result;
    }
    public List<ProductwishilistDto> selectWishListByNo(int memberNo) {
        Connection conn = getConnection();
        List<ProductwishilistDto> wish = dao.selectWishListByNo(conn, memberNo);   
        close(conn);
        return wish;
    }
    public List<ProductorderinfoDto> selectProductByNo(int userNo){
    	Connection conn = getConnection();
    	List<ProductorderinfoDto> info = dao.selectProductByNo(conn, userNo);
    	close(conn);
        return info;
    }
    public List<ProductpaymentDto> selectpayByNo(int userNo){
    	Connection conn = getConnection();
    	List<ProductpaymentDto> pay = dao.selectpayByNo(conn, userNo);
    	close(conn);
        return pay;
    }
    public List<ProductDto> selectproductnameByNo(int userNo) {
    	 Connection conn = getConnection();
    	 List<ProductDto> pro= dao.selectproductnameByNo(conn, userNo);
         close(conn);
         return pro;
    }
}



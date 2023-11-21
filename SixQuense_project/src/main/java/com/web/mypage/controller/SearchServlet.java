package com.web.mypage.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

@WebServlet("/search.do")
public class SearchServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("keyword");

        // 데이터베이스 연결 정보 가져오기
        Connection conn = getDBConnection();

        // 데이터베이스에서 검색어 가져오기
        List<String> suggestions = getSearchSuggestionsFromDB(conn, keyword);

        JSONArray jsonArray = new JSONArray();
        for (String suggestion : suggestions) {
            jsonArray.add(suggestion);
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonArray.toJSONString());
    }

 // 데이터베이스 연결을 가져오는 메서드
    private Connection getDBConnection() {
        Connection conn = null;
        try {
            // JDBC 드라이버 로드
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // 데이터베이스 연결 정보 설정
            String url = "jdbc:oracle:thin:@14.36.141.71:8877:xe";
            String user = "SIXQUENSE";
            String pw = "SIXQUENSE";

            // 연결 생성
            conn = DriverManager.getConnection(url, user, pw);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        
        return conn;
    }

    // 데이터베이스에서 검색어를 가져오는 메서드
    private List<String> getSearchSuggestionsFromDB(Connection conn, String keyword) {
        List<String> suggestions = new ArrayList<>();
        try {
            // 여기에 데이터베이스에서 검색어를 가져오는 SQL 쿼리 작성
            String sql = "SELECT DISTINCT PRODUCT_NAME FROM PRODUCTS WHERE PRODUCT_NAME LIKE ?";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, "%"+keyword + "%");

                try (ResultSet rs = pstmt.executeQuery()) {
                    while (rs.next()) {
                        suggestions.add(rs.getString("PRODUCT_NAME"));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) {
                    conn.close();  // 데이터베이스 연결 닫기
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return suggestions;
    }
}
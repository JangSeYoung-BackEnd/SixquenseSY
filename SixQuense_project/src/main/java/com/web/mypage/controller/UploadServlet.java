package com.web.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/uploadfro.do")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UploadServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
		 if (!ServletFileUpload.isMultipartContent(request)) {
	            throw new IllegalArgumentException("올바른 파일이 아닙니다.");
	        } else {
	            // 파일 저장 경로 설정
	            String path = getServletContext().getRealPath("/upload/mypage");

	            // 파일 업로드 처리를 위한 MultipartRequest 객체 생성
	            MultipartRequest mr = new MultipartRequest(request, path, 10224 * 1024 * 100, "UTF-8",
	                    new DefaultFileRenamePolicy());

	            // 업로드된 파일 정보 저장을 위한 리스트
	            List<Map<String, String>> files = new ArrayList<>();

	            // 업로드된 파일 정보 추출
	            Enumeration names = mr.getFileNames();
	            while (names.hasMoreElements()) {
	                String name = (String) names.nextElement();
	                String re = mr.getFilesystemName(name);
	                String ori = mr.getOriginalFileName(name);
	                files.add(Map.of("rename", re, "oriName", ori));
	            }

	            // 업로드된 파일 정보 출력
	            files.forEach(e -> {
	                System.out.println(e);
	            });

	            // 사용자 아이디 가져오기
	            String userNo = mr.getParameter("userNo");
	            System.out.println(userNo);

	            // 여기에 데이터베이스 업데이트 코드 추가
	            // ...

	            // 파일 업로드 성공 시 클라이언트에게 응답
	            response.getWriter().write("업로드 성공!");
	        }
	    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

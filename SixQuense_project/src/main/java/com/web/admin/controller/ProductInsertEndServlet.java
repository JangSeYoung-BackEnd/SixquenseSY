package com.web.admin.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.web.admin.service.AdminProductService;
import com.web.common.exception.BadAccessException;
import com.web.product.dto.GuideDto;
import com.web.product.dto.ProductDto;
import com.web.product.dto.ProductattachmentDto;
import com.web.product.dto.ProductcourseDto;

/**
 * Servlet implementation class ProductInsertEndServlet
 */
@WebServlet("/admin/productinsertend.do")
public class ProductInsertEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductInsertEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!ServletFileUpload.isMultipartContent(request)) { //HttpServletRequest를 대입
			throw new IllegalArgumentException("안돼");
		}else {
			//1. 파일을 저장할 위치를 절대 경로(c드라이브부터)로 가져오기
			//ServletContext클래스에서 getRealPath("/") -> 루트부터 webapp폴더로 바로 잡힌다
			String path = getServletContext().getRealPath("/upload/product/");
			System.out.println(path);
			//2. 최대 파일 크기 지정
			int maxSize = 1024*1024*100; //100MB
			//3. 인코딩 설정
			String encoding="UTF-8";
			//4. rename규칙
			DefaultFileRenamePolicy dfr = new DefaultFileRenamePolicy();
			
			//매개변수값을 이용해서 MultipartRequest 객체 생성하기
			MultipartRequest mr =new MultipartRequest(request, path, maxSize, encoding, dfr);
			
			//db에 해당 내용을 저장(MultipartRequest로 가져와야한다)
			//상품 정보
			String nation = mr.getParameter("nation");
			String productName =mr.getParameter("productName");
			int price = Integer.parseInt(request.getParameter("price"));
			double discountRate  = (double)Integer.parseInt(mr.getParameter("discountRate"));
			int minCount = Integer.parseInt(request.getParameter("minCount"));
			int maxCount = Integer.parseInt(request.getParameter("maxCount"));
			int productDuration = Integer.parseInt(request.getParameter("productDuration"));
			String productDetail = mr.getParameter("productDetail"); 
			String editorNote = mr.getParameter("editorNote");
			String[] productDay = mr.getParameterValues("productDay");
			
			//가이드 정보
			String guideName = mr.getParameter("guideName");
			String guidePhone = mr.getParameter("guidePhone");
			
			//코스 설명
			String courseName1 = mr.getParameter("courseName1");
			String courseDetail1 = mr.getParameter("courseDetail1");
			String courseName2 = mr.getParameter("courseName2");
			String courseDetail2 = mr.getParameter("courseDetail2");
			String courseName3 = mr.getParameter("courseName3");
			String courseDetail3 = mr.getParameter("courseDetail3");
			String courseName4 = mr.getParameter("courseName4");
			String courseDetail4 = mr.getParameter("courseDetail4");
			String courseName5 = mr.getParameter("courseName5");
			String courseDetail5 = mr.getParameter("courseDetail5");

			//업로드된 파일명
			//MultipartRequest클래스가 제공하는 메소드를 이용해서 가져온다
			//getOriginalFileName("key") //typefile의 name 속성값
			//getFilesystemName("key")
			String ori=mr.getOriginalFileName("filebutton");
			String rename=mr.getFilesystemName("filebutton");
			
			//내부적으로 사용할 때는 rename(rename된게 실질적인 데이터)
			//어떤 파일인지 다운로드 할 수 있게 볼 수 있게 할때는 ori
			//원본 파일 이름 주지 않아도 될때는 그냥 rename만 저장
		
			ProductDto p = ProductDto.builder()	
		    		.build();
			
			ProductcourseDto c = ProductcourseDto.builder()
					.build();
			
			GuideDto g = GuideDto.builder()
					.build();
			
			ProductattachmentDto a = ProductattachmentDto.builder()
					.OrginalFilename(ori)
					.RenameFilename(rename)
					.build();
			
			//int result = new AdminProductService().insertProduct(p);
			//int result = new AdminProductService().insertCourse(c);
			
			
			//인서트 성공 여부
			//추가한 결과 사용자에게 보여주기
		    //result==0 등록실패, result==1이면 등록성공
		    //등록 실패 : 등록실패 메시지 출력하고 입력화면으로 이동
		    //등록 성공 : 등록 성공 메시지 출력하고 조회페이지로 이동 
			//-> 메시지.jsp없을 때 등록성공시 request.getRequestDispatcher 안된다 
			//-> 요청하는 서블릿 주소에 남아있고 데이터 계속 전달하면서 계속 등록됨(이해안되면 1031 쌤 강의보기)
		    String msg,loc;
			
			/*
			 * if(result>0) { msg="등록성공되었습니다"; loc="/notice/noticeList.do"; //서블릿으로
			 * 연결해줘야함(서블릿으로 연결해야 데이터가 list에 들어가고 연결된 화면 jsp로 연결) }else { msg="등록실패되었습니다";
			 * loc="/notice/makeNotice.do";
			 * 
			 * File delFile = new File(path+"/"+rename); if(delFile.exists())
			 * delFile.delete(); //실패해도 저장된 파일 삭제
			 * 
			 * }
			 */
			/*
			 * request.setAttribute("msg", msg); request.setAttribute("loc", loc);
			 * 
			 * request.getRequestDispatcher("/views/common/msg.jsp").forward(request,
			 * response);
			 */
		}
			
			
			
			
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package com.web.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
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
import com.web.admin.service.AdminProductService;
import com.web.product.dto.GuideDto;
import com.web.product.dto.ProductDto;

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
			System.out.println("다낭"+nation);
			String productName =mr.getParameter("productName");
			int price = Integer.parseInt(mr.getParameter("price"));
			double discountRate  = Double.parseDouble(mr.getParameter("discountRate"));
			int minCount = Integer.parseInt(mr.getParameter("minCount"));
			int maxCount = Integer.parseInt(mr.getParameter("maxCount"));
			int productDuration = Integer.parseInt(mr.getParameter("productDuration"));
			String productDetail = mr.getParameter("productDetail"); 
			String editorNote = mr.getParameter("editorNote");
			String[] productDay = mr.getParameterValues("productDay");
			
			//가이드 정보
			String guideName = mr.getParameter("guideName");
			System.out.println("가이드"+guideName);
			String guidePhone = mr.getParameter("guidePhone");
			
			// 코스 정보를 저장할 맵 생성
			Map<String, String> courseMap = new HashMap<>();

			// 매개변수에서 값을 검색하고 맵에 저장합니다.
			courseMap.put( mr.getParameter("courseName1"), mr.getParameter("courseDetail1"));
			courseMap.put( mr.getParameter("courseName2"), mr.getParameter("courseDetail2"));
			courseMap.put( mr.getParameter("courseName3"), mr.getParameter("courseDetail3"));
			courseMap.put( mr.getParameter("courseName4"), mr.getParameter("courseDetail4"));
			courseMap.put( mr.getParameter("courseName5"), mr.getParameter("courseDetail5"));

			//저장된 파일들 db에 넣어주기
			Enumeration names = mr.getFileNames();
			List<Map<String,String>> files = new ArrayList<>(); //여러개 들어가니까 List, file이름 ori, rename 넣으려고 Map
			while(names.hasMoreElements()){
				String name =(String)names.nextElement();
				String re = mr.getFilesystemName(name); //rename
				String ori=mr.getOriginalFileName(name); //oriname
				files.add(Map.of("rename",re,"oriName",ori));
				
			}
			files.forEach(e-> {System.out.println(e);});
		
			ProductDto p = ProductDto.builder()	
					.ProductName(productName)
					.ProductPrice(price)
					.ProductDiscountRate(discountRate)
					.MinCount(minCount)
					.MaxCount(maxCount)
					.ProductDuration(productDuration)
					.ProductDay(productDay)
					.ProductDetail(productDetail)
					.EditorNote(editorNote)
		    		.build();
			
			
			/*
			 * GuideDto g = GuideDto.builder() .GuideName(guideName) .GuidePhone(guidePhone)
			 * .build();
			 */
			
		
			boolean result = new AdminProductService().insertProduct(nation, guideName, p, files, courseMap);
		
	
			
			
			//인서트 성공 여부
			//추가한 결과 사용자에게 보여주기
		    //result==0 등록실패, result==1이면 등록성공
		    //등록 실패 : 등록실패 메시지 출력하고 입력화면으로 이동
		    //등록 성공 : 등록 성공 메시지 출력하고 조회페이지로 이동 
			//-> 메시지.jsp없을 때 등록성공시 request.getRequestDispatcher 안된다 
			//-> 요청하는 서블릿 주소에 남아있고 데이터 계속 전달하면서 계속 등록됨(이해안되면 1031 쌤 강의보기)
		    //String msg,loc;
			
			
			/*
			 * if(result=false) { msg="등록성공되었습니다"; loc="/notice/noticeList.do"; //서블릿으로
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

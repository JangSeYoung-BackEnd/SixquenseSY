package com.web.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
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
import com.web.admin.service.AdminProductService;
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
			System.out.println(price);
			double discountRate  = Double.parseDouble(mr.getParameter("discountRate"));
			int minCount = Integer.parseInt(mr.getParameter("minCount"));
			int maxCount = Integer.parseInt(mr.getParameter("maxCount"));
			int productDuration = Integer.parseInt(mr.getParameter("productDuration"));
			System.out.println("시간"+productDuration);
			String productDetail = mr.getParameter("productDetail"); 
			String editorNote = mr.getParameter("editorNote");
			String[] productDay = mr.getParameterValues("productDay");
			System.out.println("dydlf"+Arrays.toString(productDay));
			
			//가이드 정보
			String guideName = mr.getParameter("guideName");
			System.out.println("가이드"+guideName);
			String guidePhone = mr.getParameter("guidePhone");
			
			// 코스 정보를 저장할 맵 생성

			String[] courseName=mr.getParameterValues("courseName");
			String[] courseDetail=mr.getParameterValues("courseDetail");
			List<Map<String,String>> courseList=new ArrayList();
			if(courseName!=null&&courseDetail!=null) {
				for(int i=0;i<courseName.length;i++) {
					//System.out.println(courseName[i]+" : "+courseDetail[i]);
					courseList.add(Map.of(courseName[i],courseDetail[i]));
				}
			}
			
			
			// 매개변수에서 값을 검색하고 맵에 저장합니다.
			
//			if(mr.getParameter("courseName1")!=null ||mr.getParameter("courseDetail1")!=null) {
//				courseMap.put( mr.getParameter("courseName1"), mr.getParameter("courseDetail1"));
//			}if(mr.getParameter("courseName2")!=null ||mr.getParameter("courseDetail2")!=null){
//				courseMap.put( mr.getParameter("courseName2"), mr.getParameter("courseDetail2"));
//			}if(mr.getParameter("courseName3")!=null ||mr.getParameter("courseDetail3")!=null) {
//				courseMap.put( mr.getParameter("courseName3"), mr.getParameter("courseDetail3"));
//			}if(mr.getParameter("courseName4")!=null ||mr.getParameter("courseDetail4")!=null) {
//				courseMap.put( mr.getParameter("courseName4"), mr.getParameter("courseDetail4"));
//			}if(mr.getParameter("courseName5")!=null ||mr.getParameter("courseDetail5")!=null) {
//				courseMap.put( mr.getParameter("courseName5"), mr.getParameter("courseDetail5"));
//			}
			
			
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
			
		
			boolean result = new AdminProductService().insertProduct(nation, guideName, p, files, courseList);
		
			if(!result) {
				  for (Map<String, String> file : files) {
		                File deleteFile = new File(path+"/"+file.get("rename"));
		                if (deleteFile.exists()) {
		                    deleteFile.delete();
		                }
		            }
			}
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

package com.web.accompany.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.web.accompany.model.dto.AccompanyDTO;
import com.web.accompany.service.AccompanyServiceKH;
import com.web.common.exception.BadAccessException;

/**
 * Servlet implementation class AccompanyWriteEndServlet
 */
@WebServlet("/accompnay/accompanywriteend.do")
public class AccompanyWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccompanyWriteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!ServletFileUpload.isMultipartContent(request)) {
			throw new BadAccessException("잘못된 접근입니다. 관리자에게 문의하세요 :(");
		}else {
			String path=getServletContext().getRealPath("/upload/accompany/");
			System.out.println(path);
			int maxSize=1024*1024*100;
			String encoding="utf-8";
			DefaultFileRenamePolicy dfr=new DefaultFileRenamePolicy();
			MultipartRequest mr=new MultipartRequest(request, path, maxSize,encoding, dfr);
			String title=mr.getParameter("accompany-title");
			String content=mr.getParameter("accompany-content");
			String openchattinglink=mr.getParameter("kakao-link");
			String nation=mr.getParameter("nation");
			System.out.println(nation);
			String ori=mr.getFilesystemName("accompany-file");
			String rename=mr.getFilesystemName("accompany-file");
			String userId=request.getParameter("useId");
			AccompanyDTO a=AccompanyDTO.builder()
					.accompanyTitle(title)
					.accompanyContent(content)
					.openChattingLink(openchattinglink)
					.originalFilename(ori)
					.renameFilename(rename)
					.build();
			int result=new AccompanyServiceKH().insertAccompany(a,nation,userId);
		}		
		request.getRequestDispatcher("/accompany/accompanylist.do").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

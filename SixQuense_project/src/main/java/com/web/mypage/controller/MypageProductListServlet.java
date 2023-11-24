package com.web.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.member.service.jhMemberService;
import com.web.product.dto.ProductDto;
import com.web.product.dto.ProductorderinfoDto;
import com.web.product.dto.ProductpaymentDto;

/**
 * Servlet implementation class MypageWishSevlet
 */
@WebServlet("/ProductList.do")
public class MypageProductListServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageProductListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         String userNoStr = request.getParameter("userNo");

           if (userNoStr == null || userNoStr.isEmpty()) {
               response.sendRedirect(request.getContextPath() + "/error.jsp");
           } else {
               try {
                   int userNo = Integer.parseInt(userNoStr);
                   List<ProductorderinfoDto> info = new jhMemberService().selectProductByNo(userNo);
                   System.out.println("유저" + userNo);
                   System.out.println(info + "info");
                   request.setAttribute("info", info);
                   request.getRequestDispatcher("/views/mypagekategorie/ProductList.jsp").forward(request, response);
               } catch (NumberFormatException e) {
                   response.sendRedirect(request.getContextPath() + "/error.jsp");
               }
           }
       }


   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
   }

}
package com.web.mypage.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web.member.dto.Member;
import com.web.member.service.jhMemberService;

/**
 * Servlet implementation class MypageUpdateServlet
 */
@WebServlet(urlPatterns="/update.do",name="memberupdateinfor")
public class MypageUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Member loginMember = (Member) session.getAttribute("loginMember");
        if (loginMember != null) {
        	loginMember.setUserPw(request.getParameter("pw"));
        	loginMember.setKruserName(request.getParameter("name"));
        	loginMember.setPhone(request.getParameter("phone"));
        	loginMember.setUserDd(Date.valueOf(request.getParameter("Dd")));
        	loginMember.setUserIntroduce(request.getParameter("intro"));
        	loginMember.setGender(request.getParameter("gender"));
        	loginMember.setNotificatIonset(request.getParameter("acc"));
            

            int result = new jhMemberService().mypageupdate(loginMember);
            String userpw=loginMember.getUserPw();
            
            if (result > 0) {
                request.setAttribute("loginMember", loginMember);
                request.getRequestDispatcher("/views/mypagekategorie/Updatedata.jsp").forward(request, response);
            } else {
                // 업데이트 실패 처리
                response.sendRedirect(request.getContextPath() + "/views/common/failMessage.jsp");
            }
        } else {
            // 로그인 멤버가 null일 경우 예외 처리 또는 로그 메시지 추가
            System.out.println("loginMember is null");
          
        }
    }
    


	
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}

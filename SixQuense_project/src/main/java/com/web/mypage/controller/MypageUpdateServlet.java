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
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.web.member.dto.Member;

/**
 * Servlet implementation class MypageUpdateServlet
 */
@WebServlet("/update.do")
public class MypageUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 세션에서 현재 로그인 멤버 정보를 가져옴
        HttpSession session = request.getSession();
        Member loginMember = (Member) session.getAttribute("loginMember");

        // 로그인 멤버가 null이 아닌 경우에만 처리
        if (loginMember != null) {
            // 새로운 비밀번호가 파라미터로 전달되면, 현재 로그인 멤버의 비밀번호를 업데이트
            String newPassword = request.getParameter("pw");
            if (!newPassword.equals(loginMember.getUserPw())) {
                loginMember.setUserPw(newPassword);
            }

            // 파일 업로드를 위한 경로 설정
            String path = getServletContext().getRealPath("/upload/mypage");
            
            // 파일 업로드 처리를 위한 MultipartRequest 객체 생성
            MultipartRequest mr = new MultipartRequest(request, path, 10224 * 1024 * 100, "UTF-8",
                    new DefaultFileRenamePolicy());

            // 업로드된 파일의 정보를 저장할 리스트
            List<Map<String, String>> files = new ArrayList<>();
            
            // 업로드된 파일들의 이름 정보를 가져와 리스트에 저장
            Enumeration names = mr.getFileNames();
            while (names.hasMoreElements()) {
                String name = (String) names.nextElement();
                String re = mr.getFilesystemName(name);
                String ori = mr.getOriginalFileName(name);
                files.add(Map.of("rename", re, "oriName", ori));
            }

            // 업로드된 파일이 존재하면, 첫 번째 파일의 이름을 프로필 이미지로 설정
            if (!files.isEmpty()) {
                String fileName = files.get(0).get("rename");
                loginMember.setSetProfileImage(fileName);
            }

            // 이하 코드는 업데이트된 정보로 데이터베이스를 업데이트하거나 다른 작업을 수행하는 부분
            // ...

        } else {
            // 로그인 멤버가 null일 경우 예외 처리 또는 로그 메시지 추가
            System.out.println("loginMember is null");
            // 예외 처리 또는 다른 작업 수행
        }
    }



    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@page import ="com.web.member.dto.Member"%>
<%

   Member loginMember=(Member)session.getAttribute("loginMember");
   Cookie[] cookies=request.getCookies();
   String saveId=null;
   if(cookies!=null){
      for(Cookie c:cookies){
         String name=c.getName();
         if(name.equals("saveId")){
            saveId=c.getValue();
            break;
         }
      }
   }
%>
   
<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>메인페이지</title>

<!-- Google Font -->
<link
   href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
   rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/bootstrap.min.css"
   type="text/css">
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/font-awesome.min.css"
   type="text/css">
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/elegant-icons.css"
   type="text/css">
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/nice-select.css"
   type="text/css">
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/jquery-ui.min.css"
   type="text/css">
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/owl.carousel.min.css"
   type="text/css">
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/slicknav.min.css"
   type="text/css">
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/style.css" type="text/css">
   
   
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>

<style>
    
    #search {
        width: 200px;
        padding: 10px;
    }

    #data {
        display: none;
    }
</style>   
<body>
   <!-- 페이지 넘어갈때 로딩바 -->
   

   <!--style="position: fixed; z-index: 999; background-color: white;-->
    <!-- 헤더 -->
    
    <header class="header" style="display: flex; justify-content: center;">
        <div style="position: fixed; z-index: 999; background-color: white;">
        	<%if(loginMember!=null && loginMember.getUserId().equals("admin")) {%>
        	<div style="text-align:right;width: 2000px;padding-right: 400px; padding-top: 10px">
            <b>관리자님 반갑습니다!</b>
            <a href="<%=request.getContextPath()%>/views/admin/product/adminProductAdd.jsp">관리자 페이지</a>
            </div>
            <%} %>
            <div class="row" style="display: flex; justify-content: center;">
                <div class="col-lg-2">
                    <div class="header__logo">
                        <a href="<%=request.getContextPath()%>/index.jsp"><img src="<%=request.getContextPath() %>/img/logo/ttlogo.png" width="100%"></a>
                    </div>
                </div>              
                    <div class="hero__search__form" style="margin-left: 70px;">
                   <form action="<%=request.getContextPath()%>/member/searchTotalservlet.do">
                      <input type="search" name="searchValue" id="searchValue" list="data" placeholder="어디로 떠나실 건가요?">
                      <button type="submit" class="site-btn" >SEARCH</button>
                      <datalist id="data"></datalist>
                  </form>
            </div>
                    <%if(loginMember==null) {%>
                    <div class="header__cart" style="margin-left: 60px;">
                        <ul>
                            <div class="header__top__right"><div class="header__top__right__auth">
                                <button type="button" class="btn btn-success"><a href="<%=request.getContextPath() %>/loginpage.do"></i><b style="color: white;">로그인</b></a></button>
                            </div>
                        </ul>
                    </div>
                    <%}else {%>
                <div class="mtpageBtn" style="margin-top: 30px; margin-left: 45px;">
                    <a href="<%=request.getContextPath()%>/views/common/Mypage.jsp" >
                    <img src="<%=request.getContextPath()%>/img/icon/로그인아이콘.png" style="width: 40px">
                    </a>
                </div>
                <div class="wirtebtn" style="display: flex; align-items: center; margin-left: 70px; margin-top: 30px;">
                    <button type="button" class="btn btn-success" onclick="location.assign('<%=request.getContextPath()%>/accompnay/accompanywrite.do')"
                    style="width: 120px; height: 44px; margin-bottom: 25px;"><b>글쓰기</b></button>
                </div>
                <div class="logoutBtn" style=" margin-top: 30px; margin-left: 20px;">
            <input type="button" class="btn btn-secondary"
               onclick="location.replace('<%=request.getContextPath()%>/logout.do');" 
               value="로그아웃">
            </div>         
                
                <%} %>
            </div>
                 <nav class="header__menu" style="text-align: center; display: contents;">
                    <ul>
                        <li class="active"><a href="<%=request.getContextPath()%>/index.jsp"><img src="<%=request.getContextPath() %>/img/mainicon/홈1.png" width="25px"> 홈</a></li>
                        <li><a href= "<%=request.getContextPath() %>/product/productmain.do"><img src="<%=request.getContextPath() %>/img/mainicon/상품.png" width="25px;"> 상품</a>
                        </li>
                        <li><a href= "<%=request.getContextPath() %>/accompany/accompanylist.do"><img src="<%=request.getContextPath() %>/img/mainicon/동행.png" width="25px;"> 동행</a>
                        </li>
                        <li><a href= "<%=request.getContextPath()%>/views/common/inquiry.jsp"><img src="<%=request.getContextPath() %>/img/mainicon/문의사항.png" width="25px;"> 문의사항</a></li>
                    </ul>
                </nav>
        </div>
    </header>
    <script>
    //검색 구현하는 기능 
    function searchOnClickForm() {
       var searchValue = document.getElementById("searchValue").value;
       console.log(searchValue);
       location.assign("<%=request.getContextPath()%>/member/searchTotalservlet.do?searchValue="+searchValue);
   }
    
    <%-- function searchSubmitForm() {
       
        var searchValue = document.getElementById("searchvalue").value;
        var form = document.getElementById("searchForm");
        console.log("Search value: " + searchValue);
        form.action = "<%=request.getContextPath()%>/member/searchTotalservlet.do?searchValue=" + searchValue;
        // 폼 제출
        form.submit();  
        return false; 
    } --%>
    //검색 데이터를 보여주는 ajax
	   $(document).ready(function () {
	    $("#searchvalue").on("input", function () {
	        var keyword = $(this).val();
	        $.ajax({
	            url: "<%=request.getContextPath()%>/search.do",
	            method: "GET",
	            data: { keyword: keyword },
	            dataType: 'json',  // 데이터 형식을 명시적으로 지정
	            success: function (data) {
	                var dataList = $("#data");
	                dataList.empty();
	                $.each(data, function (index, value) {
	                    dataList.append("<option value='" + value + "'>" + value + "</option>");
	                    // 옵션 요소를 닫아줌
	                });
	            },
	            error: function (xhr, status, error) {
	                console.error("Ajax request failed. Status: " + status + ", Error: " + error);
	            }
	        });
	    });
	});
	</script>
    <!-- 헤더 -->
    <html>
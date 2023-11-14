<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="java.util.List, com.web.accompany.model.dto.AccompanyDTO" %>
<%
	List<AccompanyDTO> accompanys=(List<AccompanyDTO>)request.getAttribute("accompanys");
%>
<style>
    .menu {
        width: 200px;
        overflow: hidden;
        border-width: 1px;
    }
    .menu > li {
        width: 100%;
        line-height: 40px;
        background-color: #ffffff;
    }
    .submenu {
        height: 0; /*ul의 높이를 안보이게 처리*/
        overflow: hidden;
    }
    .submenu > li {
        line-height: 50px;
        background-color: #7fad39;
    }
    .menu > li:hover a{
        background-color: #7fad39;
        color: white;
    }
    .menu > li:hover .submenu {
        height: auto;
        /* transition-duration: 1s; */
    }
    .popularity-btn {
        border-width: 1px;
        color: #ffffff;
        background-color: #28a745;
        border: none;
    }
    .recent-btn{
        border-width: 1px;
        color: #ffffff;
        background-color: #28a745;
        border: none;
    }
    .communityBtn{
        color: white;
        background-color: #7fad39;
    }
</style>
<body>
	<section class="product spad" style="margin-top: 150px;">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <h4>커뮤니티 메뉴</h4>
                            <div style="border: 2px solid #7fad39; width: 200px;"></div>
                            <div style="margin: 10px 0px 10px 0px;">
                                <div id="accompany" onclick="accompanyBtn();" style="width: 200px; font-weight: bold;">동행</div>
                                <div id="cumunity" onclick="cumunityBtn();" style="width: 200px; font-weight: bold">여행리뷰</div>
                            </div>
                            <div style="border: 2px solid #7fad39; width: 200px;"></div>
                            <ul class="menu">
                                <li><a href="#">동남아·대만</a>
                                    <ul class="submenu">
                                        <li><a href="#">방콕·파타야</a></li>
                                        <li><a href="#">호치민·나트랑·달랏</a></li>
                                        <li><a href="#">푸켓</a></li>
                                        <li><a href="#">코타카나발루</a></li>
                                        <li><a href="#">대만</a></li>
                                        <li><a href="#">보홀</a></li>
                                        <li><a href="#">싱가포르</a></li>
                                        <li><a href="#">세부·클락</a></li>
                                        <li><a href="#">보라카이</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">일본</a>
                                    <ul class="submenu">
                                        <li><a href="#">후쿠오카</a></li>
                                        <li><a href="#">오사카·교토</a></li>
                                        <li><a href="#">도쿄</a></li>
                                        <li><a href="#">샷포로</a></li>
                                        <li><a href="#">오키나와</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">유럽</a>
                                    <ul class="submenu">
                                        <li><a href="#">영국</a></li>
                                        <li><a href="#">프랑스</a></li>
                                        <li><a href="#">이탈리아</a></li>
                                        <li><a href="#">스위스</a></li>
                                        <li><a href="#">스페인·포르투칼</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">미주·캐나다</a>
                                    <ul class="submenu">
                                        <li><a href="#">미서부</a></li>
                                        <li><a href="#">미동부</a></li>
                                        <li><a href="#">하와이</a></li>
                                        <li><a href="#">캐나다</a></li>
                                        <li><a href="#">호주</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-7">
                    <div class="product__discount">
                        <div class="section-title product__discount__title">
                            <h2>동행</h2>
                        </div>
                        <!-- 최신순, 인기순으로 동행게시글 보여주는 기능 -->
                        <button onclick="" class="recent-btn">최신순</button>
                        <button onclick="" class="popularity-btn">인기순</button>
                    </div>
                    <div class="row">
                    	<% if(!accompanys.isEmpty()){ 
                    		for(AccompanyDTO a:accompanys){%>
		                        <div class="col-lg-4 col-md-6 col-sm-6" onclick="location.assign('<%=request.getContextPath()%>/accompany/accompanyview.do?no=<%=a.getAccompanyNo() %>');">
		                            <div class="product__item">
		                                <div class="product__item__pic set-bg" data-setbg="<%=request.getContextPath()%>/img/accompany/traveldata.jpg" style="border-radius: 20%; ">
		                                    <ul class="product__item__pic__hover">
		                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
		                                    </ul>
		                                </div>
		                                <div class="product__item__text">
		                                    <a style="display: inline-block; overflow: hidden; width: 210px; text-overflow: ellipsis;"><%=a.getAccompanyTitle() %></a>
		                                    <a style="display: inline-block; overflow: hidden; width: 210px; text-overflow: ellipsis;"><%=a.getAccompanyContent() %></a>
		                                </div>
		                            </div>
		                        </div>
	                        <%} %>
                        <%} %>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<script>
	   function accompanyBtn(){
	       if($("#accompany")){
	           $("#accompany").addClass("communityBtn");
	           $("#cumunity").removeClass("communityBtn");
	       }
	   }
	   function cumunityBtn(){
	       if($("#cumunity")){
	           $("#cumunity").addClass("communityBtn");
	           $("#accompany").removeClass("communityBtn");
	       }
	   }
	</script>
</body>
<%@ include file="/views/common/footer.jsp"%>

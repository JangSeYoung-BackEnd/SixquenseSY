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
                            <div style="border: 2px solid #7fad39; width: 200px;"></div>
                            <div style="padding:10px 0px 10px 0px; font-weight:bold;">대륙별 게시글 보기</div>
                            <div style="border: 2px solid #7fad39; width: 200px;"></div>
                            <ul class="menu">
                            	<li><a>전체보기</a></li>
                                <li><a>동남아·대만</a></li>
                                <li><a>일본</a></li>
                                <li><a>유럽</a></li>
                                <li><a>미주·캐나다</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-7">
                    <div class="product__discount">
                        <div class="section-title product__discount__title">
                        <img src="<%=request.getContextPath() %>/img/mainicon/동행.png" width="50px" height="50px" style="margin:0px 0px 10px 0px">
                            <span style="font-size:25px; font-weight:bold">동행 게시글</span>
                            <div style="border: 2px solid #7fad39; width: 200px;"></div>
                        </div>
                        <!-- 최신순, 인기순으로 동행게시글 보여주는 기능 -->
                        <button onclick="location.assign('<%=request.getContextPath()%>/accompany/accompanylist.do')" class="recent-btn">최신순</button>
                        <button onclick="location.assign('<%=request.getContextPath()%>/accompany/accompanypopularity.do')" class="popularity-btn">인기순</button>
                    </div>
                    <div class="row">
                    	<% if(!accompanys.isEmpty()){ 
                    		for(AccompanyDTO a:accompanys){%>
		                        <div class="col-lg-4 col-md-6 col-sm-6" onclick="location.assign('<%=request.getContextPath()%>/accompany/accompanyview.do?no=<%=a.getAccompanyNo() %>');">
		                            <div class="product__item">
		                                <div class="product__item__pic set-bg" data-setbg="<%=request.getContextPath()%>/upload/accompany/<%=a.getRenameFilename()%>" style="border-radius: 20%;">
		                                    <ul class="product__item__pic__hover">
		                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
		                                    </ul>
		                                </div>
		                                <div class="product__item__text">
		                                	<a style="display: inline-block; overflow: hidden; width: 210px; text-overflow: ellipsis;">[<%=a.getAccompanyStatus().equals("asClose")?"모집마감":"모집중"%>]</a>
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
	$(document).ready(function(){
	    $(".menu>ul").click(function(){
	        // 클릭된 요소의 텍스트 값을 가져옴
	        const countryText = $(this).text();
	        // 가져온 텍스트를 콘솔에 출력
	        console.log(countryText);
	    });
	});
	</script>
</body>
<%@ include file="/views/common/footer.jsp"%>

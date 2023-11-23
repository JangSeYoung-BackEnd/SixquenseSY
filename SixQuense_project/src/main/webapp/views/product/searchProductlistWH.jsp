<%@page import="com.web.accompany.model.dto.AccompanyDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.web.product.dto.ProductDto,com.web.product.dto.ProductCoordinateDto, java.util.List"%>
<%@ include file="/views/common/header.jsp"%>
<%	
	List<ProductDto> searchResult = (List<ProductDto>)request.getAttribute("searchResult");	
	String searchValue = (String )request.getAttribute("searchValue");
	List<AccompanyDTO> accompanys =(List<AccompanyDTO>)request.getAttribute("accompanys");	 
	/* System.out.print(accompanys); */
%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style_je.css" type="text/css">
<style>
.btn-group-lg>.btn, .btn-lg {
	font-size: 14px; ! important;
	margin: 20px 0px; ! important;
	padding: 10px 16px; ! important;
	width: 1106px;
	!
	important;
}

p {
	text-align: left;
	!
	important;
}

.country_package:after {
	position: absolute;
	left: 0;
	bottom: 140px;
	right: 60px;
	height: 4px;
	width: 300px;
	background: #7fad39;
	content: "";
	margin: 0 auto;
}

.blog__sidebar__item__tags a.selected {
	background: #7fad39;
	color: #ffffff;
}
</style>
<body>
	<!-- Blog Section Begin -->
	<section class="blog spad" style="padding-top: 200px";>
		<div class="container">
			<div class="blog__item-container">
				<div class="col-lg-4 col-md-5">
					<div class="country_package">'<%=searchValue%>' 검색결과 
					</div>
					<div class="blog__sidebar">
						<div class="blog__sidebar__item">
							<h4>어떤 여행을 찾고 있나요</h4>
						</div>
					</div>
				</div>
				<!-- 여기서 부터  -->
		<div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-7">
<%--                     <div class="product__discount">
                        <div class="section-title product__discount__title">
                        <img src="<%=request.getContextPath() %>/img/mainicon/동행.png" width="50px" height="50px" style="margin:0px 0px 10px 0px">
                            <span style="font-size:25px; font-weight:bold">동행 게시글</span>
                            <div style="border: 2px solid #7fad39; width: 200px;"></div>
                        </div>
                        <!-- 최신순, 인기순으로 동행게시글 보여주는 기능 -->
                       
                    </div> --%>
                    <div class="row">
                    	<% if(!accompanys.isEmpty()){
                    		for(AccompanyDTO a:accompanys){%>
		                        <div class="col-lg-3 col-md-6 col-sm-6" onclick="location.assign('<%=request.getContextPath()%>/accompany/accompanyview.do?no=<%=a.getAccompanyNo() %>&userNo=<%=loginMember.getUserNo()%>');">
		                            <div class="product__item">
		                                <div class="product__item__pic set-bg" data-setbg="<%=request.getContextPath()%>/upload/accompany/<%=a.getRenameFilename()%>" style="border-radius: 20%;">
		                                    <ul class="product__item__pic__hover">
		                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
		                                    </ul>
		                                </div>
		                                <div class="product__item__text accompany-tca">
			                                <div style="font-weight:bolder; font-size:18px">[<%=a.getAccompanyStatus().equals("acClose")?"모집마감":"모집중"%>]</div>
			                                <div style="font-weight:bolder; height:26px;"><%=a.getAccompanyTitle() %></div>
			                               <%--  <div style="height:50px;"><%=a.getAccompanyContent() %></div> --%>
		                                </div>
		                            </div>
		                        </div>
	                        <%} %>
                        <%}else{ %>
					<div style="width:1106px">
						<p style="text-align: center; padding:100px;"> 동행 검색 결과가 없습니다 </p>
					</div>
					<%} %>
					
                    </div>
                    <div class="button-container">
						<button type="button" class="btn btn-secondary btn-lg btn-block"
							width="1160px"onclick="location.replace('<%=request.getContextPath() %>/accompany/accompanylist.do')">다른지역 동행글 둘러보기</button>
					</div>
                </div>
            </div>
        </div>
				<div class="col-lg-8 col-md-7">
					<%if(!searchResult.isEmpty()){ %>
					<%for(ProductDto p : searchResult){ %>
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="blog__item" id="best">
							<div class="blog__item__pic">
								 <img
								src="<%=request.getContextPath() %>/upload/product/<%=(p.getAttachment().get(0).getRenameFilename()!=null)?p.getAttachment().get(0).getRenameFilename():""%>"	
								alt="패키지 대표 이미지"> 
							</div>
							<div class="blog__item__text">
								<h5>							
									<a href="<%=request.getContextPath()%>/product/productview.do?productNo=<%=p.getProductNo()%>">
									   <%= (p.getProductName() != null) ? p.getProductName() : "" %>
									</a>
								</h5>
								<a
									href="<%=request.getContextPath()%>/product/productview.do?productNo=<%=p.getProductNo()%>"
									class="blog__btn"> <%=p.getProductPrice() %>원 <span
									class="arrow_right"></span></a>
								<div class="edit_note">
									<img src="<%=request.getContextPath() %>/img/logo/ttlogo.png"
										alt="로고이미지입니다" width="120px"><br>
									<div class="edit_text">
										<span>Editor's note</span><br>
										<p><%= (p.getEditorNote() != null) ?p.getEditorNote() : "" %></p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<%}
					}else{ %>
					<div style="width:1106px">
						<p style="text-align: center; padding:100px;"> 상품 검색 결과가 없습니다 </p>
					</div>
					<%} %>
					<div class="button-container">
						<button type="button" class="btn btn-secondary btn-lg btn-block"
							width="1160px"onclick="location.replace('<%=request.getContextPath() %>/product/productmain.do')">다른지역 상품 둘러보기</button>
					</div>
					
				</div>
			</div>
		</div>
	</section>
</body>
<script>
	/* 메뉴 버튼 클릭시 색 변하게 하는 이벤트*/
	// 각 태그에 대한 클릭 이벤트를 처리
	document.querySelectorAll('.blog__sidebar__item__tags a').forEach(
			function(tag) {
				tag.addEventListener('click', function(event) {
					event.preventDefault(); // 기본 동작 방지 (예: 링크 이동)
					location.assign(tag.getAttribute('href'));
				});
			});
</script>

<%@ include file="/views/common/footer.jsp"%>
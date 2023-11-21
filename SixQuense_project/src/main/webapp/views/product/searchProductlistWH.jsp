<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.web.product.dto.ProductDto,com.web.product.dto.ProductCoordinateDto, java.util.List"%>
<%@ include file="/views/common/header.jsp"%>
<%	
	List<ProductDto> searchResult = (List<ProductDto>)request.getAttribute("searchResult");	
	String searchValue = (String )request.getAttribute("searchValue");

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
	<section class="blog spad" style="padding-top: 250px";>
		<div class="container">
			<div class="blog__item-container">
				<div class="col-lg-4 col-md-5">
					<div class="country_package">'<%=searchResult%>' 검색결과 
					</div>
					<div class="blog__sidebar">
						<div class="blog__sidebar__item">
							<h4>어떤 여행을 찾고 있나요</h4>
							
						</div>
					</div>
				</div>
				<!-- 여기서 부터  -->
				<div class="col-lg-8 col-md-7">
					<%if(!searchResult.isEmpty()){ %>
					<%for(ProductDto p : searchResult){ %>
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="blog__item" id="best">
							<div class="blog__item__pic">
								<img
									src="<%=request.getContextPath() %>/upload/product/<%=p.getAttachment().get(0).getOrginalFilename() %>"
									alt="패키지 대표 이미지">
							</div>
							<div class="blog__item__text">
								<h5>
									<a href="<%=request.getContextPath()%>/product/productview.do"><%=p.getProductName() %>
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
										<p><%=p.getEditorNote() %></p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<%}
					}else{ %>
					<div style="width:1106px">
						<p style="text-align: center; padding:100px;">상품 준비중입니다:-)</p>
					</div>
					<%} %>
					<div class="button-container">
						<button type="button" class="btn btn-secondary btn-lg btn-block"
							width="1160px"
							onclick="location.replace('<%=request.getContextPath() %>/product/productmain.do')">다른
							지역 둘러보기</button>
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
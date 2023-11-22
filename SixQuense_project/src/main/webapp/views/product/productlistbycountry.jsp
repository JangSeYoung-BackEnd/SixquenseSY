<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.web.product.dto.ProductDto,com.web.product.dto.ProductCoordinateDto, java.util.List"%>
<%@ include file="/views/common/header.jsp"%>
<%
	List<ProductDto> products = (List<ProductDto>)request.getAttribute("products");
	int coordinateNo = (int)request.getAttribute("coordinateNo");
	ProductCoordinateDto coordinate = (ProductCoordinateDto)request.getAttribute("coordinate");
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
					<div class="country_package" style="width:500px"><%=coordinate.getNation()%>
						패키지
					</div>
					<div class="blog__sidebar">
						<div class="blog__sidebar__item">
							<h4>어떤 여행을 찾고 있나요</h4>
							<div class="blog__sidebar__item__tags">
								<a
									href="<%=request.getContextPath() %>/product/productlist.do?coordinateNo=<%=coordinateNo %>"
									class="tag">조회순</a> <a
									href="<%=request.getContextPath() %>/product/productlistlatest.do?coordinateNo=<%=coordinateNo %>"
									class="tag">최신순</a> <a
									href="<%=request.getContextPath() %>/product/productlistspecial.do?coordinateNo=<%=coordinateNo %>"
									class="tag">특가순</a>
							</div>
						</div>
					</div>
				</div>
				<!-- 여기서 부터  -->
				<div class="col-lg-8 col-md-7">
					<%if(!products.isEmpty()){ %>
					<%for(ProductDto p : products){ %>
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="blog__item" id="best">
							<div class="blog__item__pic">
								<img
	                        src="<%=request.getContextPath() %>/upload/product/<%= (p.getAttachment().get(0).getOrginalFilename() != null) ? p.getAttachment().get(0).getOrginalFilename() : "" %>"  
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
								<div class="edit_note" style="height:180px">
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
	/* document.querySelectorAll('.blog__sidebar__item__tags a').forEach(
			function(tag) {
				tag.addEventListener('click', function(event) {
					event.preventDefault(); */ // 기본 동작 방지 (예: 링크 이동)

					/*             // 선택된 태그에 'selected' 클래스 추가, 다른 태그에서는 제거
					 document.querySelectorAll('.blog__sidebar__item__tags a').forEach(function(otherTag) {
					 otherTag.classList.remove('selected');
					 });

					 // 클릭한 태그에 'selected' 클래스 추가
					 tag.classList.add('selected');

					 // 기존에 변경된 색상을 초기화
					 document.querySelectorAll('.blog__sidebar__item__tags a').forEach(function(otherTag) {
					 otherTag.style.color = 'f5f5f5'; // 기본 색상으로 초기화
					 });

					 // 선택된 태그의 색상을 변경
					 tag.style.color = '#7fad39'; // 변경할 색상 값으로 대체 */

					// 링크 클릭 시 페이지 이동
					/* location.assign(tag.getAttribute('href'));
				});
			}); */


<!--   function scrollToSection(sectionId) {
	    var element = document.getElementById(sectionId);
	    // 해당 섹션의 위치를 가져와서 스크롤
	    if (element) {
	        var rect = element.getBoundingClientRect();
	        console.log(rect);
	        var scrollTop = window.pageYOffset || document.documentElement.scrollTop;
	        console.log(scrollTop);
	        var targetY = rect.top + scrollTop -250;

	        window.scrollTo({
	            top: targetY,
	            behavior: 'smooth'
	        });
	    }
	} 
 
 
	 ajax 시도  -->
<%-- $("#bestP").click(e=>{
		const member={
				userId:"bsyoo",
				password:"bslove",
				userName:"유병승",
				gender:"M",
				age:19,
				email:"teacherdev09@gmail.com",
				addrss:"경기도 시흥시",
				hobby:["운동, 독서"]	
		};
		$.post("<%=request.getContextPath()%>/ajax/insertMember.do",
			{data:JSON.stringify(member)}, /* 객체 표현식으로 바꿔서 보낸다 */
			data=>{
				console.log(data); 
			}
		
		)
		
	})



		function searchName(){
		$.post("<%=request.getContextPath()%>/ajax/searchName.do",
				{"type":"userName","key":$("#key").val()},
				data=>{
					$("#members").html(makeMemberTable(data));
				});
	}

	$("#bestP").click(e=>{
		$.get("<%=request.getContextPath()%>/product/memberAll.do",
				data=>{
					$("#members").html(makeMemberTable(data));
				}
			);
	} --%>
</script>

<%@ include file="/views/common/footer.jsp"%>
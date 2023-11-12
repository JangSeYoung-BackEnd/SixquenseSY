<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style_je.css" type="text/css">
<style>
.heart-icon {
	cursor: pointer;
	display: inline-block;
	font-size: 14px;
	text-transform: uppercase;
	font-weight: 700;
	letter-spacing: 2px;
	width: 290px;
	text-align: center;
	padding: 15px 28px 10px; !important;
}

.icon_heart_alt::before {
	content: '\2661'; /* 빈 하트 아이콘 */
}

.filled::before {
	content: '\2665'; /* 채워진 하트 아이콘 */
	color: red; /* 원하는 색상으로 설정 */
}

.btn-group-lg>.btn, .btn-lg {
	font-size: 14px; !important;
	margin: 20px 0px; !important;
	padding: 10px 16px; !important;
}
</style>
<!-- Product Details Section Begin -->
<section class="product-details spad" style="padding-top: 250px";>
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-6">
				<div class="product__details__pic">
					<div class="product__details__pic__item">
						<img class="product__details__pic__item--large"
							src="img/product/details/product-details-1.jpg" alt="">
					</div>
					<div class="product__details__pic__slider owl-carousel">
						<img data-imgbigurl="img/product/details/product-details-2.jpg"
							src="img/product/details/thumb-1.jpg" alt=""> <img
							data-imgbigurl="img/product/details/product-details-3.jpg"
							src="img/product/details/thumb-2.jpg" alt=""> <img
							data-imgbigurl="img/product/details/product-details-5.jpg"
							src="img/product/details/thumb-3.jpg" alt=""> <img
							data-imgbigurl="img/product/details/product-details-4.jpg"
							src="img/product/details/thumb-4.jpg" alt="">
					</div>
				</div>
			</div>

			<!-- 여기부터 -->
			<div class="col-lg-6 col-md-6">
				<div class="product__details__text">
					<h3>패키지 이름</h3>
					<div class="product__details__rating">
						<span>(리뷰 갯수 reviews)</span>
					</div>
					<div class="product__details__price">199,000원</div>
					<p style="text-align: left">상품 소개글을 쓰겠습니다~~~ Mauris blandit
						aliquet elit, eget tincidunt nibh pulvinar a. Vestibulum ac diam
						sit amet quam vehicula elementum sed sit amet dui. Sed porttitor
						lectus nibh. Vestibulum ac diam sit amet quam vehicula elementum
						sed sit amet dui. Proin eget tortor risus.</p>
					<div class="product__details__quantity">
						<div class="date-container">
							<input type="date" id="travel_date" name="travel_date">
						</div>
						<div class="quantity">
							<div class="pro-qty">
								<input type="text" value="1">
							</div>
						</div>
					</div>

					<div class="button-container">
						<a href="#" class="primary-btn">예약하기</a> <a href="#"
							class="heart-icon" onclick="toggleHeartIcon(this)"><span
							class="icon_heart_alt"></span> 위시리스트에 담기</a>
					</div>
					<div style="width: 290px; height: 51px; text-align: center;">
						<b style="color: darkgrey; font-size: 13px;"><span
							style="color: red">몇명</span>이 이 상품을 위시리스트에 담았습니다</b>
					</div>
					<script>
						function toggleHeartIcon(element) {
							// 버튼을 클릭할 때마다 'filled' 클래스를 추가 또는 제거
							element.querySelector('.icon_heart_alt').classList
									.toggle('filled');
						}
					</script>

					<ul>
						<li><img
							src="<%=request.getContextPath()%>/img/grouptouricon.png"
							width="20px" height="20px" style="margin-right: 10px"> <b>그룹투어</b>
						</li>
						<li><img
							src="<%=request.getContextPath()%>/img/checkicon2.png"
							width="20px" height="20px" style="margin-right: 10px"> <b>최소인원</b>
							<span>최소인원적기</span></li>
						<li><img
							src="<%=request.getContextPath()%>/img/checkicon2.png"
							width="20px" height="20px" style="margin-right: 10px"> <b>최대인원</b>
							<span>최대인원적기</span></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-12">
				<div class="product__details__tab">
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true">상품
								정보</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#tabs-2" role="tab" aria-selected="false">이용 안내</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#tabs-3" role="tab" aria-selected="false">후기 <span>(후기갯수)</span></a>
						</li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="tabs-1" role="tabpanel">
							<div class="product__details__tab__desc">
								<h6>상품 정보</h6>
								<p style="text-align: left">Vestibulum ac diam sit amet quam
									vehicula elementum sed sit amet dui. Pellentesque in ipsum id
									orci porta dapibus. Proin eget tortor risus. Vivamus suscipit
									tortor eget felis porttitor volutpat. Vestibulum ac diam sit
									amet quam vehicula elementum sed sit amet dui. Donec rutrum
									congue leo eget malesuada. Vivamus suscipit tortor eget felis
									porttitor volutpat. Curabitur arcu erat, accumsan id imperdiet
									et, porttitor at sem. Praesent sapien massa, convallis a
									pellentesque nec, egestas non nisi. Vestibulum ac diam sit amet
									quam vehicula elementum sed sit amet dui. Vestibulum ante ipsum
									primis in faucibus orci luctus et ultrices posuere cubilia
									Curae; Donec velit neque, auctor sit amet aliquam vel,
									ullamcorper sit amet ligula. Proin eget tortor risus.</p>
								<p style="text-align: left">Praesent sapien massa, convallis
									a pellentesque nec, egestas non nisi. Lorem ipsum dolor sit
									amet, consectetur adipiscing elit. Mauris blandit aliquet elit,
									eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna
									dictum porta. Cras ultricies ligula sed magna dictum porta. Sed
									porttitor lectus nibh. Mauris blandit aliquet elit, eget
									tincidunt nibh pulvinar a. Vestibulum ac diam sit amet quam
									vehicula elementum sed sit amet dui. Sed porttitor lectus nibh.
									Vestibulum ac diam sit amet quam vehicula elementum sed sit
									amet dui. Proin eget tortor risus.</p>
							</div>
							<div class="product__details__tab__desc">
								<h6>코스 소개</h6>
								<p style="text-align: left">Vestibulum ac diam sit amet quam
									vehicula elementum sed sit amet dui. Pellentesque in ipsum id
									orci porta dapibus. Proin eget tortor risus. Vivamus suscipit
									tortor eget felis porttitor volutpat. Vestibulum ac diam sit
									amet quam vehicula elementum sed sit amet dui. Donec rutrum
									congue leo eget malesuada. Vivamus suscipit tortor eget felis
									porttitor volutpat. Curabitur arcu erat, accumsan id imperdiet
									et, porttitor at sem. Praesent sapien massa, convallis a
									pellentesque nec, egestas non nisi. Vestibulum ac diam sit amet
									quam vehicula elementum sed sit amet dui. Vestibulum ante ipsum
									primis in faucibus orci luctus et ultrices posuere cubilia
									Curae; Donec velit neque, auctor sit amet aliquam vel,
									ullamcorper sit amet ligula. Proin eget tortor risus.</p>
								<p style="text-align: left">Praesent sapien massa, convallis
									a pellentesque nec, egestas non nisi. Lorem ipsum dolor sit
									amet, consectetur adipiscing elit. Mauris blandit aliquet elit,
									eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna
									dictum porta. Cras ultricies ligula sed magna dictum porta. Sed
									porttitor lectus nibh. Mauris blandit aliquet elit, eget
									tincidunt nibh pulvinar a. Vestibulum ac diam sit amet quam
									vehicula elementum sed sit amet dui. Sed porttitor lectus nibh.
									Vestibulum ac diam sit amet quam vehicula elementum sed sit
									amet dui. Proin eget tortor risus.</p>
							</div>
						</div>
						<div class="tab-pane" id="tabs-2" role="tabpanel">
							<div class="product__details__tab__desc">
								<h6>이용 안내</h6>
								<p style="text-align: left">Vestibulum ac diam sit amet quam
									vehicula elementum sed sit amet dui. Pellentesque in ipsum id
									orci porta dapibus. Proin eget tortor risus. Vivamus suscipit
									tortor eget felis porttitor volutpat. Vestibulum ac diam sit
									amet quam vehicula elementum sed sit amet dui. Donec rutrum
									congue leo eget malesuada. Vivamus suscipit tortor eget felis
									porttitor volutpat. Curabitur arcu erat, accumsan id imperdiet
									et, porttitor at sem. Praesent sapien massa, convallis a
									pellentesque nec, egestas non nisi. Vestibulum ac diam sit amet
									quam vehicula elementum sed sit amet dui. Vestibulum ante ipsum
									primis in faucibus orci luctus et ultrices posuere cubilia
									Curae; Donec velit neque, auctor sit amet aliquam vel,
									ullamcorper sit amet ligula. Proin eget tortor risus.</p>
								<p style="text-align: left">Praesent sapien massa, convallis
									a pellentesque nec, egestas non nisi. Lorem ipsum dolor sit
									amet, consectetur adipiscing elit. Mauris blandit aliquet elit,
									eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna
									dictum porta. Cras ultricies ligula sed magna dictum porta. Sed
									porttitor lectus nibh. Mauris blandit aliquet elit, eget
									tincidunt nibh pulvinar a.</p>
							</div>
							<div class="product__details__tab__desc">
								<h6>환불 안내</h6>
								<p style="text-align: left">Vestibulum ac diam sit amet quam
									vehicula elementum sed sit amet dui. Pellentesque in ipsum id
									orci porta dapibus. Proin eget tortor risus. Vivamus suscipit
									tortor eget felis porttitor volutpat. Vestibulum ac diam sit
									amet quam vehicula elementum sed sit amet dui. Donec rutrum
									congue leo eget malesuada. Vivamus suscipit tortor eget felis
									porttitor volutpat. Curabitur arcu erat, accumsan id imperdiet
									et, porttitor at sem. Praesent sapien massa, convallis a
									pellentesque nec, egestas non nisi. Vestibulum ac diam sit amet
									quam vehicula elementum sed sit amet dui. Vestibulum ante ipsum
									primis in faucibus orci luctus et ultrices posuere cubilia
									Curae; Donec velit neque, auctor sit amet aliquam vel,
									ullamcorper sit amet ligula. Proin eget tortor risus.</p>
								<p style="text-align: left">Praesent sapien massa, convallis
									a pellentesque nec, egestas non nisi. Lorem ipsum dolor sit
									amet, consectetur adipiscing elit. Mauris blandit aliquet elit,
									eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna
									dictum porta. Cras ultricies ligula sed magna dictum porta. Sed
									porttitor lectus nibh. Mauris blandit aliquet elit, eget
									tincidunt nibh pulvinar a.</p>
							</div>
						</div>
						<div class="tab-pane" id="tabs-3" role="tabpanel">
							<div class="product__details__tab__desc">
								<!-- 리뷰 입력 창 : 상품이 구매되면 볼 수 있도록 해야됨 -->
								<h6>후기 작성</h6>
								<div class="comment-editor">
									<form action="" method="post">
										<input type="hidden" name="boardRef" value="">
										<!-- 서블릿이 필요한 정보 hidden으로 보내주기 -->
										<input type="hidden" name="level" value="1"> <input
											type="hidden" name="writer" value=""> <input
											type="hidden" name="boardCommentRef" value="0">
										<div id="comment-editor-container" style="display: flex;">
											<textarea class="form-control" placeholder="리뷰를 등록해주세요"
												id="floatingTextarea2" style="height: 100px; resize: none"></textarea>
											<button type="button" class="btn btn-success"
												style="margin-left: 10px">댓글 등록</button>
										</div>
										<div id="comment-editor-button"
											style="margin-top: 10px; background-color: #f2f2f2"
											height=80px;>
											<button type="button" class="btn btn-secondary btn-sm">사진
												등록</button>
											<!-- 사진 있을때 파일명 보여줌 -->
											<%-- <%if(b.getReFname()!=null){ %>
														<img src="<%=request.getContextPath() %>/images/file.png" width="25">
														<sub><%=b.getReFname() %></sub>
													<%} %> --%>
										</div>
									</form>
								</div>
								<h6 style="margin-top: 26px;">여행자 후기(후기 갯수)</h6>
								<!-- 리뷰 리스트 보여줄 리스트 : 로그인 없이 볼 수 있도록 -->
								<%-- <%if(!comments.isEmpty()){ %> --%>
								<div id="comment-container">
									<table id="tbl-comment">
										<%-- <%for(BoardComment bc:comments){ %> --%>
										<%-- <%if(bc.getLevel()==1) {%> --%>
										<tr class="level1">
											<td><sub class="comment-writer">회원명</sub> <sub
												class="comment-date">등록일<br> 리뷰내용</td>
											<td>
												<!-- 클래스 명에 이벤트 걸면 다수에 걸 수 있다 (자바스크립트), onlclick시 함수 사용--> <!-- 이벤트 함수 실행할때 코멘트 번호 id,value로 가져오기 -->
												<button class="btn-reply" value="">답글</button>
												<button class="btn-delete">삭제</button>
											</td>
										</tr>
										<%-- 	<%}else{ %> --%>
										<tr class="level2">
											<td><sub class="comment-writer">회원명</sub> <sub
												class="comment-date"></sub>등록일<br> 대댓글내용</td>
											<td>
										</tr>
										<%-- 		<%} %> --%>
										<%-- <%} %> --%>
										<!-- }else{ %> -->
										<tr>
											<td width=1140px; height=100px; style="text-align: center;">작성된
												여행 후기가 없습니다</td>
										</tr>
										<%-- <%} %> --%>
									</table>
								</div>
								<br>
							</div>
						</div>
					</div>
					<div class="button-container">
						<button type="button" class="btn btn-secondary btn-lg btn-block">다른
							지역 둘러보기</button>
					</div>
				</div>
			</div>
		</div>
</section>

<%-- <script>
	$('#download-container').click(e=>{
		location.assign("<%=request.getContextPath()%>/boardfiledownload.do?fname=<%=b.getReFname()%>");
	})
	
	$(".comment-editor>form>textarea[name=content]").focus(e=>{
		if(<%=loginMember==null%>){
			alert("로그인 후 이용할 수 있는 서비스 입니다");
			$("#userId").focus();
		}
	})
	
	$(".btn-reply").click(e=>{
		const $tr=$("<tr>");
		const $td=$("<td>").attr("colspan","2");
		const $form=$(".comment-editor>form").clone();
		/* find함수 자손들 중에서 속성 찾을 수 있다 -> 속성에 있는 값 바꾸고 속성 지워주고 속성 추가해주고 다 가능*/
		$form.find("input[name=level]").val("2");
		$form.find("textarea").attr("rows","1");
		$form.find("button").removeAttr("id").addClass("btn-insert2");
		$form.find("input[name=boardCommentRef]").val($(e.target).val());
		$td.append($form);
		$tr.append($td);
		
		$(e.target).parents("tr").after($tr);
		
		/* tr과 td를 생성 -> 댓글의 form 태그 클론복사 -> td에 form 붙이고 tr에 td붙인다 -> 이벤트 발생한 객체(버튼) 부모는 전체 tr 그 아래 생성한 tr 붙이기*/
		
		/* alert('클릭'); */
		/* 이벤트가 발생한 객체 e.target 브라우저가 알아서 찾아낸다 , 해당 엘리먼트 가져올 수 있다 */
		/* 이벤트가 발생한 타겟(버튼)의 다음 라인을 찾아서 아래 폼태그 넣기
		console.log(e.target); */
			
		/* 버튼을 포함하고 있는 tr 뒤에 tr 생성 td 붙이기, $("<tr>") createelement태그  *//* console.log($(e.target).parents("tr"));
		$(e.target).parents("tr")).after($("<tr>").append($("<tr>").text("테스트"))); */
			
		
	})
</script> --%>
<%@ include file="/views/common/footer.jsp"%>
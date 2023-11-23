<%@page import="com.web.product.dto.ProductsreviewDto"%>
<%@page import="com.web.product.dto.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.web.product.dto.*, java.util.List, java.util.Arrays"%>
<%@ include file="/views/common/header.jsp"%>
<%
ProductDto product = (ProductDto) request.getAttribute("product");

List<ProductsreviewDto> comments = (List<ProductsreviewDto>) request.getAttribute("comments");
List<ProductcourseDto> course = (List<ProductcourseDto>) request.getAttribute("course");
List<ProductorderinfoDto> orderInfo = (List<ProductorderinfoDto>) request.getAttribute("orderInfo");

int commentCount = (int) request.getAttribute("commentCount");
int wishlistCount = (int) request.getAttribute("wishlistCount");
%>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style_je.css" type="text/css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
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
	padding: 15px 28px 10px;
}

.icon_heart_alt::before {
	content: '\2661'; /* 빈 하트 아이콘 */
}

.filled::before {
	content: '\2665'; /* 채워진 하트 아이콘 */
	color: red; /* 원하는 색상으로 설정 */
}

.btn-group-lg>.btn, .btn-lg {
	font-size: 14px; ! important;
	margin: 20px 0px; ! important;
	padding: 10px 16px; ! important; table { width : 580px;
	margin: 0 auto;
	border-collapse: collapse;
	clear: both;
}

table.container mt-3 tr td {
	border-bottom: 1px solid;
	border-top: 1px solid;
	padding: 5px;
	text-align: left;
	line-height: 120%;
}

table.container mt-3 tr td:first-of-type {
	padding: 5px 5px 5px 50px;
}

table.container mt-3 tr td:last-of-type {
	text-align: right;
	width: 100px;
}

table.container mt-3 button.btn-reply {
	display: none;
}

table.container mt-3 button.btn-delete {
	display: none;
}

table.container mt-3 tr:hover {
	background: lightgray;
}

table.container mt-3 tr:hover button.btn-reply {
	display: inline;
}

table.container mt-3 tr:hover button.btn-delete {
	display: inline;
}

table.container mt-3 tr.level2 {
	color: gray;
	font-size: 14px;
}

table.container mt-3 sub.comment-writer {
	color: navy;
	font-size: 14px
}

table.container mt-3 sub.comment-date {
	color: tomato;
	font-size: 10px
}

table.container mt-3 tr.level2 td:first-of-type {
	padding-left: 100px;
}

table.container mt-3 tr.level2 sub.comment-writer {
	color: #8e8eff;
	font-size: 14px
}

table.container mt-3 tr.level2 sub.comment-date {
	color: #ff9c8a;
	font-size: 10px
}
/*답글관련*/
table.container mt-3 textarea {
	margin: 4px 0 0 0;
	!
	important;
}

td.level2td {
	margin-left: 20px;
	!
	inportant
}
</style>
<!-- Product Details Section Begin -->
<section class="product-details spad" style="padding-top: 250px">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-6">
				<div class="product__details__pic">
					<div class="product__details__pic__item">
						<img class="product__details__pic__item--large"
							src="<%=request.getContextPath()%>/upload/product/<%=(product.getAttachment().get(0).getOrginalFilename() != null)
		? product.getAttachment().get(0).getOrginalFilename()
		: ""%>"
							alt="">
					</div>
					<div class="product__details__pic__slider owl-carousel">
						<img
							data-imgbigurl="<%=request.getContextPath()%>/upload/product/<%=(product.getAttachment().get(1).getOrginalFilename() != null)
		? product.getAttachment().get(1).getOrginalFilename()
		: ""%>"
							src="<%=request.getContextPath()%>/upload/product/<%=(product.getAttachment().get(1).getOrginalFilename() != null)
		? product.getAttachment().get(1).getOrginalFilename()
		: ""%>"
							alt=""> <img
							data-imgbigurl="<%=request.getContextPath()%>/upload/product/<%=(product.getAttachment().get(2).getOrginalFilename() != null)
		? product.getAttachment().get(2).getOrginalFilename()
		: ""%>"
							src="<%=request.getContextPath()%>/upload/product/<%=(product.getAttachment().get(2).getOrginalFilename() != null)
		? product.getAttachment().get(2).getOrginalFilename()
		: ""%>"
							alt=""> <img
							data-imgbigurl="<%=request.getContextPath()%>/upload/product/<%=(product.getAttachment().get(3).getOrginalFilename() != null)
		? product.getAttachment().get(3).getOrginalFilename()
		: ""%>"
							src="<%=request.getContextPath()%>/upload/product/<%=(product.getAttachment().get(3).getOrginalFilename() != null)
		? product.getAttachment().get(3).getOrginalFilename()
		: ""%>"
							alt=""> <img
							data-imgbigurl="<%=request.getContextPath()%>/upload/product/<%=(product.getAttachment().get(4).getOrginalFilename() != null)
		? product.getAttachment().get(4).getOrginalFilename()
		: ""%>"
							src="<%=request.getContextPath()%>/upload/product/<%=(product.getAttachment().get(4).getOrginalFilename() != null)
		? product.getAttachment().get(4).getOrginalFilename()
		: ""%>"
							alt="">
					</div>
				</div>
			</div>
			<!-- 여기부터 -->
			<div class="col-lg-6 col-md-6">
				<div class="product__details__text">
					<h3><%=product.getProductName()%></h3>
					<div class="product__details__rating">
						<span><%=commentCount%> reviews</span>
					</div>
					<div class="product__details__price"><%=product.getProductPrice()%>원
					</div>
					<p style="text-align: left"><%=product.getEditorNote()%></p>
					<form action="<%=request.getContextPath()%>/product/makeorder.do"
						method="post" onsubmit="return checkDate()">
						<input type="hidden" name="productNo"
							value="<%=product.getProductNo()%>">
						<div class="product__details__quantity">
							<div class="date-container">
								<input type="text" id="datepicker" name="travel_date"
									placeholder="일자를 선택하세요">
							</div>
							<!-- 달력 구현 -->
							<script>
							$(document).ready(function(){               
							    $.datepicker.setDefaults({
							    closeText: "닫기",
							    currentText: "오늘",
							    prevText: '이전 달',
							    nextText: '다음 달',
							    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
							    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
							    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
							    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
							    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
							    weekHeader: "주",
							    yearSuffix: '년'
							    });    
							 });

						$(function() {
							var desiredDaysOfWeek = [
					            <%String[] productDays = product.getProductDay();
									for (int i = 0; i < productDays.length; i++) {
										if (i > 0) {
											out.print(", ");
										}
										out.print("'" + productDays[i] + "'");
									}%>
														        ];
																
							/* text -> 날짜로 변환 해주는 함수 */
						    $( "#datepicker" ).datepicker({
						    	minDate: 0,
								maxDate: "+3M",
								onSelect: function(dateText, inst) {
									var date = $.datepicker.formatDate("yy/mm/dd", $("#datepicker").datepicker("getDate"));
								},
								beforeShowDay: function(date) {
									// 현재 날짜의 요일 확인
									var dayOfWeek = date.toLocaleDateString("ko-KR", { weekday: "short" });
									console.log(dayOfWeek);
									
									// 특정 요일인지 확인하여 선택 가능 여부 반환
									return [desiredDaysOfWeek.includes(dayOfWeek)];     
								}
							});
						});
						</script>
							<select class="form-select" aria-label="Default select example"
								name="selectOption" id="selectOption"
								style="padding-right: 65px; padding-left: 65px">
								<option selected vaule="1">1</option>
								<%
								for (int i = 2; i <= product.getMaxCount(); i++) {
								%>
								<option value="<%=i%>"><%=i%></option>
								<%
								}
								%>
							</select>
						</div>
						<div class="button-container">
							<input type="submit" class="primary-btn" value="예약하기"> <a
								href="javascript:toggleHeartIcon(this)" class="heart-icon">
								<span
								class="icon_heart_alt <%=(boolean) request.getAttribute("wishResult") ? "filled" : ""%>"></span>위시리스트에
								담기
							</a>

						</div>
					</form>
					<!-- 로그인 & 데이트 넣어야만 예약버튼 되도록 -->
					<script>
						function checkDate() {
							var datepickerValue = document.getElementById("datepicker").value;
							var reserveLink = document
									.querySelector(".primary-btn");
							 if (<%=loginMember == null%>) {
 								alert("로그인 후 이용할 수 있는 서비스입니다"); 
 					            location.assign('<%=request.getContextPath()%>/loginpage.do');  	
 					           	return false;
						  } else {
							  if (!datepickerValue){
								  alert("날짜와 인원수를 입력해주세요"); 
								  return false;
								}else{
									return true;
								}
							} 
						}; 					
					</script>

					<div style="width: 290px; height: 51px; text-align: center;">
						<b style="color: darkgrey; font-size: 13px;"><span
							id="wishlist-count" style="color: red"><%=wishlistCount%></span>명이
							이 상품을 위시리스트에 담았습니다</b>
					</div>
					<script>
					 function toggleHeartIcon(e){
						  // Get the product and member information
				            var memberNo = <%=loginMember != null ? loginMember.getUserNo() : 0%>;
				            var productNo = <%=product.getProductNo()%>;
				            console.log(memberNo);
				            console.log(productNo);
				            
				            console.log('<%=loginMember%>');
						 if (<%=loginMember == null%>) {
					            alert("로그인 후 이용할 수 있는 서비스입니다");
						 } else {
							 if(<%=(boolean) request.getAttribute("wishResult")%> || $("a.heart-icon").find('.icon_heart_alt').hasClass('filled')){
					        $.ajax({
					            	url: "<%=request.getContextPath()%>/product/removewishlist.do",
					            	type:"get",
					                data: {memberNo: memberNo, productNo: productNo},
					                success: function (data) {
					                    console.log(data);
					                    
					                    // Toggle the heart icon by adding the 'filled' class
					                    $("a.heart-icon").find('.icon_heart_alt').removeClass('filled');
					                    
					                    var count = parseInt($('#wishlist-count').text());
					                    $('#wishlist-count').text(count - 1);
					                    
					                    alert("해당 상품이 위시리스트에서 삭제 되었습니다");
					                },
					                error: function (data) {
					                    console.error('Error adding to wishlist');
					                }
							 })
					            }else{
					            	// Make an AJAX request to add the product to the wishlist
						            $.ajax({
						            	url: "<%=request.getContextPath()%>/product/makewishlist.do",
						            	type:"get",
						                data: {memberNo: memberNo, productNo: productNo},
						                success: function (data) {
						                    console.log(data);
						                    
						                    // Toggle the heart icon by adding the 'filled' class
						                    $("a.heart-icon").find('.icon_heart_alt').addClass('filled');
						                    
						                    var count = parseInt($('#wishlist-count').text());
						                    $('#wishlist-count').text(count + 1);
						                    
						                    alert("해당 상품이 위시리스트에 담겼습니다");
						                },
						                error: function (data) {
						                    console.error('Error adding to wishlist');
					            }
					        })
					         
					    }
					}
								};
								
					</script>

					<ul>
						<li><img
							src="<%=request.getContextPath()%>/img/grouptouricon.png"
							width="20px" height="20px" style="margin-right: 10px"> <b>그룹투어</b>
						</li>
						<li><img
							src="<%=request.getContextPath()%>/img/checkicon2.png"
							width="20px" height="20px" style="margin-right: 10px"> <b>최소인원</b>
							<span><%=product.getMinCount()%></span></li>
						<li><img
							src="<%=request.getContextPath()%>/img/checkicon2.png"
							width="20px" height="20px" style="margin-right: 10px"> <b>최대인원</b>
							<span><%=product.getMaxCount()%></span></li>
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
							href="#tabs-3" role="tab" aria-selected="false">후기 <span>(<%=commentCount%>)
							</span></a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="tabs-1" role="tabpanel">
							<div class="product__details__tab__desc">
								<h6>상품 정보</h6>
								<p style="text-align: left"><%=product.getProductDetail()%></p>
							</div>
							<div class="product__details__tab__desc">
								<h6>코스 소개</h6>
								<%
								if (!course.isEmpty()) {
									for (ProductcourseDto pc : course) {
								%>
								<div style="background-color: #f8f9fa; width: 800px;">
									<div style="display: flex">
										<img class="offer-course__introduce__map"
											src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMCIgaGVpZ2h0PSIyMCIgdmlld0JveD0iMCAwIDIwIDIwIj4KICAgIDxwYXRoIGZpbGw9IiM0OTUwNTYiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTEwIDE4Yy00LTQuNDA5LTYtNy43MjYtNi05Ljk1M0M0IDQuNzA3IDYuNjg2IDIgMTAgMnM2IDIuNzA3IDYgNi4wNDdjMCAyLjIyNy0yIDUuNTQ0LTYgOS45NTN6bTAtNy43NWEyLjI1IDIuMjUgMCAxIDAgMC00LjUgMi4yNSAyLjI1IDAgMCAwIDAgNC41eiIvPgo8L3N2Zz4K"
											alt="map-icon"> <b><%=pc.getCourseName()%></b>
									</div>
									<br>
									<p style="text-align: left">
										<%=pc.getCourseDetail()%></p>
								</div>
								<%
								}
								}
								%>
							</div>
						</div>
						<div class="tab-pane" id="tabs-2" role="tabpanel">
							<div class="product__details__tab__desc">
								<h6>이용 안내</h6>
								<p style="text-align: left">
									★ 만나는 시간까지, 늦지 않게 나와주시기 바랍니다. 대기 없이 정시 출발입니다. 원활한 투어 진행을 위해
									중간합류는 절대 불가합니다.<br> ★ 투어 전 가이드가 개별 연락을 드리지 않습니다. 많은 분들과
									함께하는 단체 투어로, 가이드의 개인 연락처는 전달해드리지 않는 점 양해부탁드립니다<br> ★ 최소 출발
									인원을 확인 부탁드립니다. 최소 출발 인원 미달 시 취소될 수 있습니다.<br> 해당 경우에는 투어일
									기준 최소 7일 전까지 날짜 변경 제안 또는 전액 환불을 진행합니다
								</p>
								<p style="text-align: left">
									★중요 안내★<br> 예약확정과 출발확정은 동일 개념이 아닙니다. 투어 출발은 최소인원 이상의 모객이
									이루어진 경우 진행됩니다.<br> 만나는 시간으로부터 최대 10분까지 대기가 가능합니다. (지각시 노쇼)<br>
									투어 출발 후 중간 합류 및 환불 불가합니다.<br> 별도의 바우처를 보내드리오지 않사오니 집결 시간 및
									장소를 다시 한번 확인부탁드립니다.
								</p>
							</div>
							<div class="product__details__tab__desc">
								<h6>취소 및 환불 안내</h6>
								<p style="text-align: left">
									<strong>▶여행자의 여행계약 해제 요청 시 여행약관에 의거하여 취소료가 부과됩니다◀</strong><br>
									제16조(여행출발 전 계약해제)<br> 여행개시 30일전까지( ～30) 통보 시 - 계약금 환급<br>
									여행개시 20일전까지(29～20) 통보 시 - 여행요금의 10% 배상<br> 여행개시
									10일전까지(19～10) 통보 시 - 여행요금의 15% 배상<br> 여행개시 8일전까지( 9～ 8) 통보
									시 - 여행요금의 20% 배상<br> 여행개시 1일전까지( 7～ 1) 통보 시 - 여행요금의 30% 배상<br>
									여행 당일 통보 시 - 여행요금의 50% 배상<br><br> <strong>▶여행 취소 접수
										안내◀</strong><br> 취소는 업무시간 내 접수 시 확인 및 적용이 가능합니다.<br> 취소수수료
									발생일은 영업일 기준으로 산정됩니다.(주말,공휴일 제외)<br> 업무시간 외 접수한 경우에는
									익일(영업일이 아닌 경우 다음 영업일)에 접수한 것으로 간주됩니다.<br> 업무시간은 월-금
									09:00~18:00 (주말,공휴일 제외)<br> (예: 토/일/월 출발 상품은 금요일 업무종료 이후
									취소시 당일 취소로 간주됩니다.><br>
								</p>
							</div>
						</div>
						<div class="tab-pane" id="tabs-3" role="tabpanel">
							<div class="product__details__tab__desc">
								<!-- 리뷰 입력 창 : 상품이 구매되면 볼 수 있도록 해야됨 -->
								<%
								for (ProductorderinfoDto order : orderInfo) {
									if (loginMember != null && orderInfo != null
									&& (loginMember.getUserId().equals("admin") || order.getMemberNO() == loginMember.getUserNo())) {
								%>
								<h6>후기 작성</h6>
								<!--  -->
								<div class="comment-editor">
									<form
										action="<%=request.getContextPath()%>/product/insertComment.do"
										method="post">
										<input type="hidden" name="productNo"
											value="<%=product.getProductNo()%>"> <input
											type="hidden" name="commentLevel" value="1"> <input
											type="hidden" name="userId"
											value="<%=loginMember != null ? loginMember.getUserId() : ""%>">
										<input type="hidden" name="member_no"
											value="<%=loginMember != null ? loginMember.getUserNo() : 0%>">
										<input type="hidden" name="CommentRef" value="0">
										<div id="comment-editor-container" style="display: flex">
											<textarea class="form-control" placeholder="리뷰를 등록해주세요"
												id="floatingTextarea2" name="content"
												style="height: 100px; resize: none"></textarea>
											<button type="submit" class="btn btn-success" id="btn-insert"
												style="margin-left: 10px; text-size: 5px">등록</button>
										</div>
										<!--  <div id="comment-editor-button" style="margin-top: 10px;"
											height=80px;>
											<input type="file" id="inputImage"
												accept="image/gif,image/jpeg,image/png" value="사진 첨부 파일">
										</div>  -->
									</form>
								</div>
								<%
								}
								break;
								}
								%>
								<h6 style="margin-top: 26px;">
									여행자 후기(<%=commentCount%>)
								</h6>
								<!-- 리뷰 리스트 보여줄 리스트 : 로그인 없이 볼 수 있도록 -->
								<div class="container mt-3">
									<%
									if (!comments.isEmpty()) {
									%>
									<table class="table">
										<tbody>
											<%
											if (comments != null) {
												for (ProductsreviewDto pr : comments) {
											%>
											<%
											if (pr.getCommentLevel() == 1) {
											%>
											<tr class="level1">
												<td width="490px"><sub class="comment-writer"><%=pr.getUserId()%></sub>
													<sub class="comment-date"><%=pr.getCommentDate()%></sub><br>
													<%=pr.getCommentContent()%></td>
												<td>
													<div style="display: flex" style="width: 174px;">
														<!-- 클래스 명에 이벤트 걸면 다수에 걸 수 있다 (자바스크립트), onlclick시 함수 사용-->
														<!-- 이벤트 함수 실행할때 코멘트 번호 id,value로 가져오기 -->
														<%
														if (loginMember != null && loginMember.getUserId().equals("admin")) {
														%>
														<button class="btn-reply" value="<%=pr.getCommentNo()%>">답글</button>
														<%
														}
														%>
														<%
														for (ProductsreviewDto cm : comments) {
														%>
														<%
														if (loginMember != null && (loginMember.getUserId().equals("admin") || cm.getMemberNo() == loginMember.getUserNo())) {
														%>
														<button class="btn-delete"
															onclick="fn_removecomment(<%=cm.getCommentNo()%>,<%=product.getProductNo()%>)">삭제</button>
														<%
														break;
														}
														%>
														<%
														}
														%>
													</div>
												</td>
											</tr>
											<%
											} else {
											%>
											<tr class="level2">
												<td class="level2td" style="padding-left: 40px"
													width="800px"><sub class="comment-writer"><%=pr.getUserId()%></sub>
													<sub class="comment-date"><%=pr.getCommentDate()%></sub><br>
													<%=pr.getCommentContent()%></td>
												<td>
													<div style="display: flex">
														<%
														for (ProductsreviewDto cm : comments) {
														%>
														<%
														if (loginMember != null && (loginMember.getUserId().equals("admin"))) {
														%>
														<button class="btn-delete"
															onclick="fn_removecomment(<%=cm.getCommentNo()%>,<%=product.getProductNo()%>);">삭제</button>
														<%
														break;
														}
														%>
														<%
														}
														%>
													</div>
												</td>
											</tr>
											<%
											}
											%>
											<%
											}
											}
											%>
										
									</table>
									<%
									} else {
									%>
									<table>
										<tr>
											<td width=1140px; height=100px; style="text-align: center;">작성된
												여행 후기가 없습니다</td>
										</tr>
									</table>
									<%
									}
									%>
									</tbody>
								</div>
								<br>
							</div>
						</div>
					</div>
					<div class="button-container" style="padding-top: 50px">
						<button type="button" class="btn btn-secondary btn-lg btn-block"
							onclick="location.replace('<%=request.getContextPath()%>/product/productmain.do')">다른
							지역 둘러보기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


<script>
	const fn_removecomment=(commentNo, productNo)=>{
		location.assign('<%=request.getContextPath()%>/product/removecomment.do?commentNo='+ commentNo + '&productNo=' + productNo);
	};
	
<%-- function deleteComment(e,commentNo) {
	const productNo = <%=product.getProductNo()%>;
	  const currentCount = <%=commentCount%>;
      const updatedCount = currentCount - 1;
      <%=commentCount%> = updatedCount;

    $.ajax({
        type: "post",
        data: { commentNo: commentNo, productNo: productNo },
        url: "<%=request.getContextPath()%>/product/removecomment.do",
        success: function (data) {
            console.log('코멘트가 삭제 되었습니다');

            $(e.target).closest('tr').remove();
            if (updatedCount === 0) {
                // 여행 후기가 없는 경우 메시지를 표시할 <tr> 요소 생성
                const noCommentRow = $('<tr>').append($('<td>').attr('colspan', '3').css('text-align', 'center').text('작성된 여행 후기가 없습니다'));

                // 테이블에 추가
                $('table').append(noCommentRow);
            }
            
           
            
        },
        error: function (data) {
            console.error('코멘트 삭제에 실패');
        }
    });
}; --%>


	
	$(".btn-reply").click(e=>{
		const $tr=$("<tr>");
		const $td=$("<td>").attr("colspan","2");
		const $form=$(".comment-editor>form").clone();
		/* find함수 자손들 중에서 속성 찾을 수 있다 -> 속성에 있는 값 바꾸고 속성 지워주고 속성 추가해주고 다 가능*/
		$form.find("input[name=commentLevel]").val("2");
		$form.find("textarea").attr("rows","1");
		$form.find("button").removeAttr("id").addClass("btn-insert2");
		$form.find("input[name=CommentRef]").val($(e.target).val());
		$td.append($form);
		$tr.append($td);
		
		$(e.target).parents("tr").after($tr);		
	});
</script>
<%@ include file="/views/common/footer.jsp"%>
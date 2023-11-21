<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="java.util.List, com.web.accompany.model.dto.AccompanyDTO" %>
<%
	List<AccompanyDTO> accompanys=(List<AccompanyDTO>)request.getAttribute("accompanys");
%>
<section class="checkout spad" style="padding-top: 0px";>
	<div class="container">
		<div class="checkout__form">
			<img src="<%=request.getContextPath() %>/img/icon/나의글.png" style="width: 165px; padding-left: 0px; margin-left: 294px; margin-bottom: 25px;">   
			<form action="#">
				<div class="row">
					<div class="col-lg-12 col-md-6 col-sm-6">
						<% if(!accompanys.isEmpty()){
	                    		for(AccompanyDTO a:accompanys){%>
			                        <div class="col-lg-4 col-md-6 col-sm-6 order-1" onclick="location.assign('<%=request.getContextPath()%>/accompany/accompanyview.do?no=<%=a.getAccompanyNo() %>&userNo=<%=loginMember.getUserNo()%>');">
			                            <div class="product__item">
			                                <div class="product__item__pic set-bg" data-setbg="<%=request.getContextPath()%>/upload/accompany/<%=a.getRenameFilename()%>" style="border-radius: 20%;">
			                                    <ul class="product__item__pic__hover">
			                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
			                                    </ul>
			                                </div>
			                                <div class="product__item__text accompany-tca">
				                                <div style="font-weight:bolder; font-size:18px">[<%=a.getAccompanyStatus().equals("acClose")?"모집마감":"모집중"%>]</div>
				                                <div style="font-weight:bolder; height:26px;"><%=a.getAccompanyTitle() %></div>
				                                <div style="height:50px;"><%=a.getAccompanyContent() %></div>
			                                </div>
			                            </div>
			                        </div>
		                        <%} %>
	                        <%} %>
						<div class="col-lg-4 col-md-6" style="padding-left: 170px; padding-right: 80px;">
							<div class="checkout__order" style="padding-left: 20px; width: 360px;">
								<div class="col-lg-3">
									<div class="hero__categories">
										<div class="hero__categories__all" style="width: 292px;">
											<i class="fa fa-bars"></i>
											<span>메뉴</span>
										</div> 
										<div id="Listlist"> 
											<ul style="width: 292px; height: 870px;">
												<li style="margin-bottom: 15px;"><a href="<%=request.getContextPath()%>/views/common/Mypage.jsp"><img src="<%=request.getContextPath() %>/img/icon/사용자아이디.png" style="width: 40px; margin-right: 10px;">사용자아이디</a></li>
												<li style="margin-bottom: 15px;"><a href="#"><img src="<%=request.getContextPath() %>/img/icon/수정.png" style="width: 40px; margin-right: 10px;">
												<button id="updateBtn">개인정보 수정</button></a></li>
												<li style="margin-bottom: 15px;"><a href="#"><img src="<%=request.getContextPath() %>/img/icon/결제상품.png" style="width: 50px; margin-right: 10px;">
												<button id="checkcancelBtn">결제상품 조회&취소</button></a></li>
												<li style="margin-bottom: 15px;"><a href="#"><img src="<%=request.getContextPath() %>/img/icon/위시리스트.png" style="width: 50px; margin-right: 10px;">
												<button id="wishBtn">위시리스트</button></a></li>
												<li style="margin-bottom: 15px;"><a href="#"><img src="<%=request.getContextPath() %>/img/icon/알림.png" style="width: 45px; margin-right: 10px;">
												<button id="alarmBtn">알림</button></a></li>
												<li style="margin-bottom: 15px;"><a href="#"><img src="<%=request.getContextPath() %>/img/icon/다녀온 여행.png" style="width: 40px; margin-right: 10px;">
												<button id="wenttripBtn">다녀온 여행</button></a></li>
												<li style="margin-bottom: 15px;"><a href="#"><img src="<%=request.getContextPath() %>/img/icon/나의글.png" style="width: 40px; margin-right: 10px;">
												<button id="mywirteBtn">나의 글</button></a></li>
												<li style="margin-bottom: 15px;"><a href="#"><img src="<%=request.getContextPath() %>/img/icon/문의사항.png" style="width: 50px; margin-right: 10px;">
												<button id="questionBtn">문의사항</button></a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>   	
			</form>
		</div>
	</div>
>>>>>>> branch 'test' of https://github.com/ImmortalDeveloper/Sixquense.git
</section>
<script>
   $("#updateBtn").click(e=>{
      e.preventDefault();
        var $button = $(this);
        $button.prop("disabled", true); 
      $.ajax({
         url:"<%=request.getContextPath()%>/updateview.do",
         dataType:"html",
         success:function(data){
               console.log(data);
               $("#htmlcontainer").html(data);
            },
            complete: function () {
                   $button.prop("disabled", false); // 요청 완료 후 버튼 활성화
               }
         });
      });      
      
   </script>
<script>
<<<<<<< HEAD
   $("#wishBtn").click(e=>{
      e.preventDefault();
        var $button = $(this);
        $button.prop("disabled", true);
      $.ajax({
         url:"<%=request.getContextPath()%>/Wish.do",
         dataType:"html",
         success:function(data){
               console.log(data);
               $("#htmlcontainer").html(data);
            },
         complete: function () {
                $button.prop("disabled", false); // 요청 완료 후 버튼 활성화
            }
         });
      });      
      
   </script>
   <script>
   $("#checkcancelBtn").click(e=>{
      e.preventDefault();
        var $button = $(this);
        $button.prop("disabled", true);
      $.ajax({
         url:"<%=request.getContextPath()%>/ProductList.do",
         dataType:"html",
         success:function(data){
               console.log(data);
               $("#htmlcontainer").html(data);
            },
         complete: function () {
                $button.prop("disabled", false); // 요청 완료 후 버튼 활성화
            }
      });
   });      
   </script>
   
    <script>
   <%-- $("#mywirteBtn").click(e=>{
      e.preventDefault();
        var $button = $(this);
        $button.prop("disabled", true);
      $.ajax({
         url:"<%=request.getContextPath()%>/mywrite.do",
         dataType:"html",
         success:function(data){
               console.log(data);
               $("#htmlcontainer").html(data);
            },
         complete: function () {
                $button.prop("disabled", false); // 요청 완료 후 버튼 활성화
            }
      });
   });    --%>   
   </script>
   <script>
   $("#questionBtn").click(e=>{
      e.preventDefault();
        var $button = $(this);
        $button.prop("disabled", true);
      $.ajax({
         url:"<%=request.getContextPath()%>/question.do",
         dataType:"html",
         success:function(data){
               console.log(data);
               $("#htmlcontainer").html(data);
            },
         complete: function () {
                $button.prop("disabled", false); // 요청 완료 후 버튼 활성화
            }
      });
   });      
   </script>
    <!-- Checkout Section End -->

	$("#wishBtn").click(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/Wish.do",
			dataType:"html",
			success:function(data){
					console.log(data);
					$("#htmlcontainer").html(data);
				}
			});
		});		
		
	</script>
	<script>
	$("#checkcancelBtn").click(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/ProductList.do",
			dataType:"html",
			success:function(data){
					console.log(data);
					$("#htmlcontainer").html(data);
				}
		});
	});		
	</script>
	 <script>
	$("#mywirteBtn").click(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/mywrite.do",
			dataType:"html",
			success:function(data){
					console.log(data);
					$("#htmlcontainer").html(data);
				}
		});
	});		
	</script>
	<script>
	$("#questionBtn").click(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/question.do",
			dataType:"html",
			success:function(data){
					console.log(data);
					$("#htmlcontainer").html(data);
				}
		});
	});		
	</script>
<%@ include file="/views/common/footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<%System.out.println(loginMember.getKruserName()); %>
<section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Checkout</h2> 
                        <div class="breadcrumb__option">
                            <a href="<%=request.getContextPath() %>/index.html">Home</a>
                            <span>Checkout</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</section>
<section class="checkout spad">
   <div id="htmlcontainer">
   
        <div class="container">
            <div class="checkout__form">
                <img src="<%=request.getContextPath() %>/img/icon/프로필사진.png"
                 style="width: 165px; padding-left: 0px; margin-left: 294px; margin-bottom: 25px;">
                <form action="#">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>이름</p>
                                        <input type="text" value="<%=loginMember.getKruserName()%>" readonly>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>성별</p>
                                    <input type="text" value="<%=loginMember.getGender()%>" readonly>
                                </div>
                            </div>
                            </div>
                            <div class="checkout__input">
                                <p>생년월일</p>
                                <input type="text" value="<%=loginMember.getUserDd()%>"readonly>
                            </div>
                            <div class="checkout__input">
                                <p>가입날짜</p>
                                <input type="text" value="<%=loginMember.getEnrollData()%>"readonly>
                            </div>
                            <div class="checkout__input">
                                <p>전화번호</p>
                                <input type="text" value="<%=loginMember.getPhone()%>"readonly>
                            </div>
                            <div class="checkout__input">
                                <p>자기소개</p>
                                <input type="text" style="width: 100%; height: 150px; padding-bottom: 100px;" value="<%=loginMember.getUserIntroduce()%>" id="intro">
                            </div>
                            <div class="checkout__input__checkbox">
                                <label for="acc">
                                    SNS/마케팅 수신동의
                                    <input type="checkbox" id="acc" checked readonly value="<%=loginMember.getNotificatIonset()%>"readonly>
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                        </div>
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
                                            <li style="margin-bottom: 15px;">

                                               <a href="<%=request.getContextPath()%>/views/common/Mypage.jsp">
                                                  <img src="<%=request.getContextPath() %>/img/icon/사용자아이디.png" style="width: 40px; margin-right: 10px;">사용자아이디
                                               </a>
                                            </li>                                     
                                            <li style="margin-bottom: 15px;">
                                            	<a href="#"><img src="<%=request.getContextPath() %>/img/icon/수정.png" style="width: 40px; margin-right: 10px;">
                                            		<button id="updateBtn">개인정보 수정</button>
                                            	</a>
                                            </li>
                                            <li style="margin-bottom: 15px;">
                                         	<a onclick="location.assign('<%=request.getContextPath()%>/ProductList.do?userNo=<%=loginMember.getUserNo()%>')">                                           	
                                            	<img src="<%=request.getContextPath() %>/img/icon/결제상품.png" style="width: 50px; margin-right: 10px;">
	                                            	<button id="checkcancelBtn">결제상품 조회</button>
	                                            </a>
                                            </li>
                                            <li style="margin-bottom: 15px;">
													<a onclick="location.assign('<%=request.getContextPath()%>/Wish.do?userNo=<%=loginMember.getUserNo()%>')">	                                            
	                                            <img src="<%=request.getContextPath() %>/img/icon/위시리스트.png" style="width: 50px; margin-right: 10px;">
	                                            	<button id="wishBtn">위시리스트</button>
	                                            </a>
                                            </li>
                                            <li style="margin-bottom: 15px;">
	                                            <a onclick="location.assign('<%=request.getContextPath()%>/mypage/mywrite.do?userNo=<%=loginMember.getUserNo()%>')">
		                                            <img src="<%=request.getContextPath() %>/img/icon/나의글.png" style="width: 40px; margin-right: 10px;">
		                                            <button id="mywirteBtn">나의 글</button>
	                                            </a>
                                            </li>
                                            <li style="margin-bottom: 15px;">
	                                            <a href="#"><img src="<%=request.getContextPath() %>/img/icon/문의사항.png" style="width: 50px; margin-right: 10px;">
	                                            	<button id="questionBtn">문의사항</button>
	                                            </a>
                                            </li>
                                        </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                       </div>
                     </div>      
                   </form>
                   </div>
               </div>
           </div>
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
<%--    $("#wishBtn").click(e=>{
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
      });    --%>   
      
   </script>
   <script>
  <%--  $("#checkcancelBtn").click(e=>{
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
   });       --%>
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
<%@ include file="/views/common/footer.jsp"%>
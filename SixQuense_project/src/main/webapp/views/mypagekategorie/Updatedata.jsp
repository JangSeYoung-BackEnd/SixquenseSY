<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.web.member.dto.Member" %>
<%
 Member loginMember = (Member)session.getAttribute("loginMember");
%>

 <section class="checkout spad" style="padding-top: 0px";>
        <div class="container">
            <div class="checkout__form">
                <img src="<%=request.getContextPath() %>/img/icon/수정.png" style="
                            width: 165px;
                            padding-left: 0px;
                            margin-left: 294px;
                            margin-bottom: 25px;">
                            <p style="width: 750px;"> 홍 길 동</p>
                <form action="#">
                    <div class="row">
                        <div class="col-lg-8 col-md-6" method="post">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>이름</p>
                                        <input type="text" value="<%=loginMember.getUserName()%>" id="name">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>성별</p>
                                    <input type="text" value="<%=loginMember.getGender()%>" id="gender">
                                </div>
                            </div>
                            </div>
                            <div class="checkout__input">
                                <p>비밀번호</p>
                                <input type="text" value="<%=loginMember.getUserPw()%>" id="pw">
                            </div>
                            <div class="checkout__input">
                                <p>비밀번호 확인</p>
                                <input type="text"  >
                            </div>
                            <div class="checkout__input">
                                <p>생년월일</p>
                                <input type="text"  value="<%=loginMember.getUserDd()%>">
                            </div>
                            <div class="checkout__input">
                                <p>가입날짜</p>
                                <input type="text" value="<%=loginMember.getEnrollData()%>">
                            </div>
                            <div class="checkout__input">
                                <p>전화번호</p>
                                <input type="text" value="<%=loginMember.getPhone()%>">
                            </div>
                            <div class="checkout__input">
                                <p>자기소개</p>
                                <input type="text" style="width: 100%; height: 150px; padding-bottom: 100px;" value="<%=loginMember.getUserIntroduce()%>">
                            </div>
                            <div class="checkout__input__checkbox">
                                <label for="acc">
                                    SNS/마케팅 수신동의
                                    <input type="checkbox" id="acc" value="<%=loginMember.getNotificatIonset()%>">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <form>
							    <input type="button" id="infoupdateBtn" value="정보수정" />
							</form>
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
                	</form>
                	</div>
            	</div>
</section>
<script>
    $("#infoupdateBtn").click(e => {	    
        $.ajax({
            url: "<%=request.getContextPath()%>/update.do?userNo=<%=loginMember.getUserNo()%>",
            type: "post",
            data: {
            	pw: $('#pw').val(),
            	name: $('#name').val()
            	},
            success: function(data, status, xhr) {
            	if (data != null) {
                    alert("성공!");
                } else {
                    alert("실패!");
                }
            },
            error: function(xhr, status, error) {
                console.error("에러:", error);
            }
        });
    });
</script>
<script>
	$("#updateBtn").click(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/updateview.do",
			dataType:"html",
			success:function(data){
					console.log(data);
					$("#htmlcontainer").html(data);
				}
			});
		});		
		
	</script>
<script>
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
	$("#wenttripBtn").click(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/Wenttrip.do",
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
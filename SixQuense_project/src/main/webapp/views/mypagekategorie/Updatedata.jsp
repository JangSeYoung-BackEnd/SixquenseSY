<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.web.member.dto.Member" %>
<%
 Member m = (Member)session.getAttribute("loginMember");
%>

 <section class="checkout spad" style="padding-top: 0px";>
        <div class="container">
            <div class="checkout__form">
                <img id="profileImage" src="<%=request.getContextPath() %>/img/icon/수정.png" style="
                            width: 165px;
                            padding-left: 0px;
                            margin-left: 294px;
                            margin-bottom: 25px;">                
                            <form action="#">
							
                    <div class="row">
                        <div class="col-lg-8 col-md-6" method="post">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>이름</p>
                                        <input type="text" value="<%=m.getUserName()%>" id="name">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>성별</p>
                                    <input type="text" value="<%=m.getGender()%>" id="gender">
                                </div>
                            </div>
                            </div>
                            <div class="checkout__input">
                                <p>새 비밀번호</p>
                                <input type="text"  id="pw">
                            </div>
                            <div class="checkout__input">
                                <p>비밀번호 확인</p>
                                <input type="text" id="confirmPassword">
                            </div>
                            <div class="checkout__input">
                                <p>생년월일</p>
                                <input type="text"  value="<%=m.getUserDd()%>" id="Dd">
                            </div>
                            <div class="checkout__input">
                                <p>가입날짜</p>
                                <input type="text" value="<%=m.getEnrollData()%>" id="enroll">
                            </div>
                            <div class="checkout__input">
                                <p>전화번호</p>
                                <input type="text" value="<%=m.getPhone()%>" id="phone">
                            </div>
                            <div class="checkout__input">
                                <p>자기소개</p>
                                <input type="text" style="width: 100%; height: 150px; padding-bottom: 100px;" value="<%=m.getUserIntroduce()%>" id="intro">
                            </div>
                            <div class="checkout__input__checkbox">
                                <label for="acc">
                                    SNS/마케팅 수신동의
                                    <input type="checkbox" id="acc" value="<%=m.getNotificatIonset()%>" checked>
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
                                            <button id="checkcancelBtn">결제상품 조회</button></a></li>
                                            <li style="margin-bottom: 15px;"><a href="#"><img src="<%=request.getContextPath() %>/img/icon/위시리스트.png" style="width: 50px; margin-right: 10px;">
                                            <button id="wishBtn">위시리스트</button></a></li>                                           
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
    var newPassword = $('#pw').val();
    var confirmPassword = $('#confirmPassword').val();

    if (newPassword === confirmPassword) {
        $.ajax({
            url: "<%=request.getContextPath()%>/update.do?userNo=<%=m.getUserNo()%>",
            type: "post",
            data: {
            	name: $('#name').val(),
                pw: newPassword, // 여기에서 새 비밀번호 사용
                gender: $('#gender').val(),
                Dd: $('#Dd').val(),
                enroll: $('#enroll').val(),
                phone: $('#phone').val(),
                intro: $('#intro').val(),
                acc: $('#acc').val()
            },
            success: function(data, status, xhr) {
                if (data != null && data.success) {
                    alert("업데이트되었습니다!");
                    // Checkout 섹션에 프로필 이미지 업데이트
                    $("#profileImage").attr("src", "<%=request.getContextPath()%>" + data.profileImagePath);
                } else {
                    alert("정보 업데이트에 실패했습니다!");
                }
            },
            error: function(xhr, status, error) {
                console.error("에러:", error);
            }
        });
    } else {
        alert("입력한 비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
    }
});

</script>
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

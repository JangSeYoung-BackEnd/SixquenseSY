<%@page import="com.web.accompany.model.dto.AccompanyComment"%>
<%@page import="java.util.List"%>
<%@page import="com.web.accompany.model.dto.AccompanyDTO"%>
<%@page import="com.web.accompany.model.dto.Continent"%>
<%@page import="com.web.accompany.model.dto.Coordinate"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>


<%
	AccompanyDTO b =(AccompanyDTO)request.getAttribute("board");
	double latitude= b.getCoordinate().getLatitude();
	double longitude = b.getCoordinate().getLongitude();
	List<AccompanyComment> comments= (List<AccompanyComment>) request.getAttribute("comments");
%>



<style>
div#googleMap img{
	border-radius:0;
}
#likeButtonContainer {
	text-align: center; /* 이 부분을 추가하여 내용을 가운데로 정렬합니다. */
}

.checkbox-group label {
	display: block;
	margin-bottom: 30px;
}

textarea {
	width: 100%;
	height: 30px;
	margin-bottom: 10px;
}

.popup {
	display: none;
	position: fixed;
	z-index: 9999;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.4);
	padding-top: 60px;
	cursor: pointer
}

.popup-content {
	background-color: #fefefe;
	margin: 5% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	max-width: 600px;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

button {
	padding: 10px 20px;
	font-size: 16px;
}

.gotoprofile {
	cursor: pointer;
}

.comments {
	max-height: 300px;
	overflow-y: auto;
	border: 1px solid #ddd;
	padding: 10px;
	margin-bottom: 10px;
}

.comment-form {
	display: flex;
	align-items: center;
}

#commentText {
	flex-grow: 1;
	padding: 5px;
	border-radius: 5px;
	border: 1px solid #ccc;
	margin-right: 10px;
}

button {
	padding: 5px 10px;
	background-color: #3ec219;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

button:hover {
	background-color: #07950cec;
	}
#commentText{
	width :640px
}
table#tbl-comment tr.level2 td:first-of-type {
	padding-left: 100px;
}

table#tbl-comment tr.level2 sub.comment-writer {
	color: #8e8eff;
	font-size: 14px
}

table#tbl-comment tr.level2 sub.comment-date {
	color: #ff9c8a;
	font-size: 10px
}
</style>

<script>
   function myMap(){
	   /* var board = ${request.getAttribute("board")};
	   console.log(latitude,longitude)
	      
	   	var coordinate = board.coordinate; */
		var latitude1 =  <%= latitude %>;
	    var longitude1 = <%= longitude %>;
	    console.log(latitude1,longitude1)
        var mapOptions = { 
	            center:new google.maps.LatLng(latitude1, longitude1),
	            zoom:5
	      };
	 
	      var map = new google.maps.Map( 
	             document.getElementById("googleMap") , mapOptions );
	      
   }
   
</script> 


<body>
	<!-- Blog Details Section Begin -->
	<section class="blog-details spad" style="padding-top:250px;">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-5 order-md-1 order-2">
					<div class="blog__sidebar" style="padding-top: 0px;">
					<%if(loginMember!=null){ %>
						<div class="col-lg-12 blog__details__author">
							<div class="row" style="margin-bottom:0px; border:solid gainsboro; width: 290px">
								<div class="blog__details__author__pic col-sm-2">
									<img src="<%=request.getContextPath()%>/img/blog/details/details-author.jpg" alt="" style="height: 60px; width: 50px; padding-top:10px; padding-bottom:0px">
								</div>
								<div class="blog__details__author__text col-sm-9" style="padding-top: 10px; padding-right: 0px; display: flex; align-items: center; padding-bottom:10px">
									<div class="cols">
										<div class="gotoprofile,item col-sm-8" id="openProfilePopup">
										<%=loginMember.getUserId() %>
										</div>
										<div class="item col-sm-4">
											<img id="followButton" src="<%=request.getContextPath()%>/img/accompany/팔로우(빈거).png" alt="팔로우 버튼"
											onclick="toggleImage()" width="20" height="20">
										</div>
									</div>
								</div>
							</div>
						</div>
						<%} %>
						<div class="row" >
							<div class="blog__sidebar__item">
								<%if(loginMember!=null){ %>
									<div class="col-sm-12">
										<button onclick="confirmAccompany()" style="margin:10px 0 10px 0; width: 290px;">동행신청하기</button>
								<%} %>
									<div class="blog__sidebar__recent col-sm-12" style="border:solid gainsboro;">
									<div style="margin: 5px 0px 5px 0px;">
										<h5>동행신청한 목록</h5>
									</div>
										<a href="#" class="blog__sidebar__recent__item">
											<div class="blog__sidebar__recent__item__pic">
												<img src="<%=request.getContextPath()%>img/blog/sidebar/sr-1.jpg" alt="">
											</div>
											<div class="blog__sidebar__recent__item__text">
												<h6>아이디</h6>
											</div>
										</a> <a href="#" class="blog__sidebar__recent__item">
											<div class="blog__sidebar__recent__item__pic">
												<img src="<%=request.getContextPath()%>img/blog/sidebar/sr-2.jpg" alt="">
											</div>
											<div class="blog__sidebar__recent__item__text">
												<h6>아이디</h6>
											</div>
										</a> <a href="#" class="blog__sidebar__recent__item">
											<div class="blog__sidebar__recent__item__pic">
												<img src="<%=request.getContextPath()%>img/blog/sidebar/sr-3.jpg" alt="">
											</div>
											<div class="blog__sidebar__recent__item__text">
												<h6>아이디</h6>
											</div>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-8 col-md-7 order-md-1 order-1">
					<div>
						<span style="font-size: larger; font-weight: bolder;"><%=b.getAccompanyTitle() %></span> <select name="accompany">
					<%-- 	<%=b.getBoardTitle()%>  --%>
					<!-- 분기 처리하기 만약에 ~  -->
							<option value="모집중">모집중</option>
							<option value="마감">마감</option>
						</select>
					</div>
					<div class="blog__details__text">
						<div style="display:flex;">
						<!-- 댓글처럼 따로 데이터를 불러서 사진 파일 들고오기  -->
							<img src="<%=request.getContextPath() %>/img/america/호주.png" alt="여행사진"  style="width:450px; height: 250px; border-radius:0%;">
							<div id="googleMap" style=" width: 250px; height: 250px;  border-radius:0% ;" > 지도 자리</div>
						</div>
					</div>
					<div>
						<p><%=b.getAccompanyContent() %></p>
					</div>
					<div style="display: flex;">
						<div><%=b.getAccompanyDate()%></div>
						<div>조회수 <%=b.getAccompanyReadCount()%></div>
					</div>
					<div class="comment-section">
						<h3>comment</h3>
						<br>
						<br>
							<div class="comments" id="comments"> 
							<%if(!comments.isEmpty()){ %>
								<table id="tbl-comment">
								<%for(AccompanyComment ac:comments){ 
									if (ac.getAccompanyComtLevel() == 1) {
								%>
									<tr class="level1">
										<td style="width:600px">
											<sub class="comment-writer"><%=ac.getUserId() %></sub>
											<sub class="comment-date"><%=ac.getAccompanyComtDate() %></sub>
											<br>
											<%=ac.getAccompanyComtContent() %>
										</td>
										<td>
											<button class="btn-reply" value="<%=ac.getAccompanyComtNo()%>">답글</button>
											<button class="btn-delete">삭제</button>
										</td>
									</tr>
									<%}else{ %>
									<tr class="level2">
										<td>
											<sub ><%=ac.getUserId() %></sub>
											<sub><%=ac.getAccompanyComtDate() %></sub>
											<br>
											<%=ac.getAccompanyComtContent() %>
										</td>
										<td>
										</td>
									</tr>
									<%} 
								}%>
								</table>
								<%}%>
							</div>
						
						<div class="comment-editor">
						<form action = "<%=request.getContextPath() %>/accompany/insertaccompanycomment.do" method="post">
							<input type="hidden" name="accompanyNo" value="<%=b.getAccompanyNo()%>">
							<input type="hidden" name="level" value="1">
							<input type="hidden" name="writer" value="<%=loginMember!=null? loginMember.getUserId():""%>">
							<input type="hidden" name="accompanyCommentRef" value="0">
							<input type="text" id="commentText" name="content1" placeholder="댓글을 입력하세요" style="width:600px">
							<button type="submit" id="btn-insert">댓글 추가</button>
						</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	    <script>
 	    $("#btn-insert").click(e=>{
	    	if(<%=loginMember==null%>){
	    		/* 로그인이 안됐을 때  */
	    		alert("로그인 후 이용할 수 있는 서비스입니다.");
	        }
	    }); 
	    $(".btn-reply").click(e=>{
	    	/* alert("클릭"); */
	    	/* $(e.target).parents("tr").after($("<tr>").append($("<td>테스트</td>"))) */
	    	const $tr=$("<tr>");
			const $td=$("<td>").attr("colspan","2");
			const $form=$(".comment-editor>form").clone(); //form태그 복사 
			console.log($form);
			$form.find("input[name=level]").val("2");
			$form.find("textarea").attr({"rows":"1","cols":"40"});
			$form.find("button").removeAttr("id").addClass("btn-insert2");  //버튼의 아이디 속성은 지우고 클래스를 btn-insert2로 해라 
			$form.find("input[name=accompanyCommentRef]").val($(e.target).val()); //댓글관한 번호가 들어감. 
			$td.append($form);
			$tr.append($td);
			$(e.target).parents("tr").after($tr);
	    })
	    </script>          
<!------------------------프로필 Popup 부분 ------------------------>

	<div id="profilePopup" class="popup">
		<div class="popup-content">
			<span class="close" id="closeProfilePopup">&times;</span>
			<h2>프로필 정보</h2>
			<div id="profileInfo">
				<!-- 프로필 정보를 추가하세요 -->
				<p>아이디 넣는 곳 John Doe</p>
				<p>여기는 소개글 적는 곳</p>
				<button id="reportButton" onclick="openReportPopup()">신고하기</button>
				<button id="blockButton">차단하기</button>
				<button id="followButton">팔로우하기</button>
			</div>
		</div>
	</div>
	
<!------------------------신고하기 Popup 부분 ------------------------>	

	<div id="reportPopup" class="popup">
		<div class="popup-content">
			<span class="close" onclick="closeReportPopup()">&times;</span>
			<h2>신고하기</h2>
			<p>신고 사유를 입력하세요:</p>
			<div class="checkbox-group">
				<label> <input type="radio" value="illegal_advertising" name = "report"> 무단광고/홍보 </label> 
				<label> <input type="radio" value="abuse" name = "report"> 욕설 </label> 
				<label> <input type="radio" value="offensive_language" name = "report"> 불쾌한 언어사용 및 컨테 </label> 
				<label> 
					<input type="radio" value="text" name = "report"> 기타
					<textarea id="reportReason" name = "report"></textarea>
				</label>
			</div>
			<div>
				
				<button onclick="submitReport();">제출</button>
			</div>
		</div>
	</div>
</body>

<!-- javaScript 부분   -->
	<script>
	/* 동행 신청 */
	function confirmAccompany() {
		var confirmed = confirm("동행을 신청하시겠습니까?");

		if (confirmed) {
			alert("동행이 신청되었습니다!");
		} else {
			alert("동행 신청이 취소되었습니다.");
		}
	}
	document.addEventListener('DOMContentLoaded', function() {
		var openButton = document.getElementById('openProfilePopup');
		var profilePopup = document.getElementById('profilePopup');
		var closeButton = document.getElementById('closeProfilePopup');

		openButton.addEventListener('click', function() {
			profilePopup.style.display = 'block';
		});
		closeButton.addEventListener('click', function() {
			profilePopup.style.display = 'none';
		});
	});
		
		var isFilled = false;
		function toggleImage() {
			var button = document.getElementById('followButton');
			if (isFilled) {
				button.src = "<%=request.getContextPath()%>/img/accompany/팔로우(빈거).png";
			} else {
				button.src = "<%=request.getContextPath()%>/img/accompany/팔로우.png";
			}
			isFilled = !isFilled; 
		}
/* 신고하기  부분  */
		function openReportPopup() {
			var reportPopup = document.getElementById('reportPopup');
			reportPopup.style.display = 'block';
		}
		function closeReportPopup() {
			var reportPopup = document.getElementById('reportPopup');
			reportPopup.style.display = 'none';
		}
	</script>
	<script>
	const radios = $("input[name=report]");

    function submitReport() {
        radios.click(e => {
            const val = radios.filter(":checked").val();

            if (val === "text") {
                const textval = $("#reportReason").val();
                location.href("<%=request.getContextPath()%>/report/report.do?report=" + val + "&text=" + textval);
            } else {
                location.href("<%=request.getContextPath()%>/report/report.do?report=" + val);
            }

            alert('신고되었습니다.');
        });
    }

    // Call the function when the document is ready
    $(document).ready(function () {
        submitReport();
    });
	</script>

<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDxoCNyxIo2ayez96wuzbEDnutsv4MquEs&callback=myMap"></script> 
 -->
 <%@ include file="/views/common/footer.jsp"%>
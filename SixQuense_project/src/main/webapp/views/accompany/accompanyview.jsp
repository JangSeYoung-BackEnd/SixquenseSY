<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>
<%
	/* 게시글 정보를 불러옴 +  댓글의 정보를 불러옴. */
	/* Board b = (Board) request.getAttribute("board");
	List<BoardComment> comments = (List<BoardComment>) request.getAttribute("comments"); */
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
	z-index: 1;
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
</style>

<script>
   function myMap(){
      var mapOptions = { 
            center:new google.maps.LatLng(51.508742, -0.120850),
            zoom:5
      };
 
      var map = new google.maps.Map( 
             document.getElementById("googleMap") 
            , mapOptions );
   }
</script> 


<body>
	<!-- Blog Details Section Begin -->
	<section class="blog-details spad" style="padding-top:250px;">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-5 order-md-1 order-2">
					<div class="blog__sidebar">
						<div class="col-lg-12 blog__details__author">
							<div class="row">
								<div class="blog__details__author__pic col-sm-4">
									<img src="<%=request.getContextPath()%>/img/blog/details/details-author.jpg" alt="">
								</div>
								<div class="blog__details__author__text col-sm-6">
									<div class="row">
										<div class="gotoprofile,item col-sm-5" id="openProfilePopup">Michael
											Scofield</div>
										<div class="item col-sm-4">
											<img id="followButton" src="<%=request.getContextPath()%>/img/팔로우(빈거).png" alt="팔로우 버튼"
												onclick="toggleImage()" width="30" height="30">
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="blog__sidebar__item">
							<form>
								<button onclick="confirmAccompany()">동행신청하기</button>
								<br>
								<br>
							</form>

							<div class="blog__sidebar__recent">
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
				<div class="col-lg-8 col-md-7 order-md-1 order-1">
					<div>
						<span style="font-size: larger; font-weight: bolder;">제목 </span> <select name="accompany">
					<%-- 	<%=b.getBoardTitle()%>  --%>
					<!-- 분기 처리하기 만약에 ~  -->
							<option value="모집중">모집중</option>
							<option value="마감">마감</option>
						</select>
					</div>
					<div class="blog__details__text">
						<div style="display:flex;">
							<img src="<%=request.getContextPath() %>/img/america/호주.png" alt="여행사진"  style="width:450px; height: 250px; border-radius:0%;">
							<div id="googleMap" style=" width: 250px; height: 250px;  border-radius:0% ;" > 지도 자리</div>
						</div>
					</div>
					<div>
						<p>내용 내용 내용 시애틀에서 동행 할 사람 궈함 ~ ~~~</p>
					</div>
					<div style="display: flex;">
						<div>글쓴날</div>
						<div>조회수</div>
					</div>
					<div class="comment-section">
						<h3>comment</h3>
						<br>
						<br>
						<div class="comments" id="comments"></div>
						<div class="comment-form">
							<input type="text" id="commentText" placeholder="댓글을 입력하세요">
							<button onclick="addComment()">댓글 추가</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	                
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
				<label> <input type="checkbox" value="스팸"> 스팸 </label> 
				<label> <input type="checkbox" value="욕설"> 욕설 </label> 
				<label> <input type="checkbox" value="불쾌한 콘텐츠"> 불쾌한 콘텐츠 </label> 
				<label> <input type="checkbox" value="text"> 기타
				</label>
			</div>
			<div>
				<textarea id="reportReason"></textarea>
				<button onclick="submitReport()">제출</button>
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
				button.src = "<%=request.getContextPath()%>/img/팔로우(빈거).png";
			} else {
				button.src = "<%=request.getContextPath()%>/img/팔로우.png";
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

		function submitReport() {
			var reportReason = document.getElementById('reportReason').value;
			// 여기에 신고 처리 로직 추가
			alert('신고되었습니다.');

			// 신고 팝업 닫기
		}
		
	</script>
<!-- 	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDxoCNyxIo2ayez96wuzbEDnutsv4MquEs&callback=myMap"></script>
 -->
 <%@ include file="/views/common/footer.jsp"%>
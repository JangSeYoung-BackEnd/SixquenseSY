<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<style>
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
</style>
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
									<img src="img/blog/details/details-author.jpg" alt="">
								</div>
								<div class="blog__details__author__text col-sm-6">
									<div class="row">
										<div class="gotoprofile,item col-sm-5" id="openProfilePopup">Michael
											Scofield</div>
										<div class="item col-sm-4">
											<img id="followButton" src="/ogani-master/img/팔로우(빈거).png"
												alt="팔로우 버튼" onclick="toggleImage()" width="30" height="30">
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="blog__sidebar__item">
							<form>
								<input type="button" value="동행신청하기" onclick="confirmAccompany()"><br>
								<br>
							</form>

							<div class="blog__sidebar__recent">
								<a href="#" class="blog__sidebar__recent__item">
									<div class="blog__sidebar__recent__item__pic">
										<img src="img/blog/sidebar/sr-1.jpg" alt="">
									</div>
									<div class="blog__sidebar__recent__item__text">
										<h6>아이디</h6>
									</div>
								</a> <a href="#" class="blog__sidebar__recent__item">
									<div class="blog__sidebar__recent__item__pic">
										<img src="img/blog/sidebar/sr-2.jpg" alt="">
									</div>
									<div class="blog__sidebar__recent__item__text">
										<h6>아이디</h6>
									</div>
								</a> <a href="#" class="blog__sidebar__recent__item">
									<div class="blog__sidebar__recent__item__pic">
										<img src="img/blog/sidebar/sr-3.jpg" alt="">
									</div>
									<div class="blog__sidebar__recent__item__text">
										<h6>아이디</h6>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
				<script>
                    function confirmAccompany() {
                        var confirmed = confirm("동행을 신청하시겠습니까?");
                        
                        if (confirmed) {
                            alert("동행이 신청되었습니다!");
                        } else {
                            alert("동행 신청이 취소되었습니다.");
                        }
                    }
                </script>
				<div class="col-lg-8 col-md-7 order-md-1 order-1">
					<div style="display: flex; flex-direction: row;">
						<div id="continent" class="continent" style="margin: 15px;">
							<form action="">
								<label> <input type="radio" id="" name="continent"
									value="동남아·대만">동남아·대만
								</label><br> <label> <input type="radio" id=""
									name="continent" value="일본">일본
								</label><br> <label> <input type="radio" id=""
									name="continent" value="유럽">유럽
								</label><br> <label> <input type="radio" id=""
									name="continent" value="미주·캐나다">미주·캐나다
								</label>
							</form>
						</div>
						<div id="aisa-contury" class="aisa-contury"
							style="display: none; margin: 15px;">
							<form action="">
								<label> <input type="radio" id="" name="contury"
									value="방콕·파타야">방콕·파타야
								</label> <label> <input type="radio" id="" name="contury"
									value="다낭">다낭
								</label> <label> <input type="radio" id="" name="contury"
									value="호치민·나트랑·달랏">호치민·나트랑·달랏
								</label> <label> <input type="radio" id="" name="contury"
									value="푸켓">푸켓
								</label> <label> <input type="radio" id="" name="contury"
									value="코타카나발루">코타카나발루
								</label><br> <label> <input type="radio" id=""
									name="contury" value="대만">대만
								</label> <label> <input type="radio" id="" name="contury"
									value="보홀">보홀
								</label>> <label> <input type="radio" id="" name="contury"
									value="싱가포르">싱가포르
								</label> <label> <input type="radio" id="" name="contury"
									value="세부·클락">세부·클락
								</label> <label> <input type="radio" id="" name="contury"
									value="보라카이">보라카이
								</label>
							</form>
						</div>
						<div id="japen-contury" class="japen-contury"
							style="display: none; margin: 15px;">
							<form action="">
								<label> <input type="radio" id="" name="contury"
									value="후쿠오카">후쿠오카
								</label> <label> <input type="radio" id="" name="contury"
									value="오사카·교토">오사카·교토
								</label> <label> <input type="radio" id="" name="contury"
									value="도쿄">도쿄
								</label> <label> <input type="radio" id="" name="contury"
									value="샷포로">샷포로
								</label> <label> <input type="radio" id="" name="contury"
									value="오키나와">오키나와
								</label>
							</form>
						</div>
						<div id="europe-contury" class="europe-contury"
							style="display: none; margin: 15px;">
							<form action="">
								<label> <input type="radio" id="" name="contury"
									value="영국">영국
								</label> <label> <input type="radio" id="" name="contury"
									value="프랑스">프랑스
								</label> <label> <input type="radio" id="" name="contury"
									value="이탈리아">이탈리아
								</label> <label> <input type="radio" id="" name="contury"
									value="스위스">스위스
								</label> <label> <input type="radio" id="" name="contury"
									value="스페인·포르투칼">스페인·포르투칼
								</label>
							</form>
						</div>
						<div id="america-contury" class="america-contury"
							style="display: none; margin: 15px;">
							<form action="">
								<label> <input type="radio" id="" name="contury"
									value="미서부">미서부
								</label> <label> <input type="radio" id="" name="contury"
									value="미동부">미동부
								</label> <label> <input type="radio" id="" name="contury"
									value="하와이">하와이
								</label> <label> <input type="radio" id="" name="contury"
									value="캐나다">캐나다
								</label> <label> <input type="radio" id="" name="contury"
									value="호주">호주
								</label>
							</form>
						</div>
					</div>
					<script>
                        const continentRadio = document.getElementsByName("continent");

                        // 라디오 버튼 변경 이벤트 핸들러 함수
                        function handleRadioChange() {
                            const selectedContinent = document.querySelector('input[name="continent"]:checked').value;
                            const asiaContury = document.getElementById("aisa-contury");
                            const japanContury = document.getElementById("japen-contury");
                            const europeContury = document.getElementById("europe-contury");
                            const americaContury = document.getElementById("america-contury");

                            asiaContury.style.display = "none";
                            japanContury.style.display = "none";
                            europeContury.style.display = "none";
                            americaContury.style.display = "none";

                            if (selectedContinent === "동남아·대만") {
                                asiaContury.style.display = "block";
                            } else if (selectedContinent === "일본") {
                                japanContury.style.display = "block";
                            } else if (selectedContinent === "유럽") {
                                europeContury.style.display = "block";
                            } else if (selectedContinent === "미주·캐나다") {
                                americaContury.style.display = "block";
                            }
                        }
                        // 라디오 버튼에 이벤트 리스너 등록
                        for (const radio of continentRadio) {
                            radio.addEventListener("change", handleRadioChange);
                        }
                    </script>
					<div>
						<form action="">
							<input type="text" id="" name="" placeholder="제목을 입력하세요"><br>
							<br>
							<textarea id="" name="" placeholder="글을 작성해주세요" cols="100"
								rows="30"></textarea>
							<br> <input type="text" id="" name="" placeholder="카카오톡 링크"><br>
							<input type="file" id="" name="" multiple> <input
								type="submit" id="" name="">
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<div id="profilePopup" class="popup">
		<div class="popup-content">
			<span class="close" id="closeProfilePopup">&times;</span>
			<h2>프로필 정보</h2>
			<div id="profileInfo">
				<!-- 프로필 정보를 추가하세요 -->
				<p>아이디 넣는 곳 John Doe</p>

				<p>여기는 소개글 적는 곳</p>
				<button id="eportButton">신고하기</button>
				<button id="blockButton">차단하기</button>
				<button id="followButton">팔로우하기</button>
			</div>
		</div>
	</div>
</body>
<script>
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
                button.src = "/ogani-master/img/팔로우(빈거).png";
            } else {
                button.src = "/ogani-master/img/팔로우.png";
            }
            isFilled = !isFilled; // 이미지 상태를 토글
        }
</script>
<%@ include file="/views/common/footer.jsp"%>
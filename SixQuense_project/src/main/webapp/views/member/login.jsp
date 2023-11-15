<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<Style>
.outBox {
	margin: 50px auto;
	padding: 20px;
	max-width: 320px;
	border: 1px solid #999;
	border-radius: 6px;
}

.outBox .inputBox {
	position: relative;
	height: 50px;
}

.outBox .inputBoxinput[type="text"] {
	padding: 0 10px;
	width: 100%;
	height: 50px;
	font-size: 14px;
	box-sizing: border-box;
	border: 1px solid #999;
	outline: none;
}

.outBox .inputBox label {
	position: absolute;
	left: 0;
	bottom: 0;
	padding: 0 6px;
	color: #999;
	font-size: 14px;
	font-weight: normal;
	background: #fff;
	transform: scale(1) translate(4px, -18px);
	transition: all .15s;
	pointer-events: none;
}

.outBox .inputBox input[type="text"]:focus, .outBox.existence .inputBox input[type="text"]
	{
	border: 2px solid red;
}

.outBox .inputBox input[type="text"]:focus+label, .outBox.existence .inputBox label
	{
	color: red;
	transform: scale(.85) translate(-10px, -48px);
}
/* 비밀번호 */
.outBox {
	margin: 50px auto;
	padding: 20px;
	max-width: 320px;
	border: 1px solid #999;
	border-radius: 6px;
}

.outBox .inputBox {
	position: relative;
	height: 50px;
}

.outBox .inputBox input[type="text"] {
	padding: 0 10px;
	width: 100%;
	height: 50px;
	font-size: 14px;
	box-sizing: border-box;
	border: 1px solid #999;
	outline: none;
}

.outBox .inputBox label {
	position: absolute;
	left: 0;
	bottom: 0;
	padding: 0 6px;
	color: #999;
	font-size: 14px;
	font-weight: normal;
	background: #fff;
	transform: scale(1) translate(4px, -18px);
	transition: all .15s;
	pointer-events: none;
}

.outBox .inputBox input[type="text"]:focus, .outBox.existence .inputBox input[type="text"]
	{
	border: 2px solid red;
}

.outBox .inputBox input[type="text"]:focus+label, .outBox.existence .inputBox label
	{
	color: red;
	transform: scale(.85) translate(-10px, -48px);
}
.sh{
	display:flex;
	justify-content: center;
	padding-top: 10px;
	margin-top: 200px;
}
.outBox{
		margin-top:5px !important;
}
.sh{
		margin-top: 3%;
		display: flex;
		justify-content: space-between;
	}
.sh{
		width:40%;
		height:30px;
		display: flex;
		justify-content: space-between;	
}
</Style>
<body>
 
	<div class="sh">
	
	<form action="<%=request.getContextPath()%>/login.do">
		<link rel="stylesheet" href="style_sh.css">
		<div class="logo">
			<a href="http://192.168.1.11:5500/main.html" target="_blank" >
				<img src="Image/KakaoTalk_20231107_164030995_02.png" width="250" height="100"
				class="image">
			</a>
		</div>
			<h1 class="o08pQe" data-ally-title-poece id="headingText" jsname="r4nke">
			<span jsslot>로그인</span>
			</h1>
		<div class="outBox">
			<div class="inputBox">
				<input autocomplete="off" id="userId" name="userId" type="text">
				<label for="userId">이메일</label>
			</div>

			<div class="inputBox">
				<input autocapitalize="off" id="userpw"
					name="userpw" type="password"> <label for="userpw">비밀번호</label>
			</div>
		</div>
			<div class="footer-info">아이디 찾기 | 비밀번호 찾기</div>
			<div class="loginbtn-container">
				<div class="login-btn-wrap">
					<button id="login-btn">로그인</button>
					<br>
					<br>
					<button>
						<a href="<%=request.getContextPath() %>/member/joinServlet.do">회원가입</a>
					</button>
				</div>


				<div class="under-login">
					<span class="stay-check"> <input id="stay-checkbox"
						type="checkbox"></input> <label for="stay-checkbox" id="stay-text">로그인
							상태 유지</label>
					</span>
				</div>

				<!-- 카카오,네이버 로고 이미지 들어 갈곳 -->
				<div class="hr-sect">간편 로그인</div>
				<a class="easy"> <img
					src="<%=request.getContextPath() %>/img/logo/카카오로고.png" width="50"
					height="50"> <img
					src="<%=request.getContextPath() %>/img/logo/네이버로고.png" width="50"
					height="50">
				</a>
		</div>
</body>
</form>


</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="style_sh.css">
</head>
<style>
	.logo{
		display: flex;
		justify-content: center;
		padding-top: 10px;
		margin-top: 200px;
	}
	.outBox{
		margin-top:5px !important;
	}
	.loginbtn-container{
		margin-top: 3%;
		display: flex;
		justify-content: space-between;
	}
	.login-btn-wrap{
		width:40%;
		height:30px;
		display: flex;
		justify-content: space-between;	
	}
	.easy{
		display: flex;
 		margin-left: auto;
 		margin-right: auto;
		justify-content: space-evenly;
 		
	}
</style>
<body>
	<div class="logo">
		<a href="http://192.168.1.11:5500/main.html" target="_blank" >
			<img src="Image/KakaoTalk_20231107_164030995_02.png" width="250" height="100"
				class="image">
		</a>
	</div>
    <section class="login-wrap">
		<div class="outBox">
			<form>
			<div class="inputBox">
				<input type="text" id="sampleId" name="">
				<label for="sampleId">아이디</label>
			</div>
			<div class="inputBox">
				<input type="text" id="USER_PW" name="userpw">
				<label for="USER_PW">비밀번호</label>
			</div>
			<div class="loginbtn-container">
				<div class="login-btn-wrap">
					<button id="login-btn">로그인</button><br><br>
					<button><a href="/SIXQUENCE/second.html">회원가입</a></button>
				</div>
				<div class="under-login">
					<span class="stay-check">
						<input id="stay-checkbox" type="checkbox"></input>
						<label for="stay-checkbox" id="stay-text">로그인 상태 유지</label>
					</span>
				</div>
			</div>
			<div class="hr-sect">간편 로그인</div>
			<a class="easy">
			<img src="/SIXQUENCE/Image/4494622.png" width="50" height="50">
			<img src="/SIXQUENCE/Image/image.png" width="50" height="50">
			</a>
			
			
		</form>
		</div>
		
	</section>
</body>
</html>
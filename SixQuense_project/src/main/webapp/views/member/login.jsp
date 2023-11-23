<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Triptogether::로그인</title>
<style>
.outBox {
	width: 368px;
	height: 416px;
	margin: 50px auto;
	padding: 20px;
	max-width: 720px;
	border: 1px solid #999;
	border-radius: 6px;
	
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

.outBox .inputBox input[type="text"]:focus, .inputBox input.existence,
.outBox .inputBox input[type="password"]:focus, .inputBox input[type="password"]
	{
	border: 2px solid blue;
}

.outBox .inputBox input[type="text"]:focus+label, 
	.inputBox>input.existence+label,
	.outBox .inputBox input[type="password"]:focus+label
{
	color: blue;
	transform: scale(.85) translate(-10px, -48px);
}

.outBox .inputBox {
	position: relative;
	height: 50px;
}

.outBox .inputBox input[type="text"],.outBox .inputBox input[type="password"] {
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

.outBox .inputBox input[type="text"]:focus,.inputBox input[type="text"]
	{
	border: 2px solid blue;
}

.outBox .inputBox input[type="text"]:focus+label,.inputBox label
	{
	color: blue;
	transform: scale(.85) translate(-10px, -48px);
}
.sh{
	display:flex;
	justify-content: center;
	padding-top: 10px;
	margin-top: 200px;
	
}
.outBox{
		margin-top:100px !important;
		
}
.sh{
	margin-top: 3%;
	display: flex;
	justify-content: space-between;
}
.sh{
	width:100%;
	height:30px;
	display: flex;
	justify-content: center;	
}
.inputBox{
	margin-bottom:30px;
}
.hr-sect {
        display: flex;
        flex-basis: 100%;
        align-items: center;
        color: rgba(0, 0, 0, 0.35);
        font-size: 12px;
        margin: 8px 0px;
      }
.hr-sect::before,.hr-sect::after {
        content: "";
        flex-grow: 1;
        background: rgba(0, 0, 0, 0.35);
        height: 1px;
        font-size: 0px;
        line-height: 0px;
        margin: 0px 16px;
      }
.footer-info{
		display: flex;
		
}
/* 회원가입 드롭다운 할꼬얌*/
.dropbtn {
  background-color: transparent;
  color: blue;
  padding: 7px;
  font-size: 15px;
  border: none;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: transparent;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #ddd;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {background-color: transparent;}

.llog{
	display:flex;
    flex-direction:row-reverse;
    flex-wrap:wrap;
    width:100%;
    justify-content:space-around;
}
.login-btn{
	`	  background: blue;
		  color: white;
		  padding: 7px;
		  font-size: 15px;
		  border: none;
}

.btn-5 {
  width: 130px;
  height: 40px;
  line-height: 42px;
  padding: 0;
  border: none;
  background: rgb(255,255,255,1);
}
.btn-5:hover {
	color: #2828CD;
  background: transparent;
   box-shadow:none;
}
.btn-5:before,
.btn-5:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #0000CD;
  box-shadow:
   -1px -1px 5px 0px #fff,
   7px 7px 20px 0px #0003,
   4px 4px 5px 0px #0002;
  transition:400ms ease all;
}
.btn-5:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
.btn-5:hover:before,
.btn-5:hover:after{
  width:100%;
  transition:800ms ease all;
}

</style>
</head>
 <body>
<div class="sh">
	<form action="<%=request.getContextPath()%>/login.do">
		<div class="outBox" color=#2828CD;>
			<div class="logo">
				<a href="<%=request.getContextPath() %>" target="_blank" style="display: flex; justify-content: center;">
					<img src="<%=request.getContextPath()%>/img/logo/ttlogo.png" width="250" height="100"
					class="image" style="display: flex; justify-content: center;">
				</a>
			</div>
			<h1 class="o08pQe" data-ally-title-poece id="headingText" style="display: flex; justify-content: center;">
				<span style="font-size: 20px;">로그인</span>
			</h1>
			<div class="inputBox" style="margin-bottom: 20px;">
				<input autocomplete="off" id="userId" name="userId" type="text">
				<label for="userId">이메일</label>
			</div>
			
			<div class="inputBox" style="margin-bottom: 10px;">
				<input autocapitalize="off" id="userpw"
					name="userpw" type="password"> <label for="userpw">비밀번호</label>
			</div>
			
			<div class="loginbtn-container">
				<div class="hr-sect">계정 만들기 || 간편로그인</div>
				
				<div class="llog">
					<div class="login-btn dropdown">
						 <button class="custom-btn btn-5" style="cursor:pointer;"><span>로그인</span></button>
						 <div class="dropdown-content">
				   	    	<a href="<%=request.getContextPath() %>/views/member/find.jsp">계정 찾기</a>	    
				  	</div>
					</div>
				<div class="dropdown" style="padding-top:7px;">
				  <button class="custom-btn btn-5">계정 만들기</button>
				  	<div class="dropdown-content">
				   	    <a href="<%=request.getContextPath() %>/member/joinServlet.do">SixQuense</a>
				    	<a href="<%=request.getContextPath() %>/views/member/googleapi.jsp">google</a>	    
				  	</div>
				</div>
			</div>
		</div>
	</form>
</div>
	<script>
        var loginBox = document.querySelector('.outBox');
        var loginInputBox = document.querySelectorAll('.inputBox input');
        loginInputBox.forEach(e=>{
                e.addEventListener('keyup', function(){
                if(!e.value == ''){
                    e.classList.add('existence');   
                }else{
                    e.classList.remove('existence');   
                }
            });
        });
       
 	</script>
</body>
</html>

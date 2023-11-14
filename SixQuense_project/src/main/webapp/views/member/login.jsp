<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

/* 첫번째 로그인 페이지 */
/* 아이디 */
<Style>
.outBox {margin:50px auto; padding:20px; max-width:320px; border:1px solid #999; border-radius:6px;}
.outBox .inputBox {position:relative; height:50px;}
.outBox .inputBox input[type="text"] {padding:0 10px; width:100%; height:50px; font-size:14px; box-sizing:border-box; border:1px solid #999; outline:none;}
.outBox .inputBox label {position:absolute; left:0; bottom:0; padding:0 6px; color:#999; font-size:14px; font-weight:normal; background:#fff; transform:scale(1) translate(4px, -18px); transition:all .15s; pointer-events:none;}
.outBox .inputBox input[type="text"]:focus,
.outBox.existence .inputBox input[type="text"] {border:2px solid red;}
.outBox .inputBox input[type="text"]:focus + label,
.outBox.existence .inputBox label {color:red; transform:scale(.85) translate(-10px, -48px);}
/* 비밀번호 */
.outBox {margin:50px auto; padding:20px; max-width:320px; border:1px solid #999; border-radius:6px;}
.outBox .inputBox {position:relative; height:50px;}
.outBox .inputBox input[type="text"] {padding:0 10px; width:100%; height:50px; font-size:14px; box-sizing:border-box; border:1px solid #999; outline:none;}
.outBox .inputBox label {position:absolute; left:0; bottom:0; padding:0 6px; color:#999; font-size:14px; font-weight:normal; background:#fff; transform:scale(1) translate(4px, -18px); transition:all .15s; pointer-events:none;}
.outBox .inputBox input[type="text"]:focus,
.outBox.existence .inputBox input[type="text"] {border:2px solid red;}
.outBox .inputBox input[type="text"]:focus + label,
.outBox.existence .inputBox label {color:red; transform:scale(.85) translate(-10px, -48px);}





/* 간편 로그인  */
.hr-sect {
    display: flex;
    flex-basis: 100%;
    align-items: center;
    color: rgba(0, 0, 0, 0.35);
    font-size: 12px;
    margin: 8px 0px;
  }
  .hr-sect::before,
  .hr-sect::after {
    content: "";
    flex-grow: 1;
    background: rgba(0, 0, 0, 0.35);
    height: 1px;
    font-size: 0px;
    line-height: 0px;
    margin: 0px 16px;
  }

/*회원가입*/
.sign-up{
    margin: 3px;
    font-size: 14px;
}
/*가로 800px 이상일때*/
@media(min-width : 800px)
{
    .main{
        width: 460px;
        margin: auto;
    }

/*언어설정*/
.select-lang{
    margin-top: 20px;
    width: 550px;
    padding-right: 10px;
}
/*IP보안 표시*/
#ip-check{
    margin-right: 7px;
    float: right;
    display:block;
}

/*저작권 표시*/
footer{
    display:block;
}

}
</Style>



<body>
	<div class="logo">
		<a href="http://192.168.1.11:5500/main.html" target="_blank" >
			<img src="<%=request.getContextPath() %>/img/logo/ttlogo.png" width="250" height="100"
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
					<button><a href="<%=request.getContextPath() %>/member/joinServlet.do">회원가입</a></button>
				</div>
				
				<div class="under-login">
					<span class="stay-check">
						<input id="stay-checkbox" type="checkbox"></input>
						<label for="stay-checkbox" id="stay-text">로그인 상태 유지</label>
					</span>
				</div>
			</div>
			<!-- 카카오,네이버 로고 이미지 들어 갈곳 -->
			<div class="hr-sect">간편 로그인</div>
			<a class="easy">
			<img src="<%=request.getContextPath() %>/img/logo/카카오로고.png" width="50" height="50">
			<img src="<%=request.getContextPath() %>/img/logo/네이버로고.png" width="50" height="50">
			</a>
		
			
			</form>
			</div>
			
	</section>
</html>
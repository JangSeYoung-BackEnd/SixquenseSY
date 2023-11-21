<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.outBox {
	margin: 50px auto;
	padding: 20px;
	max-width: 720px;
	border: 1px solid #999;
	border-radius: 6px;
	width: 350px;
}


.outBox .inputBoxinput[type="text"],.outBox .inputBoxinput[type="password"] {
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

.outBox .inputBox input[type="text"]:focus, .outBox.existence .inputBox input[type="text"],
.outBox .inputBox input[type="password"]:focus, .outBox.existence .inputBox input[type="password"]
	{
	border: 2px solid blue;
}

.outBox .inputBox input[type="text"]:focus+label, .outBox.existence .inputBox label,.outBox .inputBox input[type="password"]:focus+label
	{
	color: blue;
	transform: scale(.85) translate(-10px, -48px);
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
	border: 2px solid blue;
}

.outBox .inputBox input[type="text"]:focus+label, 
	.inputBox>input.existence+label,
	.outBox .inputBox input[type="password"]:focus+label
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
		margin-top:5px !important;
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
.btn{
	display: flex;
	background-color:transparent;
    width: 300px;
    padding: 50px 0px;
    border: 1px solid #212121;
    margin: 0px 16px;
    text-align: center;
    border-radius: 30px;
}
.inputBox2{
	width: 100%;
	height: 50px;
}
</style>
<div class="sh">
<body>
	<form action="<%=request.getContextPath()%>/member/enrollMemberEnd.do" method="post" onsubmit="">
		<div class="outBox">
			<div class="inputBox">
				<input autocomplete="off" id="userId" name="userId" type="text" class="inputBoxinput" onsubmit="return fn_membervalidate();">
				<label for="userId">이메일</label>
			</div>

			<div class="inputBox">
				<input autocapitalize="off" id="userpw" class="inputBoxinput"
					name="userpw" type="password"> <label for="userpw">비밀번호</label>
			</div>
			
			
			<div class="inputBox">
				<input autocapitalize="off" id="userpw2" class="inputBoxinput" name="userpw2"
					 type="password"> <label for="userpw2">비밀번호 확인</label>
			</div>
			
			
		
			<div class="inputBox">
				<select id="gender" class="inputBox2" name="gender" id="gender" class="inputBoxinput" autocomplete="off">
				<lable for="gender">성별</lable>
					<option value="gender">성별</option>
					<option value="M">남자</option>
					<option value="F">여자</option>
				</select>
			</div>
			
			
			
			<div class="inputBox">
				<input autocomplete="off" id="userName" class="inputBoxinput"
					name="userName" type="text">
				<label for="userName">이름 </label>
			</div>
			
			
			<div class="inputBox">
				<input autocomplete="off" type="text" class="inputBoxinput"
					id="phone" name="phone" maxlength="13" /><label for="phone">전화번호</label>
			</div>
			
			
				<div class="inputbox">
					<input id="userdd" type="text" class="inputBoxinput" autocomplete="off" name="userYear"/>
					<label for="userdd">년(4자)</label>
				</div>
				
				 <div class="inputbox">
					<select id="userdd" class="inputBox2" id="userdd" name="userMonth" class="inputBoxinput" autocomplete="off">
						<option value="month" disabled selected>월</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select>
				</div>
			
				 <div class="inputbox">
			 		<input id="userdd" type="text" name="userDd" class="inputBoxinput" autocomplete="off"></input>
			 		<label for="userdd">일</label>
				</div>	
		<div>
		<input type='submit' value="가입하기">
		</div>
		
		</div>
		
	</form>
	<!-- <script>
		const fn_membervalidate=()=>{
			 const userId=$("userId").val().trim();
			 if(userId.ienght<8){
				 alert("죄송합니다 8자 이상의 사용자 이름에는 최소 하나의 알파벳 문자(a-z)가 있어야 합니다.")
			 	 return false;
			 }
			 const reg='^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$';
			 const password=$("#password"){
				 alert("비밀번호는 영문자, 특수기호,숫자를 반드시 포함해야합니다.");
				 $("#userpw").val("");
				 $("#userpw2").val("");
				 $("#userpw").focus();
				 return false;
			 }
		}
	</script> -->
	
	
	
	
	
	
	
	
	<script>
		// 아이디 비밀번호 OutBox 입력값 입히면 안내려가고 올라가는 JS
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
 	
 	
 	
 	
 	
 	
 	
 	<script>
 		// 폰 번호 ***-****-**** 자동으로 나오게 하는 JS
 		function phone(str){
        str = str.replace(/[^0-9]/g, '');
        var tmp = '';
        if( str.length < 4){
            return str;
        }else if(str.length < 7){
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3);
            return tmp;
        }else if(str.length < 11){
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 3);
            tmp += '-';
            tmp += str.substr(6);
            return tmp;
        }else{              
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 4);
            tmp += '-';
            tmp += str.substr(7);
            return tmp;
        }
        return str;
    }

var cellPhone = document.getElementById('phone');
cellPhone.onkeyup = function(event){
    event = event || window.event;
    var _val = this.value.trim();
    this.value = phone(_val) ;
}
 	</script>
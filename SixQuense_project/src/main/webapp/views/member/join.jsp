<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
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
   	margin-bottom:45px;
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
button[type="button"], input[type="submit"]{
	background-color:white;
	border:1px solid #d9d9d9;
	cursor:pointer;
}
input{
	margin-bottom:5px;
}
</style>

</head>
<body>
 <div class="sh">
	<form action="<%=request.getContextPath()%>/member/enrollMemberEnd.do" method="post" onsubmit="" id="pwform">
	<div class="outBox">
		<div class="logo">
				<a href="http://192.168.1.11:5500/main.html" target="_blank" style="display: flex; justify-content: center;">
					<img src="<%=request.getContextPath()%>/img/logo/ttlogo.png" width="250" height="100"
					class="image" style="display: flex; justify-content: center;">
				</a>
		</div>
		<div class="inputBox">
				<input autocomplete="off" id="userId" name="userId" type="text" onkeyup="userIdCheckFunction();">
				<label for="userId">이메일</label>
				<button	type="button" onclick="sendEmail(event);">이메일전송</button>		 
		</div>
		
		<h5 style="color:red;" id="IdChekMessage"></h5>
			<div class="inputBox">
	    		<input autocapitalize="off" id="userpw" class="inputBoxinput"  onkeyup="passwordCheckFunction();"
	        		name="userpw" type="password" stlye="">
	   			 <label for="userpw">비밀번호</label>
			</div>
		<div class="inputBox">
	   		<input autocapitalize="off" id="userpw2" class="inputBoxinput" name="userpw2" onkeyup="passwordCheckFunction();"
	        		type="password">
	   		 <label for="userpw2">비밀번호 확인</label>
		</div>
		<h5 style="color:red;" id="passwordChekMessage"></h5>
		<div class="inputBox">
			<input autocomplete="off" id="userName" class="inputBoxinput"
				name="userName" type="text">
			<label for="userName">이름 </label>
		</div>
		<div class="inputBox">
			<input autocomplete="off" type="text" class="inputBoxinput"
			id="phone" name="phone" maxlength="13" /><label for="phone">전화번호</label>
		</div>	
		<div class="inputBox">
			<select id="gender" class="inputBox2" name="gender"  class="inputBoxinput" autocomplete="off">
			<label for="gender">성별</label>
				<option value="gender">성별</option>
				<option value="M">남자</option>
				<option value="F">여자</option>
			</select>
		</div>
		<div class="inputbox">
			<input id="userdd" type="text" class="inputBoxinput" autocomplete="off" name="userYear">
			<label for="userdd">년(4자)</label>
		</div>
		 <div class="inputbox">
			<select id="userdd" class="inputBox2"  name="userMonth" class="inputBoxinput" autocomplete="off">
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
		<input type='submit' value="가입하기" >
		</div>
		
		</div>

		</form>
	</body>
	
	<script>

		const fn_membervalidate=()=>{
			 const userId=$("userId").val().trim();
			 if(userId.iength<8){
				 alert("죄송합니다 8자 이상의 사용자 이름에는 최소 하나의 알파벳 문자(a-z)가 있어야 합니다.")
			 	 return false;
			 }
			 const reg='^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$';
			 const password=$("#password")
			 if(!reg.test(password)){
				 alert("비밀번호는 영문자, 특수기호,숫자를 반드시 포함해야합니다.");
				 $("#userpw").val("");
				 $("#userpw2").val("");
				 $("#userpw").focus();
				 return false;
			 }
		}

	</script> 

  	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script type="text/javascript">
	function passwordCheckFunction() {
	    var userpw = $('#userpw').val();
	    var userpw2 = $('#userpw2').val();

	    if (userpw !== userpw2) {
	        $('#passwordChekMessage').html('비밀번호가 서로 일치하지 않습니다.');
	    } else {
	        $('#passwordChekMessage').html('');
	    }
	}
</script>
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
 <script>
		// '출생 연도' 셀렉트 박스 option 목록 동적 생성
		const birthYearEl = document.querySelector('#userdd-year');
		// option 목록 생성 여부 확인
		isYearOptionExisted = false;
		birthYearEl.addEventListener('focus', function () {
		  // year 목록 생성되지 않았을 때 (최초 클릭 시)
		  if(!isYearOptionExisted) {
		    isYearOptionExisted = true
		    for(var i = 1940; i <= 2022; i++) {
		      // option element 생성
		      const YearOption = document.createElement('option')
		      YearOption.setAttribute('value', i)
		      YearOption.innerText = i
		      // birthYearEl의 자식 요소로 추가
		      this.appendChild(YearOption);
		    }
		  }
		});
</script>

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
		const sendEmail=(e)=>{
			const clientEmail=$("#userId").val();
			if(clientEmail.length>6){
				$(e.target).attr("disabled", true);
				$.post("<%=request.getContextPath()%>/email/sendemail.do",{"email":clientEmail})
				.done((d)=>{
					
					alert("인증번호가 발송되었습니다. 이메일을 확인하세요!");
					
					const div=$(e.target).parent("div").clone();
					const input=$(div).find("input");
					const label=$(div).find("label").text("인증번호");
					const button=$("<button>").attr({type:"button"}).text("확인").click(confirmBtn);
					$(div).find("button").remove();
					$(div).append(button);
					input.val('');
					$(input).attr({id:"confirmNum",name:"confirmNum",});
					$(input).removeAttr("onkeyup");
					
					$(e.target).parent("div").after(div);
				})
				.fail((e)=>{
					alert("인증번호 발송을 실패했습니다. 이메일주소를 다시 확인해주세요");
					$(e.target).attr("disabled", false);
				});
			}else{
				alert("이메일을 입력하세요!");
				$("#userId").focus();
			}
		}
		
		const confirmBtn=(e)=>{
			const num=$("#confirmNum").val();
			console.log(num);
			if(num.length>=6){
				
				$.get("<%=request.getContextPath()%>/email/confirmemail.do?num="+num)
				.done(d=>{
					console.log(d);
					if(d){
						alert("인증번호가 일치합니다.");
						$(e.target).parent("div").css("display","none");
						$(e.target).parent("div").prev().find("button").css("display","none");
						$("#userId").attr("readonly",true);
					}else{
						alert("인증번호가 일치하지않습니다. 다시 확인해주세요");
					}
					
				})
				.fail(d=>{
					alert("인증번호가 다릅니다. 다시 확인해주세요");
					$("#confirmNum").focus();	
				});
			}else{
				alert("인증번호를 입력하세요");
				
				$("#confirmNum").focus();
			}
		}
		
	</script>
</html>
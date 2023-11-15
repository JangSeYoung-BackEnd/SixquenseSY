<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
/*상단 로고  */
.logo{
	display: flex;
	justify-content: center;
	padding-top: 10px;
	margin-top: 200px;
}
.outBox {margin:50px auto; padding:20px; max-width:320px; border:1px solid #999; border-radius:6px;}
.outBox .inputBox {position:relative; height:50px;}
.outBox .inputBox input {padding:0 10px; width:100%; height:50px; font-size:14px; box-sizing:border-box; border:1px solid #999; outline:none;}
.outBox .inputBox label {position:absolute; left:0; bottom:0; padding:0 6px; color:#999; font-size:14px; font-weight:normal; background:#fff; transform:scale(1) translate(4px, -18px); transition:all .15s; pointer-events:none;}
.outBox .inputBox input:focus,
.outBox.existence .inputBox input {border:2px solid red;}
.outBox .inputBox input:focus + label,
.outBox.existence .inputBox label {color:red; transform:scale(.85) translate(-10px, -48px);}
</style>
	<div class="logo">
		<a href="http://192.168.1.11:5500/main.html" target="_blank" >
			<img src="<%=request.getContextPath() %>/img/logo/ttlogo.png" width="250" height="100"
			class="image">
		</a>
	</div>
	<form action="">
    <div class="outBox">
        <div class="inputBox">
            <input autocomplete="off" 
             id="userId" name="userId" type="text">
            <label for="userId">아이디</label>
        </div>

        <div class="inputBox">
            <input autocapitalize="off" placeholder="비밀번호 입력하세요"
            id="userpw" name="userpw" type="password">
            <label for="userpw">비밀번호</label>
        </div>
        <div class="inputBox">
            <select id="gender" class="selectbox" name="gender" id="gender" placeholder="성별">
                <option value="gender">성별</option>
                <option value="man">남자</option>
                <option value="woman">여자</option>
            </select>
        </div>
        <div class="inputBox">
        <input autocomplete="off" placeholder="닉네임 을 정해주세요"
        id="usernn"name="usernn" type="text">
        </div>
        <div class="inputBox">
        <input autocomplete="off" placeholder="핸드폰번호 입력" type="text"
       id="phone" maxlength="13" />
       </div>
        <span style="display: flex;">
            <span class="signup-input-birth">
            <input id="userdd" max="9999" type="date" placeholder="년(4자)"></input>
        </span>

        <span class="signup-input-birth" style="margin-left: 10px;">
            <select id="signup-birth-mm" class="selectbox" name="userdd" onchange="">
                <option value="month">월</option>
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
        </span>

        <span class="signup-input-birth" style="margin-left: 10px;">
            <input id="signup-birth-dd" type="text" placeholder="일"></input>
        </span>

    </div>
    <input type='submit' value="가입하기">
    </form>
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
    <footer class="footer">
        <div class="footer-info">
            아이디 찾기 | 비밀번호 찾기 
        </div>
    </footer> 
</body>
</html>
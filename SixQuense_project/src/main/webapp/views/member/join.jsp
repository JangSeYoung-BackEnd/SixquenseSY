<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
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


/*회원가입 부분*/
.main-signup{
    text-align: center;
    width: 460px;
    margin: auto;
}
h3{
    margin:19px 0px 8px;
    text-align: left;
    font-size: 14px;
    font-family: Dotum,'돋움',Helvetica,sans-serif;
}
.signup-input{
    display:flex;
    /* margin: 0px 10px 8px 10px; */
    padding: 10px;
    border: solid 1px #dadada;
    background: #fff;
    cursor: pointer;
}
.signup-input-c{
    display:flex;
    /* margin: 0px 10px 8px 10px; */
    padding: 10px;
    border: solid 1px #dadada;
    background: #f5f6f7;
    cursor: pointer;
}
.signup-input-c input{
    background: #f5f6f7;
}
#signup-id, #signup-pw, #signup-pww{
    height: 29px;
    border: none;
    outline:none;
    width:100%;
}
.signup-at{
    color: rgb(150, 150, 150);
    font-size: 15px;
    font-family: Dotum,'돋움',Helvetica,sans-serif;
    margin-top: 8px;
}
.pw-lock{
    /* content: ''; */
    /* display: inline-block; */
    top: 50%;
    right: 13px;
    width: 24px;
    height: 24px;
    margin-top: 5px;
    background-image: url(https://static.nid.naver.com/images/ui/join/m_icon_pw_step.png);
    background-size: 125px 75px;
    cursor: pointer;
}
.pww-lock{
    /* content: ''; */
    /* display: inline-block; */
    top: 50%;
    right: 13px;
    width: 24px;
    height: 24px;
    margin-top: 5px;
    background-image: url(https://static.nid.naver.com/images/ui/join/m_icon_pw_step.png);
    background-size: 125px 75px;
    cursor: pointer;
}

.signup-input-birth{
    display: block;
    position: relative;
    width: 100%;
    height: 51px;
    border: solid 1px #dadada;
    padding: 10px;
    background: #fff;
    box-sizing: border-box;
}
#signup-birth-yy, #signup-birth-mm, #signup-birth-dd{
    width: 113px;
    height: 29px;
    border: none;
    outline:none;
}
#signup-name, #signup-gender, #signup-email, #signup-country, #signup-phone, #signup-cnum{
    width:100%;
    height: 29px;
    border: none;
    outline:none;
}
#signup-gender{
    background-color: white;
}
#signup-country{
    background-color: white;
}
#signup-birth-mm{
    background-color: white;
}
/*본인 확인 이메일*/
.choice{
    display: flex;
}
.choice span{
    margin-top: 20px;
    color: rgb(150, 150, 150);
    font-size: 13px;
    font-family: Dotum,'돋움',Helvetica,sans-serif;
}
/*회원가입버튼박스*/
.signup-btn-wrap{
    height: 52px;
    line-height: 55px;
    margin: 10px 0px 50px 0px;
    border: solid 1px rgba(0,0,0,.1);
    background-color: #BDBDBD;
    color: #fff;
    cursor: pointer;
}
/*회원가입버튼*/
#signup-btn{
    width:100px;
    background-color: #2E2E2E;
    border: none;
    color:#A4A4A4;
    font-size: 18px;
    outline:none;
    cursor: pointer;
}
/*인증번호버튼박스*/
.cnum-btn-wrap{
    height: 52px;
    line-height: 55px;
    margin: 10px 0px 0px 10px;
    border: solid 1px rgba(0,0,0,.1);
    background-color: #03c75a;
    color: #fff;
    cursor: pointer;
}
/*인증번호버튼*/
#cnum-btn{
    width:115px;
    background-color: #03c75a;
    border: none;
    color:#fff;
    font-size: 15px;
    outline:none;
    cursor: pointer;
}




</style>




<body>
    <div class="main-signup">
    
        <!--웹페이지 상단-->
        <header>
            <!--트립투게더 LOGO 들어갈곳-->
            <div class="logo">
                <a href="http://192.168.1.11:5500/main.html" target="_blank" title="시퀀스 홈페이지">
                    <img src="<%=request.getContextPath() %>/img/logo/ttlogo.png" width="250" height="100"
                        class="image">
                </a>
            </div>
        </header>
        <!-- 시퀀스 회원가입 -->
        <section>
            <div>
                <h3>아이디</h3>
                <span class="signup-input">
                    <input id="signup-id" type="text"></input>
                    <span class="signup-at"></span>
                </span>

                <h3>비밀번호</h3>
                <span class="signup-input">
                    <input id="signup-pw" type="text"></input>
                    <span class="pw-lock"></span>
                </span>

                <h3>비밀번호 재확인</h3>
                <span class="signup-input">
                    <input id="signup-pww" type="text"></input>
                    <span class="pww-lock"></span>
                </span>

            </div>

            <div style="margin-top: 35px;">
                <!--이름,생년월일,성별,이메일-->
                <h3>이름</h3>
                <span class="signup-input">
                    <input id="signup-name" type="text"></input>
                </span>

                <h3>생년월일</h3>
                <span style="display: flex;">
                    <span class="signup-input-birth">
                        <input id="signup-birth-yy" type="text" placeholder="년(4자)"></input>
                    </span>
                    <span class="signup-input-birth" style="margin-left: 10px;">
                        <select id="signup-birth-mm" class="selectbox" name="month" onchange="">
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
                </span>

                <h3>성별</h3>
                <span class="signup-input">
                    <select id="signup-gender" class="selectbox" name="gender" onchange="">
                        <option value="gender">성별</option>
                        <option value="man">남자</option>
                        <option value="woman">여자</option>
                    </select>
                </span>

                <span class="choice">
                    <h3>본인 확인 이메일</h3>
                    <span>(선택)</span>
                </span>
                <span class="signup-input">
                    <input id="signup-email" type="text" placeholder="선택입력"></input>
                </span>

            </div>

            <div style="margin-top: 35px;">
                <!--휴대전화-->
                <h3>휴대전화</h3>
                <span class="signup-input">
                    <select id="signup-country" class="selectbox" name="country" onchange="">
                        <option value="ko">대한민국 +82</option>
                    </select>
                </span>
                <div style="display: flex;">
                    <span class="signup-input" style="width:100%; margin: 10px 0px 0px 0px">
                        <input id="signup-phone" type="text" placeholder="전화번호 입력"></input>
                    </span>
                    <span class="cnum-btn-wrap">
                        <button id="cnum-btn">인증번호 받기</button>
                    </span>
                </div>
                
                <span class="signup-input-c" style="margin-top: 10px;">
                    <input id="signup-cnum" type="text" placeholder="인증번호 입력하세요"></input>
                </span>
            </div>

            <div>
                <!--가입하기 누름과 동시에 다음으로 넘어가서 유형 테스트 할 버튼-->
                <div class="signup-btn-wrap">
                    <button id="signup-btn">다음</button>
                </div>
            </div>
        </section>
         
        </section>
</body>
</html>
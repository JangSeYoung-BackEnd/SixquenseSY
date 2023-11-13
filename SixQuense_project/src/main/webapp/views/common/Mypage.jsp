<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
	<button id="#">기본요청보내기</button>
	<button id="btnpost" onclick="postajaxTest()">post 방식으로 보내기</button>
	<input id="data" type="text">
	<div id="container"></div>
	</script>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Checkout</h2> 
                        <div class="breadcrumb__option">
                            <a href="<%=request.getContextPath() %>/index.html">Home</a>
                            <span>Checkout</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <img src="<%=request.getContextPath() %>/img/icon/프로필사진.png" style="
                            width: 165px;
                            padding-left: 0px;
                            margin-left: 294px;
                            margin-bottom: 25px;">
                            <p style="width: 750px;"> 홍 길 동</p>
                <form action="#">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>이름</p>
                                        <input type="text" value="홍길동" readonly >
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>성별</p>
                                    <input type="text" value="남" readonly >
                                </div>
                            </div>
                            </div>
                            <div class="checkout__input">
                                <p>닉네임</p>
                                <input type="text" value="길동길동" readonly    >
                            </div>
                             <div class="checkout__input">
                                <p>비밀번호</p>
                                <input type="text" value="**********" readonly>
                            </div>
                            <div class="checkout__input">
                                <p>비밀번호 확인</p>
                                <input type="text" value="" readonly>
                            </div>
                            <div class="checkout__input">
                                <p>생년월일</p>
                                <input type="text" placeholder="1569" class="checkout__input__add" readonly>
                                <input type="text" placeholder="12월/31일" readonly>
                            </div>
                            <div class="checkout__input">
                                <p>가입날짜</p>
                                <input type="text" value="2023/11/11" readonly>
                            </div>
                            <div class="checkout__input">
                                <p>자기소개</p>
                                <textarea style="width: 100%; height: 150px; padding-bottom: 100px; resize:none;"></textarea>
                            </div>
                            <div class="checkout__input__checkbox">
                                <label for="acc">
                                    SNS/마케팅 수신동의
                                    <input type="checkbox" id="acc" checked>
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <div class="checkout__input">
                                <p>계좌관리</p>
                                <input type="text"
                                    placeholder="Notes about your order, e.g. special notes for delivery.">
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6" style="padding-left: 170px; padding-right: 80px;">
                            <div class="checkout__order" style="padding-left: 20px; width: 360px;">
                                <div class="col-lg-3">
                                    <div class="hero__categories">
                                        <div class="hero__categories__all" style="width: 292px;">
                                            <i class="fa fa-bars"></i>
                                            <span>메뉴</span>
                                        </div> 
                                        <div id="Listlist"> 
                                        <ul style="width: 292px; height: 870px0;">
                                            <li id="btn" style="margin-bottom: 15px;"><a href="#"><img src="<%=request.getContextPath() %>/img/icon/사용자 아이디.png" style="width: 40px; margin-right: 10px;"> 사용자 아이디</a></li>
                                            <li style="margin-bottom: 15px;"><a href="#"><img src="<%=request.getContextPath() %>/img/icon/수정.png" style="width: 40px; margin-right: 10px;">개인정보 수정</a></li>
                                            <li style="margin-bottom: 15px;"><a href="#"><img src="<%=request.getContextPath() %>/img/icon/결제상품.png" style="width: 50px; margin-right: 10px;"> 결제상품 조회 & 취소</a></li>
                                            <li style="margin-bottom: 15px;"><a href="#"><img src="<%=request.getContextPath() %>/img/icon/위시리스트.png" style="width: 50px; margin-right: 10px;"> 위시리스트</a></li>
                                            <li style="margin-bottom: 15px;"><a href="#"><img src="<%=request.getContextPath() %>/img/icon/알림.png" style="width: 45px; margin-right: 10px;"> 알림</a></li>
                                            <li style="margin-bottom: 15px;"><a href="#"><img src="<%=request.getContextPath() %>/img/icon/다녀온 여행.png" style="width: 40px; margin-right: 10px;"> 다녀온 여행</a></li>
                                            <li style="margin-bottom: 15px;"><a href="#"><img src="<%=request.getContextPath() %>/img/icon/나의글.png" style="width: 40px; margin-right: 10px;"> 나의 글</a></li>
                                            <li style="margin-bottom: 15px;"><a href="#"><img src="<%=request.getContextPath() %>/img/icon/문의사항.png" style="width: 50px; margin-right: 10px;"> 문의사항</a></li>
                                        </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->
<%@ include file="/views/common/footer.jsp"%>
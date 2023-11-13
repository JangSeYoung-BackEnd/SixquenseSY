<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 푸터&top/문의 버튼 -->
    <footer class="footer spad" style="padding-bottom: 0px; padding-top: 30px;">
        <div class="container" style="margin-left: 100px;">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__about__logo">
                            <a href="<%=request.getContextPath()%>/index.html"></a>
                        </div>
                        <p style="width: 1000px; font-size: 12px; text-align: left;">
                            " 상호명 (주)sixquense | 대표 홍길동 | 개인정보보호책임자 홍길순 | 사업자등록번호 000-000-0000 " | 통신판매업신고번호 2023-서울-0000 | 관광사업등록번호 : 제2023-0호"
                            <br>
                            "주소 서울특별시 00구 00,  | 이메일 0000@0000.com | 마케팅/제휴문의 1234@1234.com"
                            <br>
                            "광고 매체 문의 5678@1234.com"
                            <br>
                            <br>
                            " 자사는 서울특별시관광협회 공제영업보증보험에 가입되어 있습니다."
                            <br>
                            " 영업보증보험: 1.5억원 / 기획여행보증: 2억원"
                            <br>
                            " sixquense은 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 상품·거래정보 및 거래에 대하여 책임을 지지않습니다."
                            <br>
                            " 부득이한 사정에 의해 확정된 여행일정이 변경되는 경우 여행자의 사전 동의를 받습니다. "
                        </p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                    <div class="footer__widget">
                    
                    </div>
                </div>     
            </div>
        <div class="inquirybtn" style="position: fixed; bottom: 70px; right: 20px; border: 0;">
                <button onclick="#문의 페이지" style="background: none; border: none;">
                    <img src="<%=request.getContextPath()%>/img/icon/문의2.png" width="50px" style="background: transparent;">
                </button>
            </div>
        <div style="position: fixed; bottom: 15px; right: 20px;">
        <a href="#" id="topbtn">
            <img src="<%=request.getContextPath()%>/img/icon/화살표.png" width="30px" style="margin-right: 12px">
        </a>
        </div>
    </footer>
    <!-- 푸터 -->
    
    <!-- Js Plugins -->
    <script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/jquery.nice-select.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/jquery-ui.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/jquery.slicknav.js"></script>
    <script src="<%=request.getContextPath()%>/js/mixitup.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/main.js"></script>

  



</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>               
<section class="product spad" style="padding-top:250px";>
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-5">
                <div class="sidebar">
                    <div class="sidebar__item">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
        ul {list-style: none; padding: 0;}
        ul li {display: inline-block; margin-right: 10px;}
        .sub-menu {display: none;}
        .continent{font-size:18px;}
        .continent hobver{font-weight:bold;}
        .continent .sub-menu li:hover a {color: green; font-weight: bold;}
        .continent a.active {color: purple; font-weight: bold;}
        .continent a:hover {color: purple; font-weight:bold;}
</style>
  
</head>
<section class="body">
    <h4>대륙 카테고리</h4>
    <ul>
        <li class="continent"><a href="#">[동남아·대만]</a>
            <ul class="sub-menu">
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=43">다낭</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=34">방콕</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=38">대만</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=42">보라카이</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=39">보홀</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=41">세부</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=37">코타키나발루</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=36">푸켓</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=35">호치민</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=40">싱가포르</a></li>
            </ul>
        </li>
        <li class="continent"><a href="#">[일본]</a>
            <ul class="sub-menu">
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=12">도쿄</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=13">삿포르</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=11">오사카/교토</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=14">오키나와</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=10">후쿠오카</a></li>
            </ul>
        </li>
        <li class="continent"><a href="#">[유럽]</a>
            <ul class="sub-menu">
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=18">스위스</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=19">스페인</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=15">영국</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=17">이탈리아</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=16">프랑스</a></li>
            </ul>
        </li>
        <li class="continent"><a href="#">[미주·캐나다·대양주]</a>
            <ul class="sub-menu">
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=21">미동부</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=20">미서부</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=23">캐나다</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=22">하와이</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=24">호주</a></li>
            </ul>
        </li>
    </ul>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var continents = document.querySelectorAll('.continent');
            continents.forEach(function (continent) {
                continent.addEventListener('click', function () {
                    var subMenu = this.querySelector('.sub-menu');
                    var links = this.querySelectorAll('.continent a');
                    links.forEach(function (link) {
                        link.classList.remove('active');
                    });
                    if (subMenu.style.display === 'none' || subMenu.style.display === '') {
                        subMenu.style.display = 'block';
                        this.querySelector('a').classList.add('active');
                    } else {
                        subMenu.style.display = 'none';
                        this.querySelector('a').classList.remove('active');
                    }
                });
            });
        });
    </script>
            </div>
					<div class="sidebar__item">
							    <div class="latest-product__text">
							        <h4>최근 상품들</h4>
							        <div class="latest-product__slider owl-carousel">
							            <div class="latest-prdouct__slider__item">
							                <a href="<%=request.getContextPath()%>/product/productview.do?productNo=14" class="latest-product__item">
							                    <div class="latest-product__item__pic">
							                        <img src="<%=request.getContextPath() %>/upload/product/a영국re.jpg">
							                    </div>
							                    <div class="latest-product__item__text">
							                        <h6>영국 남부소도시 #세븐시스터즈</h6>
							                        <span>139000원</span>
							                    </div>
							                </a>
                                        <a href="<%=request.getContextPath()%>/product/productview.do?productNo=30" class="latest-product__item">
							                    <div class="latest-product__item__pic">
													<img src="<%=request.getContextPath() %>/upload/product/b프랑스re.jpg">							                    </div>
							                    <div class="latest-product__item__text">
							                        <h6>12년차 파리지앵이 안내하는 꿀팁 가득 투어</h6>
							                        <span>45000원</span>
							                    </div>
							                </a>
                                        <a href="<%=request.getContextPath()%>/product/productview.do?productNo=31" class="latest-product__item">
							                    <div class="latest-product__item__pic">
							                        <img src="<%=request.getContextPath() %>/upload/product/c이탈리아re.jpg">
							                    </div>
							                    <div class="latest-product__item__text">
							                        <h6>고대 로마와 바로크 로마를 함께</h6>
							                        <span>50000원</span>
							                    </div>
							                </a>
                                    </div>
                                    <div class="latest-prdouct__slider__item">
								    <a href="<%=request.getContextPath()%>/product/productview.do?productNo=32" class="latest-product__item">
								        <div class="latest-product__item__pic">
								            <img src="<%=request.getContextPath() %>/upload/product/d스위스re.jpg" alt="">
								        </div>
								        <div class="latest-product__item__text">
								            <h6>스위스 수도 베른, 필수 투어</h6>
								            <span>55000원</span>
								        </div>
								    </a>
                                        <a href="<%=request.getContextPath()%>/product/productview.do?productNo=38" class="latest-product__item">
								        <div class="latest-product__item__pic">
								            <img src="<%=request.getContextPath() %>/upload/product/j호주re.jpg" alt="">
								        </div>
								        <div class="latest-product__item__text">
								            <h6>걸어서 멜버른 시티 정복!</h6>
								            <span>45000원</span>
								        </div>
								    </a>
                                        <a href="<%=request.getContextPath()%>/product/productview.do?productNo=35" class="latest-product__item">
								        <div class="latest-product__item__pic">
								            <img src="<%=request.getContextPath() %>/upload/product/g미동부re.jpg" alt="">
								        </div>
								        <div class="latest-product__item__text">
								            <h6>보스턴 백 베이</h6>
								            <span>55000원</span>
								        </div>
								    </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-7">
                    <div class="product__discount">
                        <div class="section-title product__discount__title">
                            <h2>할인 상품</h2>
                        </div>
                        
                        <div class="row">
                            <div class="product__discount__slider owl-carousel owl-loaded owl-drag">
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic set-bg">
										   <a href="<%=request.getContextPath()%>/product/productview.do?productNo=8" >
										     <img src="<%=request.getContextPath() %>/upload/product/a영국dis4.jpg">
										     <div class="product__discount__percent">-20%</div>
										    </a>
										</div>

                                        <div class="product__discount__item__text">
                                            <span>영국</span>
                                            <h5><a href="#"></a>런던 서쪽 워킹투어 3시간</h5>
                                            <div class="product__item__price">55000원<span>66000원</span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                         <div class="product__discount__item__pic set-bg">
										   <a href="<%=request.getContextPath()%>/product/productview.do?productNo=20" >
										     <img src="<%=request.getContextPath() %>/upload/product/b프랑스dis.jpg">
										     <div class="product__discount__percent">-20%</div>
										    </a>
										</div>
                                        <div class="product__discount__item__text">
                                            <span>프랑스</span>
                                            <h5><a href="#">몽마르트 에펠탑 완전정복</a></h5>
                                            <div class="product__item__price">33000원<span>39600원</span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic set-bg">
										   <a href="<%=request.getContextPath()%>/product/productview.do?productNo=21" >
										     <img src="<%=request.getContextPath() %>/upload/product/c이탈리아dis.jpg">
										     <div class="product__discount__percent">-30%</div>
										    </a>
										</div>
                                        <div class="product__discount__item__text">
                                            <span>이탈리아</span>
                                            <h5><a href="#">로마 시내 야경 저녁투어</a></h5>
                                            <div class="product__item__price">35000원<span>45500원</span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic set-bg">
										   <a href="<%=request.getContextPath()%>/product/productview.do?productNo=26" >
										     <img src="<%=request.getContextPath() %>/upload/product/g미동부dis.jpg">
										     <div class="product__discount__percent">-20%</div>
										    </a>
										</div>
                                        <div class="product__discount__item__text">
                                            <span>미동부</span>
                                            <h5><a href="#">맨하탄 다운타운 투어</a></h5>
                                            <div class="product__item__price">150000원<span>180000원</span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic set-bg">
										   <a href="<%=request.getContextPath()%>/product/productview.do?productNo=29" >
										     <img src="<%=request.getContextPath() %>/upload/product/j호주dis.jpg">
										     <div class="product__discount__percent">-20%</div>
										    </a>
										</div>
                                        <div class="product__discount__item__text">
                                            <span>호주</span>
                                            <h5><a href="#">시드니 동부해안 투어</a></h5>
                                            <div class="product__item__price">250000원<span>300000원</span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                         <div class="product__discount__item__pic set-bg">
										   <a href="<%=request.getContextPath()%>/product/productview.do?productNo=28" >
										     <img src="<%=request.getContextPath() %>/upload/product/i캐나다dis.jpg">
										     <div class="product__discount__percent">-20%</div>
										    </a>
										</div>
                                        <div class="product__discount__item__text">
                                        <div class="product__discount__item__text">
                                            <span>캐나다</span>
                                            <h5><a href="#">밴쿠버 반나절 속성 핵심 투어</a></h5>
                                            <div class="product__item__price">110000원<span>132000원</span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <div class="여행태마">
                        <h2 style="font-weight: bold; text-align: left;">겨울에 어디로 갈까요?</h2>
                        <div class="product_item">
                        <a href="<%=request.getContextPath() %>/product/productlist.do?coordinateNo=13">
    					<img src="<%=request.getContextPath() %>/img/japen/삿포르.png">
    					</a>
                        <a href="<%=request.getContextPath() %>/product/productlist.do?coordinateNo=11">
    					<img src="<%=request.getContextPath() %>/img/japen/오사카교토.png"> 
    					</a>
                        <a href="<%=request.getContextPath() %>/product/productlist.do?coordinateNo=15">
    					<img src="<%=request.getContextPath() %>/img/europe/영국.png"> 
    					</a>
                        <a href="<%=request.getContextPath() %>/product/productlist.do?coordinateNo=22">
    					<img src="<%=request.getContextPath() %>/img/america/하와이.png"> 
    					</a>
                    </div>
                    </div> 
                    </div>
                </div>
            </div>
        </div>
</section>
<%@ include file="/views/common/footer.jsp"%>
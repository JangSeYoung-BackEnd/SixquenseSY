<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
                <!-- Product Section Begin -->
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
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do">다낭</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do">방콕</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do">대만</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do">보라카이</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do">보홀</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do">세부</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do">코타키나발루</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do">푸켓</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do">호치민</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do">푸켓</a></li>
            </ul>
        </li>
        <li class="continent"><a href="#">[일본]</a>
            <ul class="sub-menu">
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do">도쿄</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do">삿포르</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do">오사카/교토</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do">오키나와</a></li>
            </ul>
        </li>
        <li class="continent"><a href="#">[유럽]</a>
            <ul class="sub-menu">
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do">스위스</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do">스페인</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do">영국</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do">이탈리아</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do">프랑스</a></li>
            </ul>
        </li>
        <li class="continent"><a href="#">[미주·캐나다·대양주]</a>
            <ul class="sub-menu">
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do">미동부</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do">미서부</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do">캐나다</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do">하와이</a></li>
                <li><a href= "<%=request.getContextPath() %>/product/productlist.do">호주</a></li>
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
							                <a href="<%=request.getContextPath() %>/product/productlist.do" class="latest-product__item">
							                    <div class="latest-product__item__pic">
							                        <img src="<%=request.getContextPath() %>/img/japen/삿포르.png">
							                    </div>
							                    <div class="latest-product__item__text">
							                        <h6>패키지 상품 이름</h6>
							                        <span>$패키지 가격</span>
							                    </div>
							                </a>
                                        <a href="<%=request.getContextPath() %>/product/productlist.do" class="latest-product__item">
							                    <div class="latest-product__item__pic">
							                        <img src="<%=request.getContextPath() %>/img/japen/삿포르.png">
							                    </div>
							                    <div class="latest-product__item__text">
							                        <h6>패키지 상품 이름</h6>
							                        <span>$패키지 가격</span>
							                    </div>
							                </a>
                                        <a href="<%=request.getContextPath() %>/product/productlist.do" class="latest-product__item">
							                    <div class="latest-product__item__pic">
							                        <img src="<%=request.getContextPath() %>/img/japen/삿포르.png">
							                    </div>
							                    <div class="latest-product__item__text">
							                        <h6>패키지 상품 이름</h6>
							                        <span>$패키지 가격</span>
							                    </div>
							                </a>
                                    </div>
                                    <div class="latest-prdouct__slider__item">
								    <a href="<%=request.getContextPath() %>/product/productlist.do" class="latest-product__item">
								        <div class="latest-product__item__pic">
								            <img src="<%=request.getContextPath() %>/img/japen/삿포르.png" alt="">
								        </div>
								        <div class="latest-product__item__text">
								            <h6>패키지 상품 이름2</h6>
								            <span>$패키지 가격2</span>
								        </div>
								    </a>
                                        <a href="<%=request.getContextPath() %>/product/productlist.do" class="latest-product__item">
								        <div class="latest-product__item__pic">
								            <img src="<%=request.getContextPath() %>/img/japen/삿포르.png" alt="">
								        </div>
								        <div class="latest-product__item__text">
								            <h6>패키지 상품 이름2</h6>
								            <span>$패키지 가격2</span>
								        </div>
								    </a>
                                        <a href="<%=request.getContextPath() %>/product/productlist.do" class="latest-product__item">
								        <div class="latest-product__item__pic">
								            <img src="<%=request.getContextPath() %>/img/japen/삿포르.png" alt="">
								        </div>
								        <div class="latest-product__item__text">
								            <h6>패키지 상품 이름2</h6>
								            <span>$패키지 가격2</span>
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
                            <div class="product__discount__slider owl-carousel">
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic set-bg">
										   <a href="<%=request.getContextPath() %>/product/productlist.do">
										     <img src="<%=request.getContextPath() %>/img/japen/삿포르.png">
										     <div class="product__discount__percent">-20%</div>
										    </a>
										</div>

                                        <div class="product__discount__item__text">
                                            <span>동남아·대만</span>
                                            <h5><a href="#"></a>방콕 5일#디너크루즈#마하나콘#담넌사두억</h5>
                                            <div class="product__item__price">$30.00 <span>$36.00</span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                         <div class="product__discount__item__pic set-bg">
										   <a href="<%=request.getContextPath() %>/product/productlist.do">
										     <img src="<%=request.getContextPath() %>/img/japen/삿포르.png">
										     <div class="product__discount__percent">-20%</div>
										    </a>
										</div>
                                        <div class="product__discount__item__text">
                                            <span>지역</span>
                                            <h5><a href="#">제목</a></h5>
                                            <div class="product__item__price">할인가 <span>$원가</span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic set-bg">
										   <a href="<%=request.getContextPath() %>/product/productlist.do">
										     <img src="<%=request.getContextPath() %>/img/japen/삿포르.png">
										     <div class="product__discount__percent">-20%</div>
										    </a>
										</div>
                                        <div class="product__discount__item__text">
                                            <span>지역</span>
                                            <h5><a href="#">제목</a></h5>
                                            <div class="product__item__price">할인가 <span>$원가</span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic set-bg">
										   <a href="<%=request.getContextPath() %>/product/productlist.do">
										     <img src="<%=request.getContextPath() %>/img/japen/삿포르.png">
										     <div class="product__discount__percent">-20%</div>
										    </a>
										</div>
                                        <div class="product__discount__item__text">
                                            <span>미주·캐나다·대양주</span>
                                            <h5><a href="#">LA,라스베가스 4일#LA자유관광#그랜드캐니언</a></h5>
                                            <div class="product__item__price">$30.00 <span>$36.00</span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic set-bg">
										   <a href="<%=request.getContextPath() %>/product/productlist.do">
										     <img src="<%=request.getContextPath() %>/img/japen/삿포르.png">
										     <div class="product__discount__percent">-20%</div>
										    </a>
										</div>
                                        <div class="product__discount__item__text">
                                            <span>동남아·대만</span>
                                            <h5><a href="#">대만4일#자유여행#예류지질공원</a></h5>
                                            <div class="product__item__price">$30.00 <span>$36.00</span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                         <div class="product__discount__item__pic set-bg">
										   <a href="<%=request.getContextPath() %>/product/productlist.do">
										     <img src="<%=request.getContextPath() %>/img/japen/삿포르.png">
										     <div class="product__discount__percent">-20%</div>
										    </a>
										</div>
                                        <div class="product__discount__item__text">
                                        <div class="product__discount__item__text">
                                            <span>일본</span>
                                            <h5><a href="#">Raisin’n’nuts</a></h5>
                                            <div class="product__item__price">$30.00 <span>$36.00</span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <div class="여행태마">
                        <h2 style="font-weight: bold; text-align: left;">겨울에 어디로 갈까요?</h2>
                        <div class="product_item">
                        <a href="<%=request.getContextPath() %>/product/productlist.do">
    					<img src="<%=request.getContextPath() %>/img/japen/삿포르.png">
    					</a>
                        <a href="<%=request.getContextPath() %>/product/productlist.do">
    					<img src="<%=request.getContextPath() %>/img/japen/삿포르.png">
    					</a>
                        <a href="<%=request.getContextPath() %>/product/productlist.do">
    					<img src="<%=request.getContextPath() %>/img/japen/삿포르.png">
    					</a>
                        <a href="<%=request.getContextPath() %>/product/productlist.do">
    					<img src="<%=request.getContextPath() %>/img/japen/삿포르.png">
    					</a>
                    </div>
                    </div> 
                    </div>
                </div>
            </div>
        </div>
</section>
<%@ include file="/views/common/footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<!-- 검색바 -->
    <section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-lg-9">                 
                    <div class="single-slider hero-overly  slider-height d-flex align-items-center" data-background="assets/img/hero/h1_hero.jpg">
                    <div class="container">
                        <!-- 검색바 -->
                        <div class="row">
                            <div class="col-xl-12">
                               
                                <div class="hero__item set-bg"><img src="./img/10.png" alt="">
                                    <div class="hero__text">
                                        <span>FRUIT FRESH</span>
                                        <h2>여행을 떠나세요</h2>
                                        <p>go trip together</p>
                                        <a href="#" class="primary-btn">SHOP NOW</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div> 
            </div>
        </div>
    </section>
    <!-- 움직이는 바 -->
    <section class="categories">
        <div class="container">
            <div class="row">
                <div class="categories__slider owl-carousel">
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="">
                        <a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=34">
                        <img src="./img/eastsouthasia/방.png">
                        </a>
                        </div>
                        <div class="categories__item set-bg">
                            <h5><a href="#">방콕</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="">
                        <a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=13">
                        <img src="./img/japen/삿포르.png">
                        </a>
                        </div>
                        <div class="categories__item set-bg">
                            <h5><a href="#">삿포로</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="">
                        <a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=15">
                        <img src="./img/europe/영국.png">
                        </a>
                        </div>
                        <div class="categories__item set-bg">
                            <h5><a href="#">영국</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
					    <div class="categories__item set-bg" data-setbg="">
					        <a href="<%=request.getContextPath()%>/product/productlist.do?coordinateNo=24">
					            <img src="./img/america/호주.png">
					        </a>
					    </div>
					    <div class="categories__item set-bg">
					        <h5><a href="#">호주</a></h5>
					    </div>
					</div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="">
                        <a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=23">
                        <img src="./img/america/캐나다.png">
                        </a>
                        </div>
                        <div class="categories__item set-bg">
                            <h5><a href="#">캐나다</a></h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 움직이는 바 End -->

    <!-- 여행지 목록 바 -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>어디로 떠나세요?</h2>
                    </div>
                    <div class="featured__controls">
                        <ul>
                            <li class="active" data-filter="*">전체</li>
                            <li data-filter=".oranges">동남아/대만</li>
                            <li data-filter=".fresh-meat">일본</li>
                            <li data-filter=".vegetables">유럽/중동</li>
                            <li data-filter=".fastfood">미주/캐나다/대양주</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row featured__filter">
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges">
                    <div class="featured__item">
                        <div class="featured__item__pic" data-setbg="">
                        <a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=43">
                        <img src="./img/eastsouthasia/다낭.png"width="250px;"height="265px">
                        </a>
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#"><b>다낭</b></a></h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="">
                        <a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=34">
                        <img src="./img/eastsouthasia/방.png"width="250px;"height="265px">
                        </a>
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#"><b>방콕</b></a></h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-6.jpg">
                        <a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=38">
                        <img src="./img/eastsouthasia/대만.png"width="250px;"height="265px">
                        </a>
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#"><b>대만</b></a></h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-6.jpg">
                        <a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=42">
                        <img src="./img/eastsouthasia/보라카이.png"width="250px;"height="265px">
                        </a>
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#"><b>보라카이</b></a></h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-6.jpg">
                        <a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=39">
                        <img src="./img/eastsouthasia/보홀.png"width="250px;"height="265px">
                        </a>
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#"><b>보홀</b></a></h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-6.jpg">
                        <a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=41">
                        <img src="./img/eastsouthasia/세부클.png"width="250px;"height="265px">
                        </a>
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#"><b>세부</b></a></h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-6.jpg">
                        <a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=37">
                        <img src="./img/eastsouthasia/코타키나발루.png"width="250px;"height="265px">
                        </a>
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#"><b>코타키나발루</b></a></h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-6.jpg">
                        <a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=36">
                        <img src="./img/eastsouthasia/푸켓.png"width="250px;"height="265px">
                        </a>
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#"><b>푸켓</b></a></h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-6.jpg">
                        <a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=35">
                        <img src="./img/eastsouthasia/호치민.png"width="250px;"height="265px">
                        </a>
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#"><b>호치민</b></a></h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="">
                        <a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=12">
                        <img src="./img/japen/도쿄.png"width="250px;"height="265px">
                        </a>
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#"><b>도쿄</b></a></h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="">
                        <a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=13">
                        <img src="./img/japen/삿포르.png"width="250px;"height="265px">
                        </a>
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#"><b>삿포로</b></a></h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="">
                        <a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=11">
                        <img src="./img/japen/오사카교토.png"width="250px;"height="265px">
                        </a>
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#"><b>오사카/교토</b></a></h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="">
                        <a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=14">
                        <img src="./img/japen/오키나와.png"width="250px;"height="265px">
                        </a>
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#"><b>오키나와</b></a></h6>
                        </div>
                    </div>
                </div>
                 <div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="">
                        <a href= "<%=request.getContextPath() %>/product/productlist.do">
                        <img src="./img/japen/후쿠오카.png"width="250px;"height="265px">
                        </a>
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#"><b>후쿠오카</b></a></h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables"><!--유럽-->
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-5.jpg">
                        <a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=18">
                        <img src="./img/europe/스위스.png"width="250px;"height="265px">
                        </a>
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#"><b>스위스</b></a></h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables"><!--유럽-->
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-5.jpg">
                        
                        <a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=19">
                        <img src="./img/europe/스페인.png"width="250px;"height="265px">
                        </a>
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#"><b>스페인</b></a></h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables"><!--유럽-->
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-5.jpg">
                        <a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=15">
                        <img src="./img/europe/영국.png"width="250px;"height="265px">
                        </a>
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#"><b>영국</b></a></h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables"><!--유럽-->
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-5.jpg">
                        <a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=17">
                        <img src="./img/europe/이탈리아.png"width="250px;"height="265px">
                        </a>
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#"><b>이탈리아</b></a></h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables"><!--유럽-->
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-5.jpg">
                        <a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=16">
                        <img src="./img/europe/프랑스.png"width="250px;"height="265px">
                        </a>
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#"><b>프랑스</b></a></h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix fastfood"> <!--미주-->
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-2.jpg">
                        <img src="./img/america/미동부.png"width="250px;"height="265px">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#"><b>미동부</b></a></h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix fastfood"> <!--미주-->
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-2.jpg">
                        <a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=20">
                        <img src="./img/america/미서부.png"width="250px;"height="265px">
                        </a>
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#"><b>미서부</b></a></h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix fastfood"> <!--미주-->
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-2.jpg">
                        <a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=23">
                        <img src="./img/america/캐나다.png"width="250px;"height="265px">
                        </a>
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#"><b>캐나다</b></a></h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix fastfood"> <!--미주-->
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-2.jpg">
                        <a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=22">
                        <img src="./img/america/하와이.png"width="250px;"height="265px">
                        </a>
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#"><b>하와이</b></a></h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix fastfood"> <!--미주-->
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-2.jpg">
                        <a href= "<%=request.getContextPath() %>/product/productlist.do?coordinateNo=24">
                        <img src="./img/america/호주.png"width="250px;"height="265px">
                        </a>
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#"><b>호주</b></a></h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 여행목록 End -->

    <!-- Banner Begin -->
    <div class="banner">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="img/banner/banner-1.jpg" alt="">
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="img/banner/banner-2.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner End -->

    <!-- 최근,베스트,리뷰상품  -->
    <section class="latest-product spad" style="padding-bottom: 50px;">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>최근 상품</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                                <a href="<%=request.getContextPath()%>/product/productview.do" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/eastsouthasia/대만.png" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>대만</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="<%=request.getContextPath()%>/product/productview.do" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/japen/도쿄.png" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>도쿄</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="<%=request.getContextPath()%>/product/productview.do" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/europe/스위스.png" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>스위스</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                            </div>
                            <div class="latest-prdouct__slider__item">
                                <a href="<%=request.getContextPath()%>/product/productview.do" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/europe/영국.png" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>영국</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="<%=request.getContextPath()%>/product/productview.do" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/europe/이탈리아.png" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>이탈리아</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="<%=request.getContextPath()%>/product/productview.do" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/america/미동부.png" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>미동부</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>베스트 상품</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                                <a href="<%=request.getContextPath()%>/product/productview.do" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/japen/오사카교토.png" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>오사카/교토</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="<%=request.getContextPath()%>/product/productview.do" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/america/캐나다.png" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>캐나다</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="<%=request.getContextPath()%>/product/productview.do" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/america/호주.png" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>호주</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                            </div>
                            <div class="latest-prdouct__slider__item">
                                <a href="<%=request.getContextPath()%>/product/productview.do" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/america/하와이.png" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>하와이</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="<%=request.getContextPath()%>/product/productview.do" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/eastsouthasia/보라카이.png" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>보라카이</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="<%=request.getContextPath()%>/product/productview.do" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/eastsouthasia/방.png" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>방콕</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>리뷰 많은 상품</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                                <a href="<%=request.getContextPath()%>/product/productview.do" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/america/미서부.png" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>미서부</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="<%=request.getContextPath()%>/product/productview.do" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/europe/프랑스.png" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>프랑스</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="<%=request.getContextPath()%>/product/productview.do" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/japen/삿포르.png" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>삿포로</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                            </div>
                            <div class="latest-prdouct__slider__item">
                                <a href="<%=request.getContextPath()%>/product/productview.do" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/eastsouthasia/푸켓.png" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>푸켓</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="<%=request.getContextPath()%>/product/productview.do" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/japen/오사카교토.png" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>오사카/교토</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <a href="<%=request.getContextPath()%>/product/productview.do" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/eastsouthasia/방.png" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>방콕</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--최근,베스트,리뷰상품-->

    <!--공지사항-->
    <div class="announcementtable">
        <div class="btnList">
            <div class="announcementbtn">
                <div class="announcementbtn2" style="padding: 0px; margin-left: 220px;">
                    <button class="anbtn" onclick="showAnnouncements()">공지사항</button>
                    <button class="faqbtn" onclick="showFAQ()">FAQ</button>
                </div>
            </div>
        </div>
    </div>
    
    <div class="sc-4eac9403-24 jQrVBe">
        <div class="notificationtable" style="margin-right: 650px;">
            <div class="notificationlist">
                <p class="notification">공지사항입니다 1</p>
            </div>
            <div class="notificationlist">
                <p class="notification">공지사항입니다 2</p>
            </div>
            <div class="notificationlist">
                <p class="notification">공지사항입니다 3</p>
            </div>
        </div>
    </div>
    
    <script>
        function showAnnouncements() {
            var notificationTable = document.querySelector('.notificationtable');
            notificationTable.innerHTML = `
                <div class="notificationlist">
                    <p class="notification">공지사항입니다 1</p>
                </div>
                <div class="notificationlist">
                    <p class="notification">공지사항입니다 2</p>
                </div>
                <div class="notificationlist">
                    <p class="notification">공지사항입니다 3</p>
                </div>
            `;
        }
    
        function showFAQ() {
            var notificationTable = document.querySelector('.notificationtable');
            notificationTable.innerHTML = `
                <div class="notificationlist">
                    <p class="notification">FAQ 내용입니다 1</p>
                </div>
                <div class="notificationlist">
                    <p class="notification">FAQ 내용입니다 2</p>
                </div>
                <div class="notificationlist">
                    <p class="notification">FAQ 내용입니다 3</p>
                </div>
            `;
        }
    </script>







<%@ include file="/views/common/footer.jsp"%>

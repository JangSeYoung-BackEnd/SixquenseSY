<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>메인페이지</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/nice-select.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css" type="text/css">

<body>
	<!-- 페이지 넘어갈때 로딩바 -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!--style="position: fixed; z-index: 999; background-color: white;-->
    <!-- 헤더 -->
    <header class="header" style="display: flex; justify-content: center;">
        <div class="container" style="position: fixed; z-index: 999; background-color: white;">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="./index.html"><img src="<%=request.getContextPath() %>/img/9.png" width="100%"></a>
                    </div>
                </div>
                <div class="col-lg-4" style="display: contents;">
                    <nav class="header__menu">
                        <ul>
                            <li class="active"><a href="./index.html">Home</a></li>
                            <li><a href="./shop-grid.html">Shop</a></li>
                            <li><a href="#">Pages</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="./blog-details_wh.html">Shop Details</a></li>
                                    <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                                    <li><a href="./package_country.html">Package</a></li>
                                    <li><a href="./blog-details.html">Blog Details</a></li>
                                </ul>
                            </li>
                            <li><a href="./blog.html">Blog</a></li>
                            <li><a href="./contact.html">Contact</a></li>
                        </ul>
                        
                    </nav>
                </div>
                <div class="col-lg-4 hero__search">
                    <div class="hero__search__form">
                        <form action="#">
                            <input type="text" placeholder="어디로 떠나실건가요?">
                            <button type="submit" class="site-btn">SEARCH</button>
                        </form>
                    </div>
                </div>
                <div class="col-lg-1">
                    <div class="header__cart">
                        <ul>
                            <div class="header__top__right"><div class="header__top__right__auth">
                                <a href="/login.html"><i class="fa fa-user"></i> Login</a></div>
                                </div>
                        </ul>
                    </div>
                </div>
                <div class="wirtebtn" style="display: flex; align-items: center;">
                    <button type="button" class="btn btn-success">글쓰기</button>
                </div>
            </div>
        </div>
    </header>
    <!-- 헤더 -->
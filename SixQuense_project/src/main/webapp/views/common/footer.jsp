<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 푸터&top/문의 버튼 -->
<footer class="footer spad" style="padding-bottom: 80px;">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-6 col-sm-6">
				<div class="footer__about">
					<div class="footer__about__logo">
						<a href="./index.html"><img src="img/logo.png" alt=""></a>
					</div>
					<ul>
						<li>팀명</li>
						<li>SixQuense</li>
						<li></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
				<div class="footer__widget">
					<h6>팀원</h6>
					<ul>
						<li>이규홍</li>
						<li>정우현</li>
						<li>박승현</li>
					</ul>
					<ul>
						<li>손지은</li>
						<li>장세영</li>
						<li>한재희</li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="footer__copyright">
						<div class="footer__copyright__text">
							<p>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</p>
						</div>
						Copyright &copy;
						<script>document.write(new Date().getFullYear());</script>
						All rights reserved | This template is made with <i
							class="fa fa-heart" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>

						<div class="footer__copyright__payment">
							<img src="img/payment-item.png" alt="">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="inquirybtn"
			style="position: fixed; bottom: 50px; right: 20px; border: 0;">
			<button onclick="#문의 페이지">
				<img src="/img/문의2.png" width="50px">
			</button>
		</div>
		<div style="position: fixed; bottom: 15px; right: 20px;">
			<a href="#" id="topbtn"> <img src="/img/화살표.png" width="30px">
			</a>
		</div>
</footer>
<!-- 푸터 -->

<!-- Js Plugins -->
<script src="<%=request.getContextPath() %>/js/jquery-3.3.1.min.js"></script>
<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery.nice-select.min.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery-ui.min.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery.slicknav.js"></script>
<script src="<%=request.getContextPath() %>/js/mixitup.min.js"></script>
<script src="<%=request.getContextPath() %>/js/owl.carousel.min.js"></script>
<script src="<%=request.getContextPath() %>/js/main.js"></script>
</body>
</html>
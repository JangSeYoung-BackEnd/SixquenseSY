<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style_je.css" type="text/css">
<style>
.btn-group-lg>.btn, .btn-lg {
	font-size: 14px; !important;
	margin: 20px 0px; !important;
	padding: 10px 16px; !important;
	width:1106px; !important;
}

p{
text-align: left; !important;
}

.country_package:after {
    position: absolute;
    left: 0;
    bottom: 140px;
    right: 60px;
    height: 4px;
    width: 300px;
    background: #7fad39;
    content: "";
    margin: 0 auto;
}

.blog__sidebar__item__tags a.selected {
      background: #7fad39;
      color: #ffffff;
    }
</style>
<body>
	<!-- Blog Section Begin -->
	<section class="blog spad" style="padding-top: 250px";>
		<div class="container">
			<div class="blog__item-container">
				<div class="col-lg-4 col-md-5">
					<div class="country_package">나라이름 패키지</div>
					<div class="blog__sidebar">
						<div class="blog__sidebar__item">
							<h4>어떤 여행을 찾고 있나요</h4>
							<div class="blog__sidebar__item__tags">
								<a href="#" class="tag">BEST</a> 
								<a href="#" class="tag">최신순</a> 
								<a href="#" class="tag">특가</a>
							</div>
						</div>
					</div>
				</div>
				<!-- 여기서 부터  -->
				<div class="col-lg-8 col-md-7">
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="blog__item">
							<div class="blog__item__pic">
								<img src="img/blog/blog-2.jpg" alt="">
							</div>
							<div class="blog__item__text">
								<h5>
									<a href="#">패키지/투어 이름1</a>
								</h5>
								<p>패키지 내용1</p>
								<a href="#" class="blog__btn"> 199,000원 <span
									class="arrow_right"></span></a>
								<div class="edit_note">
									<img src="<%=request.getContextPath() %>/img/logo/ttlogo.png" alt="로고이미지입니다" width="120px"><br>
									<div class="edit_text">
										<span>Editor's note</span><br>
										<p>추천 이유1</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 여기까지 -->
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="blog__item">
							<div class="blog__item__pic">
								<img src="img/blog/blog-2.jpg" alt="">
							</div>
							<div class="blog__item__text">
								<h5>
									<a href="#">패키지/투어 이름2</a>
								</h5>
								<p>패키지 내용2</p>
								<a href="#" class="blog__btn"> 가격 <span class="arrow_right"></span></a>
								<div class="edit_note">
									<img src="<%=request.getContextPath() %>/img/logo/ttlogo.png" alt="로고이미지입니다" width="120px"><br>
									<div class="edit_text">
										<span>Editor's note</span><br>
										<p>추천 이유2</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="blog__item">
							<div class="blog__item__pic">
								<img src="img/blog/blog-2.jpg" alt="">
							</div>
							<div class="blog__item__text">
								<h5>
									<a href="#">패키지/투어 이름3</a>
								</h5>
								<p>패키지 내용3</p>
								<a href="#" class="blog__btn"> 가격 <span class="arrow_right"></span></a>
								<div class="edit_note">
									<img src="<%=request.getContextPath() %>/img/logo/ttlogo.png" alt="로고이미지입니다" width="120px"><br>
									<div class="edit_text">
										<span>Editor's note</span><br>
										<p>추천 이유3</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="button-container">
						<button type="button" class="btn btn-secondary btn-lg btn-block" width="1160px">다른
							지역 둘러보기</button>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
<script>
/* 메뉴 버튼 클릭시 색 변하게 하는 이벤트*/
  // 각 태그에 대한 클릭 이벤트를 처리
 document.querySelectorAll('.blog__sidebar__item__tags a').forEach(function(tag) {
    tag.addEventListener('click', function(event) {
      event.preventDefault(); // 기본 동작 방지 (예: 링크 이동)
      
      // 선택된 태그에 'selected' 클래스 추가, 다른 태그에서는 제거
      document.querySelectorAll('.blog__sidebar__item__tags a').forEach(function(otherTag) {
        otherTag.classList.remove('selected');
      });
      tag.classList.add('selected');
    });
  });
</script>
<%@ include file="/views/common/footer.jsp"%>
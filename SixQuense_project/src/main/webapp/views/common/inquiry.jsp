<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>  
    <!-- Breadcrumb Section End -->
<style>
    .box1 a {
        text-decoration: none; /* 링크의 기본 밑줄 제거 (선택사항) */
        color: #000; /* 기본 텍스트 색상 (검은색) */
        transition: color 0.3s ease, background-color 0.3s ease; /* 호버 효과 부드럽게 적용 */
    }

    .box1 a:hover {
        color: #fff; /* 호버 시 텍스트 색상 변경 (흰색) */
        background-color: #4CAF50; /* 호버 시 배경색 변경 (녹색) */
    }
</style>

    <!-- Checkout Section Begin -->
    <section class="checkout spad" style="padding-left: 300px; padding-top: 200px;">
        <div class="container">
            <div class="checkout__form">
                <img src="<%=request.getContextPath() %>/img/icon/문의2.png" style="
                            width: 165px;
                            padding-left: 0px;
                            margin-left: 294px;
                            margin-bottom: 25px;">
                            
                            <form action="#">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="checkout__input">
                                <p style="font-size: xx-large;">문의사항</p>
                                <div style="display: flex; font-size: 50px;">
								    <div class="box1" style="width: 100%; height: 260px; margin-left: 50px;">
								        <a href="<%=request.getContextPath()%>/views/common/announcement.jsp">공지사항</a>
								    </div>
								    <hr />
								    <div class="box1" style="width: 100%; height: 260px; margin-left: 280px;">
								        <a href="<%=request.getContextPath()%>/views/common/FAQ.jsp">FAQ</a>
								    </div>
								</div>
                            </div>
                            
                        </div>
                        
                     </div>   	
                	</form>
                	</div>
            	</div>
        	</div>
</section>
<%@ include file="/views/common/footer.jsp"%>
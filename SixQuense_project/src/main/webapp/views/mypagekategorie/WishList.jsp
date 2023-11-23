<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@page import="com.web.product.dto.ProductwishilistDto,java.util.List" %>
<%
	List<ProductwishilistDto> wish = (List<ProductwishilistDto>)request.getAttribute("wish");
%>

    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad";>
        <div class="container">
            <div class="checkout__form" style="margin-top: 200px;">
                <img src="<%=request.getContextPath() %>/img/icon/위시리스트.png" style=" width: 165px; padding-left: 0px ;margin-left: 294px; margin-bottom: 25px;">                   
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                        <p style="font-size: xx-large;">위시리스트</p>
                        <hr />
                        <%if(!wish.isEmpty()) {
                        	for(ProductwishilistDto w:wish){%>
                            <div class="col-lg-4" >
                            <img style="width: 200px;" src=<%=request.getContextPath() %>/upload/product/<%=w.getOrginalFilename()%>>
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic set-bg" style="height: 200px;">
										   <a href="<%=request.getContextPath() %>/product/productview.do"></a>
                                        <div class="product__discount__item__text">
                                            <div><%=w.getProductWishlistNo() %></div>
                                            <div><%=w.getProductName() %></div>
                                        </div>										    										     
										</div>
                                    </div>
                                </div>
                            <%} %>
                           <%} %>
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
                                        <ul style="width: 292px; height: 870px;">
                                            <li style="margin-bottom: 15px;">

                                               <a href="<%=request.getContextPath()%>/views/common/Mypage.jsp">
                                                  <img src="<%=request.getContextPath() %>/img/icon/사용자아이디.png" style="width: 40px; margin-right: 10px;">사용자아이디
                                               </a>
                                            </li>                                     
                                            <li style="margin-bottom: 15px;">
                                            	<a href="#"><img src="<%=request.getContextPath() %>/img/icon/수정.png" style="width: 40px; margin-right: 10px;">
                                            		<button id="updateBtn">개인정보 수정</button>
                                            	</a>
                                            </li>
                                            <li style="margin-bottom: 15px;">
                                         	<a onclick="location.assign('<%=request.getContextPath()%>/ProductList.do?userNo=<%=loginMember.getUserNo()%>')">                                           	
                                            	<img src="<%=request.getContextPath() %>/img/icon/결제상품.png" style="width: 50px; margin-right: 10px;">
	                                            	<button id="checkcancelBtn">결제상품 조회</button>
	                                            </a>
                                            </li>
                                            <li style="margin-bottom: 15px;">
													<a onclick="location.assign('<%=request.getContextPath()%>/Wish.do?userNo=<%=loginMember.getUserNo()%>')">	                                            
	                                            <img src="<%=request.getContextPath() %>/img/icon/위시리스트.png" style="width: 50px; margin-right: 10px;">
	                                            	<button id="wishBtn">위시리스트</button>
	                                            </a>
                                            </li>
                                            <li style="margin-bottom: 15px;">
	                                            <a onclick="location.assign('<%=request.getContextPath()%>/mypage/mywrite.do?userNo=<%=loginMember.getUserNo()%>')">
		                                            <img src="<%=request.getContextPath() %>/img/icon/나의글.png" style="width: 40px; margin-right: 10px;">
		                                            <button id="mywirteBtn">나의 글</button>
	                                            </a>
                                            </li>
                                            <li style="margin-bottom: 15px;">
	                                            <a href="#"><img src="<%=request.getContextPath() %>/img/icon/문의사항.png" style="width: 50px; margin-right: 10px;">
	                                            	<button id="questionBtn">문의사항</button>
	                                            </a>
                                            </li>
                                        </ul>
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
<script>
	$("#updateBtn").click(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/updateview.do",
			dataType:"html",
			success:function(data){
					console.log(data);
					$("#htmlcontainer").html(data);
				}
			});
		});		
		
	</script>
<script>
	$("#wishBtn").click(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/Wish.do",
			dataType:"html",
			success:function(data){
					console.log(data);
					$("#htmlcontainer").html(data);
				}
			});
		});		
		
	</script>
	<script>
	$("#checkcancelBtn").click(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/ProductList.do",
			dataType:"html",
			success:function(data){
					console.log(data);
					$("#htmlcontainer").html(data);
				}
		});
	});		
	</script>
	 <script>
	$("#mywirteBtn").click(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/mywrite.do",
			dataType:"html",
			success:function(data){
					console.log(data);
					$("#htmlcontainer").html(data);
				}
		});
	});		
	</script>
	<script>
	$("#questionBtn").click(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/question.do",
			dataType:"html",
			success:function(data){
					console.log(data);
					$("#htmlcontainer").html(data);
				}
		});
	});		
	</script>
<%@ include file="/views/common/footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>  
    <!-- Breadcrumb Section End -->
    <style>
    .board-table {
  font-size: 13px;
  width: 100%;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}

.board-table a {
  color: #333;
  display: inline-block;
  line-height: 1.4;
  word-break: break-all;
  vertical-align: middle;
}
.board-table a:hover {
  text-decoration: underline;
}
.board-table th {
  text-align: center;
}

.board-table .th-num {
  width: 100px;
  text-align: center;
}

.board-table .th-date {
  width: 200px;
}

.board-table th, .board-table td {
  padding: 14px 0;
}

.board-table tbody td {
  border-top: 1px solid #e7e7e7;
  text-align: center;
}

.board-table tbody th {
  padding-left: 28px;
  padding-right: 14px;
  border-top: 1px solid #e7e7e7;
  text-align: left;
}
    
    
    
</style>   
<section class="checkout spad" style="padding-top: 200px;padding-top: 250px; padding-bottom: 150px;">
			<div class="container">
				<div class="checkout__form">
					<div id="board-list">
						<div class="container">
						<table class="board-table">
						<p style="font-size: xx-large; margin-bottom: 50px;"><b>FAQ</b></p>
							<thead>
							<tr>
								<th scope="col" class="th-num">번호</th>
								<th scope="col" class="th-title">제목</th>
							</tr>
							</thead>
							<tbody>
								<tr>
								<td>3</td>
									<th><a href="#!">자주 묻는 FAQ</a></th>
									</tr>
									<tr>
									<td>2</td>
										<th><a href="#!">회원가입이안돼요..</a></th>
									</tr>
									<tr>
									<td>1</td>
									 	<th><a href="#!">로그인이 자꾸 풀려요</a></th>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>   	
			</div>
		</div>
	</div>
</section>
<%@ include file="/views/common/footer.jsp"%>
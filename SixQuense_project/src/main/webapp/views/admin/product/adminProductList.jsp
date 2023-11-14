<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<body class="sb-nav-fixed">
<section style="padding-top:80px">
	<main class="mt-5 pt-5">
	<div class="container-fluid px-4" style="width : 1170px;">
		<h1 class="mt-4">Board List</h1>
		<div class="card mb-4">
			<div class="card-header">
				<a class="btn btn-primary float-end" href="register"> 
					글 작성
				</a>
			</div>
			<div class="card-body">
				<table class="table table-hover table-striped">
					<thead>
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${boards}" var="board">
							<tr>
								<td>${board.bno}</td>
								<td><a href="get?bno=${board.bno} ">${board.title}</a></td>
								<td>${board.writer}</td>
								<td>${board.hitCount}</td>
								<td>${board.regDate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	</main>
	</section>
</body>
<%@ include file="/views/common/footer.jsp"%>
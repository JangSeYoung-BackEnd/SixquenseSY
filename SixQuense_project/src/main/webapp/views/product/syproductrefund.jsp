<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환불 요청</title>
</head>
<body>
	<h1>환불 요청</h1>
    <form action="<%=request.getContextPath() %>/productpackage/refund.do" method="post">
        <label for="imp_uid">결제번호:</label><br>
        <input type="text" id="imp_uid" name="imp_uid"><br>
        <button type="submit">환불 요청</button>
    </form> 
</body>
</html>

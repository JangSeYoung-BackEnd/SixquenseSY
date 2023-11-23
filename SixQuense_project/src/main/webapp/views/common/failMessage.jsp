<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<style>
    .failpage, .container{
        display: flex;
        justify-content: center;
        flex-wrap: nowrap;
        flex-direction: column;
        align-items: center;
    }
    .failpage>img, button{
        margin: 30px;
    }
    .section-body{
        width: 500px;
        height: 500px;
        background-color: aliceblue;
        margin-bottom:20px;
    }
</style>
<body>
    <section>
        <div class="container section-body" style="margin-top:200px;">
            <div class="row">
                <div class="failpage">
                    <img src="<%=request.getContextPath()%>/img/failicon.png" alt="실패이미지" width="100px" height="100px">
                    <a>3초후에 홈화면으로 돌아갑니다</a>
                    <button class="btn btn-success" onclick="location.replace'<%= request.getContextPath()%>/')">돌아가기</button>
                </div>
            </div>
        </div>
    </section>
    <script>
		setTimeout(()=>{
			location.replace("<%= request.getContextPath()%>/");
		},3000);
	</script>
</body>
<%@ include file="/views/common/footer.jsp"%>

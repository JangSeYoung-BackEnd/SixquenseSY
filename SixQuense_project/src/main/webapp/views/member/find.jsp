<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<style>
	.pwFind-form{
		display:flex;
		flex-direction:column;
		margin-top:180px;
		width:100%;
		min-height:300px;
		justify-content:center;
	}
	#confirm-container{
		display:none;
	}
</style>
<script>
	window.onload = function() {
		document.getElementById('submit').onclick = function() {
			
			if ( document.pfrm.id.value.trim() == '' ) {
				alert( 'ID를 입력해주세요' );
				return false;
			}
			if ( document.pfrm.mail.value.trim() == '' ) {
				alert( '메일을 입력해주세요' );
				return false;
			}
			document.pfrm.submit();
		}
	}
</script>

<div class="pwFind-form">
    <form action="pwFindForm_ok.do" method="post" class="form-horizontal" name="pfrm">
      	<div class="row">
        	<div class="col-12">
				<h2>비밀번호 찾기</h2>
			</div>	
      	</div>			
      	<br>
        <div class="form-group row">
        	<div class="col-2"></div>
			<label class="d-flex col-form-label col-3 justify-content-end">이메일</label>
			<div class="col-3">
				<input type="text" class="form-control" name="userId" placeholder="이메일을 입력하세요." required="required">
			</div>      
			<div class="col-3"></div>  	
        </div>
	
		<div class="form-group row">
			<div class="col-2"></div>
			<label class="col-form-label col-3 d-flex justify-content-end">성함</label>
			<div class="col-3">
				<input type="text" class="form-control" name="KrUserName" placeholder="이름을 입력하세요." required="required">
			</div> 
			<div class="col-3"></div>       	
	     </div>
	     <div class="form-group row confirm-container" style="display:none;">
			<div class="col-2"></div>
			<label class="col-form-label col-3 d-flex justify-content-end">인증번호</label>
			<div class="col-3">
				<input type="text" class="form-control" name="confirmNum" placeholder="인증번호를 입력하세요!" required="required">
			</div> 
			<div class="col-3">
				<button type="button" id="confirBtn" class="btn btn-outline-success">확인</button>
			</div>       	
	     </div>
		<div class="form-group row">
			<div class="d-flex col-12 justify-content-center">
				<button id="sendEmail" type="button" id="submit" 
				class="btn btn-primary btn-lg">인증메일전송</button>
				<div class="spinner-border text-primary pw-loading" role="status" style="display:none;">
				</div>
			</div>
		</div>	
    </form>
</div>
<script>
	$(()=>{
		$("#sendEmail").click(sendEmail);
		
		$(".confirm-container").click(sendConfirmnum);
	})
	const changePassword=()=>{
		$.post("<%=request.getContextPath()%>/member/randomupdatepassword.do",
				{email:$("input[name=userId]").val()})
				.done(d=>{
					alert("이메일로 임시비밀번호가 발급되었습니다 확인하세요!");
					location.replace("<%=request.getContextPath()%>/loginpage.do");
				});
	}
	const sendEmail=()=>{
		$.post("<%=request.getContextPath()%>/member/findpassword.do",{
			email:$("input[name=userId]").val(),
			name:$("input[name=KrUserName]").val()
		})
		.done(d=>{
			if(d){
				$(".confirm-container").show();
				$("input[name=userId]").attr("readonly",true);
			}else{
				$("#sendEmail").css("display","block");
			}
			$(".pw-loading").css("display","none");
		});
		$("#sendEmail").css("display","none");
		$(".pw-loading").show();
	}
	const sendConfirmnum=()=>{
		const num=$("input[name=confirmNum]").val();
		if(num.length>=6){
			$.get("<%=request.getContextPath()%>/email/confirmemail.do?num="+num)
			.done(d=>{
				if(d){
					//비밀번호변경화면
					$("#sendEmail").removeAttr("disabled");
					changePassword();//비밀번호변경하기
				}else{
					alert("인증번호가 맞지 않습니다.");
				}	
			})
			.fail(error=>{
				alert("인증번호가 맞지 않습니다.");
			})
		}	
	}
	
</script>

<%@ include file="/views/common/footer.jsp" %>
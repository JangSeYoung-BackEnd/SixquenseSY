<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
 <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script> 
 <script src="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> 
<section style="padding-top: 250px">
<!------ Include the above in your HEAD tag ---------->

<form class="form-horizontal" action="<%=request.getContextPath() %>/admin/productinsertend.do" method="post" enctype="multipart/form-data">
<fieldset>

<!-- Form Name -->
<legend><b style="padding-left:540px;">상품 등록</b></legend>

<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-4 control-label" for="nation">지역명</label>
  <div class="col-md-4">
    <select id="nation" name="nation" class="form-control">
	    <option value="다낭">다낭</option>
		<option value="방콕·파타야">방콕·파타야</option>
		<option value="대만">대만</option>
		<option value="보라카이">보라카이</option>
		<option value="보홀">보홀</option>
		<option value="세부">세부</option>
		<option value="코타키나발루">코타키나발루</option>
		<option value="푸켓">푸켓</option>
		<option value="싱가포르">싱가포르</option>
		<option value="호치민·나트랑·달랏">호치민·나트랑·달랏</option>
		<option value="도쿄">도쿄</option>
		<option value="삿포로">삿포로</option>
		<option value="오사카·교토">오사카·교토</option>
		 <option value="오키나와">오키나와</option>
		<option value="후쿠오카">후쿠오카</option>
		<option value="스위스">스위스</option>
		<option value="스페인·포르투칼">스페인·포르투칼</option>
		<option value="영국">영국</option>
		<option value="이탈리아">이탈리아</option>
		<option value="프랑스">프랑스</option>
		<option value="미동부">미동부</option>
		<option value="미서부">미서부</option>
		<option value="캐나다">캐나다</option>
		<option value="하와이">하와이</option>
		<option value="호주">호주</option>
    </select>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="productName">상품명</label>  
  <div class="col-md-4">
  <input id="productName" name="productName" placeholder="상품명을 입력하세요" class="form-control input-md" required="" type="text">
    
  </div>
</div>



<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="price">가격</label>  
  <div class="col-md-4">
  <input id="price" name="price" placeholder="가격을 입력해주세요 ex) 10000" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="discountRate">할인율</label>  
  <div class="col-md-4">
  <input id="discountRate" name="discountRate" placeholder="할인율을 입력해주세요 ex) 0.2" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="minCount">최소 인원</label>  
  <div class="col-md-4">
  <input id="minCount" name="minCount" placeholder="최소인원을 입력해주세요 ex) 3" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="maxCount">최대 인원</label>  
  <div class="col-md-4">
  <input id="maxCount" name="maxCount" placeholder="최대인원을 입력해주세요 ex) 10" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="productDuration">소요 시간</label>  
  <div class="col-md-4">
  <input id="productDuration" name="productDuration" placeholder="소요시간을 입력해주세요 ex) 5" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="productDetail">상품 정보</label>
  <div class="col-md-4">                     
    <textarea class="form-control" id="productDetail" name="productDetail" placeholder="상품 정보를 입력해주세요"></textarea>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="editorNote">Editor's Note</label>
  <div class="col-md-4">                     
    <textarea class="form-control" id="editorNote" name="editorNote" placeholder="에디터 노트를 입력해주세요"></textarea>
  </div>
</div>

<!-- Text input 가이드 파트-->
<div class="form-group">
  <label class="col-md-4 control-label" for="guideName">가이드 이름</label>  
  <div class="col-md-4">
  <input id="guideName" name="guideName" placeholder="가이드 이름을 입력해주세요" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="guidePhone">가이드 연락처</label>  
  <div class="col-md-4">
  <input id="guidePhone" name="guidePhone" placeholder="가이드 연락처를 입력해주세요 ex) 010-0000-0000" class="form-control input-md" required="" type="text">
    
  </div>
</div>



<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-4 control-label" for="productDay">출발 요일</label>
  <div class="col-md-4">
		<label>월<input type="checkbox" name="productDay" value="월"></label>
		<label>화<input type="checkbox" name="productDay" value="화"></label>
		<label>수<input type="checkbox" name="productDay" value="수"></label>
		<label>목<input type="checkbox" name="productDay" value="목"></label>
		<label>금<input type="checkbox" name="productDay" value="금"></label>
		<label>토<input type="checkbox" name="productDay" value="토"></label>
		<label>일<input type="checkbox" name="productDay" value="일"></label>
  </div>
</div>

<br><b style="padding-left:540px;">코스 등록</b> <button id="addCourse" type="button">추가</button><br><br>
<!-- Text input-->

<div id="courseList">
	<div class="form-group">
	  <label class="col-md-4 control-label" for="courseName">코스명</label>  
	  <div class="col-md-4">
	  <input id="courseName" name="courseName" placeholder="코스명을 적어주세요" class="form-control input-md" required type="text">
	  </div>
	</div>
	
	<!-- Textarea -->
	<div class="form-group">
	  <label class="col-md-4 control-label" for="courseDetail">코스소개</label>
	  <div class="col-md-4">                     
	    <textarea class="form-control" id="courseDetail" name="courseDetail" placeholder="코스소개를 적어주세요"></textarea>
	  </div>
	</div>
</div>

<!--  <div class="form-group">
  <label class="col-md-4 control-label" for="courseName2">코스명 2</label>  
  <div class="col-md-4">
  <input id="courseName2" name="courseName2" placeholder="코스명을 적어주세요" class="form-control input-md" required="" type="text">
    
  </div>
</div>


<div class="form-group">
  <label class="col-md-4 control-label" for="courseDetail2">코스소개 2</label>
  <div class="col-md-4">                     
    <textarea class="form-control" id="courseDetail2" name="courseDetail2" placeholder="코스소개를 적어주세요"></textarea>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="courseName3">코스명 3</label>  
  <div class="col-md-4">
  <input id="courseName3" name="courseName3" placeholder="코스명을 적어주세요" class="form-control input-md" required="" type="text">
    
  </div>
</div>



<div class="form-group">
  <label class="col-md-4 control-label" for="courseDetail3">코스소개 3</label>
  <div class="col-md-4">                     
    <textarea class="form-control" id="courseDetail3" name="courseDetail3" placeholder="코스소개를 적어주세요"></textarea>
  </div>
</div>


<div class="form-group">
  <label class="col-md-4 control-label" for="courseName4">코스명 4</label>  
  <div class="col-md-4">
  <input id="courseName4" name="courseName4" placeholder="코스명을 적어주세요" class="form-control input-md" required="" type="text">
    
  </div>
</div>


<div class="form-group">
  <label class="col-md-4 control-label" for="courseDetail4">코스소개 4</label>
  <div class="col-md-4">                     
    <textarea class="form-control" id="courseDetail4" name="courseDetail4" placeholder="코스소개를 적어주세요"></textarea>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="courseName5">코스명 5</label>  
  <div class="col-md-4">
  <input id="courseName5" name="courseName5" placeholder="코스명을 적어주세요" class="form-control input-md" required="" type="text">
    
  </div>
</div>


<div class="form-group">
  <label class="col-md-4 control-label" for="courseDetail5">코스소개 5</label>
  <div class="col-md-4">                     
    <textarea class="form-control" id="courseDetail5" name="courseDetail5" placeholder="코스소개를 적어주세요"></textarea>
  </div>
</div>
  -->


<!-- File Button --> 
<div class="form-group">
  <label class="col-md-4 control-label" for="upfile">이미지 첨부</label>
  <div class="col-md-4">
    <input id="upfile" name="upfile" class="input-file" type="file" multiple="multiple" accept=".jpg, .jpeg, .png">
  </div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="singlebutton"></label>
  <div class="col-md-4">
    <input type="button" id="submitbutton" name="submitbutton" class="btn btn-primary" value="등록">
  </div>
  </div>

</fieldset>
</form>
<script>
 $("#submitbutton").click(e=>{
	//js Formdata클래스를 제공함 -> 폼태그랑 비슷
	const form = new FormData();
	//FormData클래스에 append(key,value)로 전송할 데이터를 저장
	const fileInput = $("#upfile");
	console.log(fileInput[0].files[0]); /* 파일을 저장하는 속성 files, 여러개로 저장되기 때문에 인덱스 부여 */
	$.each(fileInput[0].files,(i,f)=>{ /* 배열로 만들어서 반복문 돌 수 있게 만든다 */
		form.append("upfile"+i,f);
	});
	$(".form-horizontal input").each((i,e)=>{
		console.log(e.name,e.value);
		if ($(e).is(":checkbox") && !$(e).is(":checked")) {
		      return; // 체크박스가 체크되지 않았을 경우 건너뜁니다.
		    }
		form.append(e.name,e.value);
	});
	
	 const selectedNation = $("#nation").find(":selected").val();
	 form.append("nation", selectedNation);
	 
	 
	 $('.form-horizontal textarea').each((i,e)=>{
			console.log(e.name,e.value);
			form.append(e.name,e.value);
		});

		$.ajax({
		url: "<%=request.getContextPath()%>/admin/productinsertend.do",
		data:form,
		type:"post",
		processData:false, /* form형식에서 바이너리형식(파일전송)으로 바꾸기 위해서 false */
		contentType:false,
		success:data=>{
			alert("등록이 성공 되었습니다");
		},
		error:(r,e)=>{
			alert("등록이 실패되었습니다");
		},
		complete:()=>{
			fileInput.val('');
		}
	}) 
});
	$("#addCourse").click((()=>{
		let count=0;
		return e=>{
		const cloneCourse=$("#courseList").clone();
		$("#courseList").after(cloneCourse);
	}})())
 
</script>
</section>
<%@ include file="/views/common/footer.jsp"%>
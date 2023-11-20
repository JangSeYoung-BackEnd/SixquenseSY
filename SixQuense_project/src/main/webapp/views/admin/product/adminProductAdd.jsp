<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<form class="form-horizontal">
<fieldset>

<!-- Form Name -->
<legend>PRODUCTS</legend>

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
		<option value="싱가포르">푸켓</option>
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
  <input id="productDurationt" name="productDuration" placeholder="소요시간을 입력해주세요 ex) 5" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="productDetail">상품 정보</label>
  <div class="col-md-4">                     
    <textarea class="form-control" id="productDetail" name="productDetail" placeholder="상품 정보를 입력해주세요"></textarea>
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
  <label class="col-md-4 control-label" for="product_categorie">출발 요일</label>
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

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="available_quantity">AVAILABLE QUANTITY</label>  
  <div class="col-md-4">
  <input id="available_quantity" name="available_quantity" placeholder="AVAILABLE QUANTITY" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_weight">PRODUCT WEIGHT</label>  
  <div class="col-md-4">
  <input id="product_weight" name="product_weight" placeholder="PRODUCT WEIGHT" class="form-control input-md" required="" type="text">
    
  </div>
</div>



<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_name_fr">코스소개</label>
  <div class="col-md-4">                     
    <textarea class="form-control" id="product_name_fr" name="product_name_fr"></textarea>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="percentage_discount">PERCENTAGE DISCOUNT</label>  
  <div class="col-md-4">
  <input id="percentage_discount" name="percentage_discount" placeholder="PERCENTAGE DISCOUNT" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="stock_alert">STOCK ALERT</label>  
  <div class="col-md-4">
  <input id="stock_alert" name="stock_alert" placeholder="STOCK ALERT" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Search input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="stock_critical">STOCK CRITICAL</label>
  <div class="col-md-4">
    <input id="stock_critical" name="stock_critical" placeholder="STOCK CRITICAL" class="form-control input-md" required="" type="search">
    
  </div>
</div>

<!-- Search input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="tutorial">TUTORIAL</label>
  <div class="col-md-4">
    <input id="tutorial" name="tutorial" placeholder="TUTORIAL" class="form-control input-md" required="" type="search">
    
  </div>
</div>

<!-- Search input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="tutorial_fr">TUTORIAL FR</label>
  <div class="col-md-4">
    <input id="tutorial_fr" name="tutorial_fr" placeholder="TUTORIAL FR" class="form-control input-md" required="" type="search">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="online_date">ONLINE DATE</label>  
  <div class="col-md-4">
  <input id="online_date" name="online_date" placeholder="ONLINE DATE" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="author">AUTHOR</label>  
  <div class="col-md-4">
  <input id="author" name="author" placeholder="AUTHOR" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="enable_display">ENABLE DISPLAY</label>  
  <div class="col-md-4">
  <input id="enable_display" name="enable_display" placeholder="ENABLE DISPLAY" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="comment">COMMENT</label>  
  <div class="col-md-4">
  <input id="comment" name="comment" placeholder="COMMENT" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="approuved_by">APPROUVED BY</label>  
  <div class="col-md-4">
  <input id="approuved_by" name="approuved_by" placeholder="APPROUVED BY" class="form-control input-md" required="" type="text">
    
 <!-- File Button --> 
<div class="form-group">
  <label class="col-md-4 control-label" for="filebutton">main_image</label>
  <div class="col-md-4">
    <input id="filebutton" name="filebutton" class="input-file" type="file">
  </div>
</div>
<!-- File Button --> 
<div class="form-group">
  <label class="col-md-4 control-label" for="filebutton">auxiliary_images</label>
  <div class="col-md-4">
    <input id="filebutton" name="filebutton" class="input-file" type="file">
  </div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="singlebutton">Single Button</label>
  <div class="col-md-4">
    <button id="singlebutton" name="singlebutton" class="btn btn-primary">Button</button>
  </div>
  </div>

</fieldset>
</form>
    
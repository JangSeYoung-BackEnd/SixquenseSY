<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.web.product.dto.ProductDto" %>
<%@ page import="com.web.member.dto.Member" %>
<%@ include file="/views/common/header.jsp"%>

<% 
ProductDto product = (ProductDto)request.getAttribute("product");
/* Member loginMember = (Member)session.getAttribute("loginMember"); */
 int productPrice=product.getProductPrice();
 int selectOption=(int) request.getAttribute("selectOption");
 int totalPrice=productPrice * selectOption;
%>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>
            var IMP = window.IMP; 
            IMP.init("imp88100268"); 
            
            const today = new Date();   
            const hours = today.getHours(); // 시
            const minutes = today.getMinutes();  // 분
            const seconds = today.getSeconds();  // 초
            const milliseconds = today.getMilliseconds();
            const makeMerchantUid = hours +  minutes + seconds + milliseconds;

            function paymentButton() {
                var infocheckbox = document.getElementById("infocheckbox");
                if (!infocheckbox.checked) {
                    return;
                }
                
                var cardRadio = document.querySelector('input[name="payment"][value="card"]');
                var kakaopayRadio = document.querySelector('input[name="payment"][value="kakaopay"]');
                
                if (cardRadio.checked) {
                    payment_card();
                } else if (kakaopayRadio.checked) {
                    payment_kakaopay();
                } else {
                    alert("결제 방법을 선택해주세요.");
                }
            }
        
         function payment_kakaopay() {
             IMP.request_pay({
                 pg : 'kakaopay',
                 pay_method : 'card',
                 merchant_uid: "IMP"+makeMerchantUid, 
                 name : $("div.shoping__cart__item>h3").text(),
                 amount : parseInt($("td.shoping__cart__item__close").text()),
             }, function (rsp) { // callback
                 if (rsp.success) {
                	 $("#orderInfo div.nice-select").removeClass("disabled");
                     
                     //주문번호 merchant_uid : rsp.merchant_uid, //주문번호
                     //결제번호  imp_uid : rsp.imp_uid, //결제 고유번호
                     //결제상태 status * string
                      $("#orderInfo>select").removeAttr("disabled");
                     //주문정보 저장
                     const paidTime=new Date(rsp.paid_at*1000)
                      $("#paid_at").val(paidTime.getFullYear()+"-"
                    		  +(paidTime.getMonth()+1)+"-"
                    		  +paidTime.getDate()+"T"
                    		  +paidTime.getHours()+":"
                    		  +paidTime.getMinutes()+":"
                    		  +paidTime.getSeconds()); // 결제승인시각
				     
                      
                      $("#merchant_uid").val(rsp.merchant_uid); // 주문번호
				      $("#imp_uid").val(rsp.imp_uid); // 결제 고유번호
				      $("#status").val(rsp.status); // 결제상태
                      $("#orderInfo").submit(); 
                 } else {
                	 alert("주문이 취소됐습니다.");
                 }
             });
         }
         function payment_card() {
             IMP.request_pay({
                 pg : "kcp.AO09C", // 결제사명.PG상점아이디
                 pay_method : 'card',
                 merchant_uid: "IMP"+makeMerchantUid, 
                 name : $("div.shoping__cart__item>h3").text(),
                 amount : parseInt($("td.shoping__cart__item__close").text()),
             }, function (rsp) { // callback
                 if (rsp.success) {
                	 $("#orderInfo div.nice-select").removeClass("disabled");
                     
                     //주문번호 merchant_uid : rsp.merchant_uid, //주문번호
                     //결제번호  imp_uid : rsp.imp_uid, //결제 고유번호
                     //결제상태 status * string
                      $("#orderInfo>select").removeAttr("disabled");
                     //주문정보 저장
                     const paidTime=new Date(rsp.paid_at*1000)
                      $("#paid_at").val(paidTime.getFullYear()+"-"
                    		  +(paidTime.getMonth()+1)+"-"
                    		  +paidTime.getDate()+"T"
                    		  +paidTime.getHours()+":"
                    		  +paidTime.getMinutes()+":"
                    		  +paidTime.getSeconds()); // 결제승인시각
				     
                      
                      $("#merchant_uid").val(rsp.merchant_uid); // 주문번호
				      $("#imp_uid").val(rsp.imp_uid); // 결제 고유번호
				      $("#status").val(rsp.status); // 결제상태
                      $("#orderInfo").submit(); 
                 } else {
                	 alert("주문이 취소됐습니다.");
                 }
             });
         }
</script>
<script>
function inputs() {
	//event.preventDefault();	//폼태그 방지 */
	  document.getElementById('name2').value = document.getElementById("name").value;
	  //document.getElementById('name2').readonly = true;
	
	  document.getElementById('phone2').value = document.getElementById("phone").value;
	 // document.getElementById('phone2').readonly = true;
	
	  document.getElementById('birthDate2').value = document.getElementById("birthDate").value;
	  //document.getElementById('birthDate2').readonly = true;
	  //$.each($("#orderInfo input"),(i,e)=>{console.log(e);e.attr("readonly");});
	  console.log($("#orderInfo input").attr("readonly",true));
	  document.querySelector('div.nice-select[tabindex="0"] span').innerText = document.getElementById('gender').value;
	  //document.querySelector('div.nice-select[tabindex="0"] option.selected').classList.toggle('seleted');
	  const choiceGender=document.getElementById('gender').value;
	  switch(choiceGender){
	  case 'M':
		  document.querySelector('div.nice-select[tabindex="0"] li[data-value="M"]').classList.toggle('selected');
		  break;
	  case 'F':
		  document.querySelector('div.nice-select[tabindex="0"] li[data-value="F"]').classList.toggle('selected');
		  break;
	  }
	  $.each($("#gender2 > option"),(i,e)=>{$(e).removeAttr("selected"); if(e.value==choiceGender) {$(e).attr('selected',true);}});
	  document.querySelector('#orderInfo div.nice-select').classList.toggle('disabled');
	
/*   var gender = document.getElementById("gender").value;

  if (gender == "male") {
    document.getElementById("gender2").value = "male";
  } else if (gender == "female") {
    document.getElementById("gender2").value = "female";
  } else {
    document.getElementById("gender2").value = "";
  } */
}
</script>
<section class="body">
    <div style="display: flex;margin-top:170px;">
    <section class="set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="containerbox">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Shopping Cart</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>Shopping Cart</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="col-lg-6">
        <div class="containerbox">
            <style>
              .shoping__cart__item {
                display: flex;
                align-items: center;
              }
          
              .shoping__cart__item img {
                max-width: 50px;
                margin-right: 10px;
              }
          
              .shoping__cart__item h2,
              .shoping__cart__item h5 {
                margin: 0;
              }
          
              .quantity {
                width: 50px;
              }
          
              .pro-qty input {
                width: 100%;
                text-align: center;
              }
          
              .shoping__cart__item__close {
                cursor: pointer;
                color: #ff0000;
              }
            </style>
  
            <h3>예약하기</h3><br>
            
              <div class="row">
              <div class="col-lg-12">
                <div class="shoping__cart__table">
                  <table>
                    <thead>
                      <tr>
                        <th class="shoping__product">상품이름</th>
                        <th>가격</th>
                        <th>수량</th>
                        <th>총합</th>
                        
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>
                          <div class="shoping__cart__item">
                          <img src="<%=request.getContextPath() %>/upload/product/<%=product.getAttachment().get(0).getOrginalFilename() %>">
                            <h3 style="font-size: 20px;"><b><%=product.getProductName() %></b></h3>
                          </div>
                        </td>
                        <td class="shoping__cart__price">
                          <%=product.getProductPrice() %>원
                        </td>
                        <td class="shoping__cart__total">
                         <%= request.getAttribute("selectOption") %>
                        </td>
                        <td class="shoping__cart__item__close">
						    <%=totalPrice %>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            
            <div class="row">
                <div class="col-lg-12">  
                </div>
                <div class="form-containerbox">
                <form>
                    
                    <h2>예약자 정보 입력</h2>
                    <label for="name">한글 이름:</label>
                    <input type="text"id="name" name="name" value="<%=loginMember.getKrUserName() %>" readonly>
                  
                    
                     <div>
                        <label for="name">전화번호:</label>
                    <input type="text" id="phone" name="phone" value="<%=loginMember.getPhone() %>" readonly>
                     </div>
                    <div class="flex-containerbox">
                      <div>
                        <label for="birthDate">생년월일:</label>
                        <input type="date" id="birthDate" name="birthDate" value="<%=loginMember.getUserDd() %>" readonly>
                      </div>
                    </div>
                    <label for="gender">성별:</label>
                    <select id="gender" name="gender" disabled>
                      <option value="M" <%=loginMember.getGender().equals("M")?"selected":"" %>>M</option>
                      <option value="F" <%=loginMember.getGender().equals("F")?"selected":"" %>>F</option>
                    </select>
                    
                  </form>
                  
                  <style>
                    form  {
                        max-width: 600px;
                        margin: 20px 0 20px 500px;
                        padding: 0 20px;
                        box-sizing: border-box;
                        background-color: #f5f5f5;
                    }
                   #orderInfo{
                      
                   }
                    label {
                        display: block;
                        margin-bottom: 8px;
                    }
                
                    input,
                    select {
                        width: 100%;
                        padding: 8px;
                        margin-bottom: 16px;
                        box-sizing: border-box;
                    }
                
                    .flex-containerbox {
                        display: flex;
                        justify-content: space-between;
                        margin-bottom: 16px;
                    }
                
                    button {
                        background-color: #4caf50;
                        color: white;
                        padding: 10px 15px;
                        border: none;
                        border-radius: 4px;
                        cursor: pointer;
                    }
                
                    button:hover {
                        background-color: #45a049;
                    }
                    .form-containerbox{
                        display: flex;
                        width:100%;
                        justify-content: space-between;
                    }
                </style>
                <form id="orderInfo" action="<%=request.getContextPath()%>/productpackage/orderend.do" method="post">
                  	<input type="hidden" name="productNo" value="<%=product.getProductNo()%>">
                    <input type="hidden" name="productStack" value="<%= request.getAttribute("selectOption") %>">
                    <input type="hidden" name="totalPrice" value="<%= totalPrice %>">
                    <input type="hidden" name="userNo" value="<%=loginMember.getUserNo() %>">
                    <input type="hidden" id="paid_at" name="paidat"/>
                    <input type="hidden" id="merchant_uid" name="merchantuid"/>
                    <input type="hidden" id="imp_uid" name="impuid"/>
                    <input type="hidden" id="status" name="status"/>
                   
                    <h2>대표 여행자 정보 입력</h2>
                    <label for="name">한글 이름:</label>
                    <input type="text" id="name2" name="name2" required>
                  
                    <div>
                    <label for="name">전화번호:</label>
                    <input type="text" id="phone2" name="phone2" required>
                    </div>
                  
                    <div class="flex-containerbox">
                      <div>
                        <label for="birthDate">생년월일:</label>
                        <input type="date" id="birthDate2" name="birthDate2" required>
                      </div>
                    </div>
                    
                    <label for="gender">성별:</label>
                    <select id="gender2" name="gender2" >
               			<option  selected >선택</option>
                      <option value="M">M</option>
                      <option value="F">F</option>
                    </select>
                    <button type="button" onclick="inputs()">로그인 정보와 동일</button>
                  </form>
            </div>
        </div>
          <style>
            form {
                max-width: 600px;
                margin: 20px 0 20px 500px;
                padding: 0 20px;
                box-sizing: border-box;
                background-color: #f5f5f5;
            }
        </style>
    </div>    
    </section>
    <div class="col-lg-3" style="border: 2px solid grey; padding: 22px 24px; width: 340px;">
          <h3>결제 정보</h3><hr>
        <div>
          <h5>주문 금액</h5>
          <h4 style="background-color: #4caf50; padding: 5px; color: white;">총 결제 금액<%=totalPrice %> 원</h4>
        </div>

    <h3>약관 안내</h3>
    <hr>

    <div>
       <div style="display:flex;align-item:center;justify-content:space-between;">
           <p class="consent">개인정보 수집 및 이용동의</p>
            <button class="consent" onclick="showModal()" style="padding: 2px 4px; margin-left: 100px; height: 34px;">필수</button>
            <div style="display:flex;align-item:center;justify-content:center">
               <input type="checkbox" id="personalInfoConsent" onchange="checkConsent()">
            </div>
         </div>
         <div id="termsModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <h4>개인정보 수집 및 이용동의 (필수)</h4>
                <p>
               1. 개인정보 수집 및 이용목적:<br>
               상품 제공 계약의 성립, 계약 관련 동의 또는 철회 본인 의사 확인, 대금환불, 상품배송, 고객상담<br>
               <br>
               2. 개인정보 수집 항목:<br>
               · 예약자 정보 : 이름, 이메일, 휴대폰번호, 영문이름(일부 상품)<br>
               · 여행자 정보 : 이름, 영문이름(일부 상품)<br>
               · 추가 예약 정보 : 성별(일부 상품), 생년월일(일부 상품), 카카오톡ID(일부 상품)<br>
               <br>
               3. 보유 및 이용기간:<br>
               회원 탈퇴시 까지(단, 관계 법령에 따름)
        </p>
                <button onclick="confirmConsent('termsModal', 'personalInfoConsent')">확인</button>
            </div>
        </div>
         
         <div style="display:flex;align-item:center;justify-content:space-between;">   
        <p class="consent">개인정보 제공 동의</p>
            <button class="consent" onclick="showModal2()" style="padding: 2px 4px; margin-left: 150px; height: 34px;">필수</button>
            <div>
                  <input type="checkbox" id="infoProvidingConsent" onchange="checkConsent()">            
            </div>
         </div>
         <div id="termsModal2" class="modal">
        <div class="modal-content">
                <span class="close">&times;</span>
                <h4>개인정보 제공 동의 (필수)</h4>
                <p>
               1. 개인 정보를 제공받는자<br>
            · B2B단거리상품팀<br>
            2. 제공하는 개인정보 항목<br>
            · 예약자 정보 (이름, 이메일, 휴대폰번호, 영문이름(일부 상품)), 여행자 정보(이름, 영문이름(일부 상품)), 추가 예약 정보 (성별(일부 상품), 생년월일(일부 상품), 카카오톡ID(일부 상품))
            <br>
            3. 개인정보를 제공받는 자의 이용 목적<br>
            · 판매자와 구매자 거래, 상품배송, 고객관리(고객상담/불만처리)
            <br>
            4. 보유 및 이용기간
            · 여행 완료 후 5일까지
              </p>
                <button onclick="confirmConsent('termsModal2', 'infoProvidingConsent')">확인</button>
            </div>
        </div>
        
        
        <div style="display:flex;align-item:center;justify-content:space-between;">   
        <p class="consent">고유식별정보 제공 동의</p>
            <button class="consent" onclick="showModal3()" style="padding: 2px 4px; margin-left: 117px; height: 34px;">필수</button>
            <div>
               <input type="checkbox" id="identificationConsent" onchange="checkConsent()">            
            </div>
        </div>
        <div id="termsModal3" class="modal">
        <div class="modal-content">
                <span class="close">&times;</span>
            <table>
              <tr>
                <th>제공 받는자</th>
                <th>제공 목적</th>
                <th>제공 정보</th>
                <th>보유 및 이용 기간</th>
              </tr>
              <tr>
                <td>B2B단거리상품팀</td>
                <td>현지 여행진행 및 고객 관리</td>
                <td>여권 번호, 여권발행국, 여권만료일</td>
                <td>예약 확정 후 3개월까지</td>
              </tr>
            </table>
            <p>고유식별정보 제공 동의를 거부할 수 있으며, 거부시 서비스 이용이 제한됩니다.</p>
                <button onclick="confirmConsent('termsModal3', 'identificationConsent')">확인</button>
            </div>
        </div>
        
        
        <div style="display:flex;align-item:center;justify-content:space-between;">
        <p class="consent">고유식별정보 수집 및 이전 동의</p>
            <button class="consent" onclick="showModal4()" style="padding: 2px 4px; margin-left: 60px; height: 34px;">필수</button>
            <div>
               <input type="checkbox" id="identificationTransferConsent" onchange="checkConsent()">            
            </div>
       </div>
       <div id="termsModal4" class="modal">
        <div class="modal-content">
                <span class="close">&times;</span>
                <table>
              <thead>
                <tr>
                  <th>수집목적</th>
                  <th>수집항목</th>
                  <th>보유기간</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>상품/서비스의 예약 또는 배송 업무 처리 및 고객상담/해피콜, 맞춤형 컨텐츠 및 서비스 제공</td>
                  <td>여권번호, 여권발행국, 여권만료일</td>
                  <td>회원탈퇴시까지(단, 관계 법령에 따름)</td>
                </tr>
                <tr>
                  <td>여행자 정보 등록 및 관리</td>
                  <td>여권번호, 여권발행국, 여권만료일</td>
                  <td>회원탈퇴 혹은 여행자정보 삭제시까지</td>
                </tr>
              </tbody>
            </table>

            <button onclick="confirmConsent('termsModal4', 'identificationTransferConsent')">확인</button>
            </div>
        </div>
       
        <div class="infocheck" style="border: 2px solid grey";>
              "위 약관을 확인하였으며 회원 본인은 약관 및 결제에 동의합니다"<input type="checkbox" id="infocheckbox" onclick="checkConsent()"/>
        </div>

        <div>
          <h5 onclick="toggleCancellationPolicy()">예약 취소 규정 보기/숨기기</h5><hr>
            <div id="cancellationPolicy" style="display:none;">
              <p>▶여행자의 여행계약 해제 요청 시 여행약관에 의거하여 취소료가 부과됩니다◀</p>
              <p>제16조(여행출발 전 계약해제)</p>
              <p>여행개시 30일전까지( ～30) 통보 시 - 계약금 환급</p>
              <p>여행개시 20일전까지(29～20) 통보 시 - 여행요금의 10% 배상</p>
              <p>여행개시 10일전까지(19～10) 통보 시 - 여행요금의 15% 배상</p>
              <p>여행개시 8일전까지( 9～ 8) 통보 시 - 여행요금의 20% 배상</p>
              <p>여행개시 1일전까지( 7～ 1) 통보 시 - 여행요금의 30% 배상</p>
              <p>여행 당일 통보 시 - 여행요금의 50% 배상</p>
              <p>▶선발권 관련 규정안내</p>
              <p>① 선발권 조건의 특가로 진행되는 상품가로, 발권 시점은 별도 안내드립니다.</p>
              <p>② 선발권 시점 이후 항공 요금 상승시 상품 가격이 인상될 수 있습니다.</p>
              <p>③ 항공사 규정상 발권 후에는 이름 변경, 여정 변경 시 별도비용이 추가됩니다.</p>
              <p>(1석당 13만원)</p>
              <p>④ 항공발권 후 취소시 약관시점 이전에 취소 될 경우라도 항공 발권 취소차지가 별도로 부과됩니다.</p>
              <p>(예: 토/일/월 출발 상품은 금요일 업무종료 이후 취소시 당일 취소로 간주됩니다.)</p>
              <p>▶ 여행 취소 접수 안내</p>
              <p>취소는 업무시간 내 접수 시 확인 및 적용이 가능합니다.</p>
              <p>취소수수료 발생일은 영업일 기준으로 산정됩니다.(주말,공휴일 제외)</p>
              <p>업무시간 외 접수한 경우에는 익일(영업일이 아닌 경우 다음 영업일)에 접수한 것으로 간주됩니다.</p>
              <p>업무시간은 월-금 09:00~18:00 (주말,공휴일 제외)</p>
              <p>(예: 토/일/월 출발 상품은 금요일 업무종료 이후 취소시 당일 취소로 간주됩니다.)</p><hr>
            </div>
        </div>
           <div style="display: flex; align-items: center; margin-bottom: 30px;">
	           <label style="display: flex; align-items: center;">
	             <input type="radio" name="payment" value="card" style="width: 50px; margin-top: 10px; margin-left: 20px;">
	             <img src="<%=request.getContextPath()%>/img/SYPAY/cardpayment.png" style="width: 50px; height: 50px;">
	             <h5>카드결제</h5>
             </label>
         </div>
         <div style="display: flex; align-items: center;">
        	 <label style="display: flex; align-items: center;">
	             <input type="radio" name="payment" value="kakaopay" style="width: 50px; margin-top: 10px; margin-left: 20px;">
	             <img src="<%=request.getContextPath()%>/img/SYPAY/payment_icon_yellow_small.png" style="width: 50px;">
	             <h5>카카오페이</h5>
             </label>
         </div>
              <div>
                <button id="paymentButton" onclick="paymentButton()" style="margin-top: 35px; margin-left: 250px; width: 100px;">결제하기</button>
              </div>
      </div>
</section>
  <style>
    body {
      font-family: Arial, sans-serif;
    }

    form {
      max-width: 400px;
      margin: 20px auto;
    }

    label {
      display: block;
      margin-bottom: 8px;
    }

    input, select {
      width: 100%;
      padding: 8px;
      margin-bottom: 16px;
      box-sizing: border-box;
    }

    .flex-containerbox {
      display: flex;
      justify-content: space-between;
      gap: 16px;
    }

    button {
      background-color: #51abf3;
      color: white;
      padding: 10px 15px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    button:hover {
      background-color: #45a049;
    }
    .modal {
        display: none;
        position: fixed;
        z-index: 9999;
        padding-top: 15%; /* 수직 위치를 조절합니다 */
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgb(0,0,0);
        background-color: rgba(0,0,0,0.4);
    }

    .modal-content {
        background-color: #fefefe;
        margin: auto; /* 추가 */
        padding: 20px;
        border: 1px solid #888;
        width: 50%; /* 가로 너비를 조절합니다 */
    }
  </style>

 <script>
 function checkConsent() {
	    let personalinfo = document.getElementById("personalInfoConsent");
	    let infoprovide = document.getElementById("infoProvidingConsent");
	    let identifiinfo = document.getElementById("identificationConsent");
	    let identifiinfotrans = document.getElementById("identificationTransferConsent");

	    let infocheckbox = document.getElementById("infocheckbox");

	    // infocheckbox 체크 시, 다른 체크박스들도 모두 체크
	    infocheckbox.addEventListener('change', function() {
	        personalinfo.checked = this.checked;
	        infoprovide.checked = this.checked;
	        identifiinfo.checked = this.checked;
	        identifiinfotrans.checked = this.checked;
	    });

	    // 다른 체크박스들이 모두 체크될 때 infocheckbox도 체크
	    let checkboxes = [personalinfo, infoprovide, identifiinfo, identifiinfotrans];
	    checkboxes.forEach(function(checkbox) {
	        checkbox.addEventListener('change', function() {
	            infocheckbox.checked = checkboxes.every(item => item.checked);
	        });
	    });
	}

    function showModal() {
        var modal = document.getElementById("termsModal");
        modal.style.display = "block";
    }

    function showModal2() {
        var modal = document.getElementById("termsModal2");
        modal.style.display = "block";
    }

    function showModal3() {
        var modal = document.getElementById("termsModal3");
        modal.style.display = "block";
    }

    function showModal4() {
        var modal = document.getElementById("termsModal4");
        modal.style.display = "block";
    }

    function confirmConsent(target, checkboxId) {
        alert("약관에 동의했습니다.");
        var modal = document.getElementById(target);
        modal.style.display = "none";
        var checkbox = document.getElementById(checkboxId);
        checkbox.checked = true;
        checkConsent();
    }

    document.getElementById("paymentButton").addEventListener("click", function() {
        var infocheckbox = document.getElementById("infocheckbox");
        if (!infocheckbox.checked) {
            alert("약관을 모두 동의해야 합니다.");
        }
    });

    function toggleCancellationPolicy() {
        var policy = document.getElementById("cancellationPolicy");
        if (policy.style.display === "none") {
            policy.style.display = "block";
        } else {
            policy.style.display = "none";
        }
    }

    window.onload = function() {
        var span = document.getElementsByClassName("close")[0];
        span.onclick = function() {
            var modal = document.getElementById("termsModal");
            modal.style.display = "none";
        }

        window.onclick = function(event) {
            var modal = document.getElementById("termsModal");
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    }
</script>

<%@ include file="/views/common/footer.jsp"%>
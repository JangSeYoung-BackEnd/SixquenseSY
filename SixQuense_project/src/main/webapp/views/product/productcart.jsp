<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<body>
    <div style="display: flex;margin-top:170px;">
    <section class="set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
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
    <section class="col-lg-7">
        <div class="container">
            <title>장바구니</title>
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
              <div class="row">
              <div class="col-lg-12">
                <div class="shoping__cart__table">
                  <table>
                    <thead>
                      <tr>
                        <th class="shoping__product">상품정보</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                        <th></th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>
                          <div class="shoping__cart__item">
                            <img src="img/america/캐나다.png" alt="">
                            <h2>패키지 제목</h2>
                          </div>
                        </td>
                        <td class="shoping__cart__price">
                          $55.00
                        </td>
                        
                        <td class="shoping__cart__total">
                          $110.00
                        </td>
                        <td class="shoping__cart__item__close" onclick="removeRow(this)">
                          <span class="">✖</span>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            <script>
              function removeRow(element) {
                var row = element.parentNode;
                while (row.tagName !== "TR") {
                  row = row.parentNode;
                }
                row.parentNode.removeChild(row);
              }
            </script>
            <div class="row">
                <div class="col-lg-12">  
                </div>
                <div class="form-container">
                <form>
                    <h2>예약자 정보 입력</h2>
                    <label for="name">한글 이름:</label>
                    <input type="text" id="name" name="name" required>
                  
                    <div class="flex-container">
                      <div>
                        <label for="englishFirstName">영문 이름:</label>
                        <input type="text" id="englishFirstName" name="englishFirstName" required>
                      </div>
                      <div>
                        <label for="englishLastName">영문 성:</label>
                        <input type="text" id="englishLastName" name="englishLastName" required>
                      </div>
                    </div>
                  
                    <div class="flex-container">
                      <div>
                        <label for="birthDate">생년월일:</label>
                        <input type="date" id="birthDate" name="birthDate" required>
                      </div>
                    </div>
                    <label for="gender">성별:</label>
                    <select id="gender" name="gender" required>
                      <option value="" disabled selected>성별 선택</option>
                      <option value="male">남성</option>
                      <option value="female">여성</option>
                    </select>
                    <button type="submit">정보 제출</button>
                  </form>
                  
                  <style>
                    body {
                        font-family: Arial, sans-serif;
                    }
                
                    form {
                        max-width: 600px;
                        margin: 20px 0 20px 500px;
                        padding: 0 20px;
                        box-sizing: border-box;
                        background-color: #f5f5f5;
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
                
                    .flex-container {
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
                    .form-container{
                        display: flex;
                        width:100%;
                        justify-content: space-between;
                    }
                </style>
                <form>
                    <h2>여행자 정보 입력</h2>
                    <label for="name">한글 이름:</label>
                    <input type="text" id="name" name="name" required>
                  
                    <div class="flex-container">
                      <div>
                        <label for="englishFirstName">영문 이름:</label>
                        <input type="text" id="englishFirstName" name="englishFirstName" required>
                      </div>
                      <div>
                        <label for="englishLastName">영문 성:</label>
                        <input type="text" id="englishLastName" name="englishLastName" required>
                      </div>
                    </div>
                  
                    <div class="flex-container">
                      <div>
                        <label for="birthDate">생년월일:</label>
                        <input type="date" id="birthDate" name="birthDate" required>
                      </div>
                    </div>
                    <label for="gender">성별:</label>
                    <select id="gender" name="gender" required>
                      <option value="" disabled selected>성별 선택</option>
                      <option value="male">남성</option>
                      <option value="female">여성</option>
                    </select>
                    <button type="submit">정보 제출</button>
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
        
            .flex-container {
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
        </style>
    </div>    
    </section>
    <div class="col-lg-2" style="border: 2px solid grey; padding: 22px 24px; width: 340px;">
        <h3>결제 정보</h3>
        <hr>
        <div>
          <h5>주문 금액</h5>
          <h4 style="background-color: #4caf50; padding: 5px; color: white;">총 결제 금액 1,179,000원</h4>
          <h3>약관 안내</h3>
          <hr>
          <div>
            개인정보 수집 및 이용동의(필수)<br>
            개인정보 제공 동의(필수)<br>
            고유식별정보 제공 동의(필수)<br>
            고유식별정보 수집 및 이전 동의(필수)
            <input type="text" placeholder="위 약관을 확인하였으며, 회원 본인은 약관 및 결제에 동의합니다">
            <div>
              예약 취소 규정
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
              <p>(예: 토/일/월 출발 상품은 금요일 업무종료 이후 취소시 당일 취소로 간주됩니다.)</p>
            </div>
          </div>
          <div>
          <button id="paymentButton">결제하기</button>
        </div>
        </div>
      </div>
    </div>
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

    .flex-container {
      display: flex;
      justify-content: space-between;
      gap: 16px;
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
  </style>

  <script>
    document.addEventListener('DOMContentLoaded', function () {
      const termsCheckbox = document.getElementById('termsCheckbox');
      const paymentButton = document.getElementById('paymentButton');

      termsCheckbox.addEventListener('change', function () {
        paymentButton.disabled = !termsCheckbox.checked;
      });

      paymentButton.addEventListener('click', function () {
        // 여기에서 결제 처리를 수행할 수 있습니다.
        alert('결제가 완료되었습니다.');
      });
    });
  </script>
</body>
<%@ include file="/views/common/footer.jsp"%>
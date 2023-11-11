<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<style>
    .contury{
        /* border:1px solid black; */
        font-size: 13px;
    }
    .continent>div{
        margin: 13px;
        font-weight: bolder;
    }
    .container-input{
        display: flex;
        flex-direction: column;
        align-items: center;
    }
     .container>div{
        /* border: 1px solid black; */
     }
     .container div .contury>div{
        margin: 10px;
     }
     .file-btn{
        display: flex;
        align-items: center;
        justify-content: center;
        background-color: rgb(202, 202, 202);
        margin: 10px;
        height: 300px;
     }
     .continent div, .contury div {
        cursor: pointer;
        transition: background-color 0.3s, color 0.3s;
    }

    .continent div:hover, .contury div:hover {
        background-color: green;
        color: white;
    }
</style>
<body>
<section>
    <div class="container">
        <div class="section-title product__discount__title">
            <h2>동행 글쓰기</h2>
        </div>
        <div class="row">
            <div class="col-lg-2 col-md-7 continent">
                <div>동남아·대만</div>
                <div>일본</div>
                <div>유럽</div>
                <div>미주·캐나다</div>
            </div>
            <div class="col-lg-10 col-md-7">
                <div class="row contury">
                    <div>방콕·파타야</div>
                    <div>호치민·나트랑·달랏</div>
                    <div>푸켓</div>
                    <div>코타카나발루</div>
                    <div>대만</div>
                    <div>보홀</div>
                    <div>싱가포르</div>
                    <div>세부·클락</div>
                    <div>보라카이</div>
                </div>
                <div class="row contury">
                    <div>후쿠오카</div>
                    <div>오사카·교토</div>
                    <div>도쿄</div>
                    <div>샷포로</div>
                    <div>오키나와</div>
                </div>
                <div class="row contury">
                    <div>영국</div>
                    <div>프랑스</div>
                    <div>이탈리아</div>
                    <div>스위스</div>
                    <div>스페인·포르투칼</div>
                </div>
                <div class="row contury">
                    <div>미서부</div>
                    <div>미동부</div>
                    <div>하와이</div>
                    <div>캐나다</div>
                    <div>호주</div>
                </div>
            </div>
        </div>
        <div class="row">
            <form action="">
                <div>
                    <input type="text" id="" name="" placeholder="제목을 입력하세요" style="width: 500px;">
                </div>
                <div>
                    <input type="text" id="" name="" placeholder="카카오톡 링크" style="width: 500px;">
                </div>
                <div class="file-btn" onclick="openFileDialog()">
                    <input type="file" accept="image/bmp,image/gif,image/jpg,image/jpeg,image/png,image/raw,image/tif,image/heif,image/heic,image/mp4,image/avi,image/mov,image/wmv,image/mkv,image/mpg,image/rm,image/asf,image/m4v,image/mpeg,image/mpg" style="display: none; margin: 0px; padding: 0px;">
                    <svg width="50" height="50" viewBox="0 0 50 50" fill="none" xmlns="http://www.w3.org/2000/svg" style="display: inline-block;">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M0 6.54397C0 2.92984 2.93584 0 6.55738 0H43.4426C47.0642 0 50 2.92983 50 6.54397V43.456C50 47.0702 47.0642 50 43.4426 50H6.55738C2.93584 50 0 47.0702 0 43.456V6.54397ZM6.55738 2.86299C4.52026 2.86299 2.86885 4.51102 2.86885 6.54397V43.456C2.86885 45.489 4.52026 47.137 6.55738 47.137H9.23315L32.1003 23.5656C34.6482 20.9392 38.8581 20.9052 41.4483 23.4901L47.1311 29.1613V6.54397C47.1311 4.51102 45.4797 2.86299 43.4426 2.86299H6.55738ZM43.4426 47.137H13.2262L34.1615 25.557C35.5947 24.0796 37.9627 24.0605 39.4197 25.5145L47.1311 33.2102V43.456C47.1311 45.489 45.4797 47.137 43.4426 47.137ZM11.5779 17.1268C11.5779 14.1056 14.032 11.6564 17.0594 11.6564C20.0868 11.6564 22.541 14.1056 22.541 17.1268C22.541 20.148 20.0868 22.5971 17.0594 22.5971C14.032 22.5971 11.5779 20.148 11.5779 17.1268ZM17.0594 8.79346C12.4476 8.79346 8.70902 12.5244 8.70902 17.1268C8.70902 21.7292 12.4476 25.4601 17.0594 25.4601C21.6712 25.4601 25.4098 21.7292 25.4098 17.1268C25.4098 12.5244 21.6712 8.79346 17.0594 8.79346Z" fill="#DBDBDB"></path>
                    </svg>
                    <p class="sc-9332fd40-1 besauD">배경사진을 선택해주세요</p>
                </div>
                <div>
                    <textarea id="" name="" placeholder="글을 작성해주세요" cols="150" rows="10"></textarea>
                </div>
                <div>
                    <input type="submit" id="" name="">
                </div>
            </form>
        </div>
    </div>
    <script>
        const continentRadio = document.getElementsByName("continent");

        // 라디오 버튼 변경 이벤트 핸들러 함수
        function handleRadioChange() {
            const selectedContinent = document.querySelector('input[name="continent"]:checked').value;
            const asiaContury = document.getElementById("aisa-contury");
            const japanContury = document.getElementById("japen-contury");
            const europeContury = document.getElementById("europe-contury");
            const americaContury = document.getElementById("america-contury");

            asiaContury.style.display = "none";
            japanContury.style.display = "none";
            europeContury.style.display = "none";
            americaContury.style.display = "none";

            if (selectedContinent === "동남아·대만") {
                asiaContury.style.display = "block";
            } else if (selectedContinent === "일본") {
                japanContury.style.display = "block";
            } else if (selectedContinent === "유럽") {
                europeContury.style.display = "block";
            } else if (selectedContinent === "미주·캐나다") {
                americaContury.style.display = "block";
            }
        }
        // 라디오 버튼에 이벤트 리스너 등록
        for (const radio of continentRadio) {
            radio.addEventListener("change", handleRadioChange);
        }
        document.addEventListener('DOMContentLoaded', function() {
        var openButton = document.getElementById('openProfilePopup');
        var profilePopup = document.getElementById('profilePopup');
        var closeButton = document.getElementById('closeProfilePopup');

        openButton.addEventListener('click', function() {
            profilePopup.style.display = 'block';
        });

        closeButton.addEventListener('click', function() {
            profilePopup.style.display = 'none';
        });
        });
        var isFilled = false;

        function toggleImage() {
            var button = document.getElementById('followButton');
            if (isFilled) {
                button.src = "/ogani-master/img/팔로우(빈거).png";
            } else {
                button.src = "/ogani-master/img/팔로우.png";
            }
            isFilled = !isFilled; // 이미지 상태를 토글
        }
        function openFileDialog() {
            const fileInput = document.querySelector('input[type=file]');
            fileInput.click();

            // 파일이 선택되었을 때 실행될 코드
            fileInput.addEventListener('change', function () {
            const selectedFiles = fileInput.files;
            console.log('Selected Files:', selectedFiles);

            // 추가로 원하는 동작을 여기에 작성
            });
        }
    </script>
</section>
</body>
<%@ include file="/views/common/footer.jsp"%>
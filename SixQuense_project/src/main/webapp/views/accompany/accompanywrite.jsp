<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<style>
	img{
		border-radius:0%;
	}
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
    .choice-contury{
        background-color: #28a745;
        font-weight: bolder;
        color: white;
    }
</style>
<body>
<section>
    <div class="container" style="margin-top: 200px;">
        <div class="section-title product__discount__title">
            <h2>동행 글쓰기</h2>
        </div>
        <div class="row" style="border: solid gainsboro; margin-bottom: 10px;">
            <div class="col-lg-2 col-md-7 continent">
                <div class="con-1">동남아·대만</div>
                <div class="con-2">일본</div>
                <div class="con-3">유럽</div>
                <div class="con-4">미주·캐나다</div>
            </div>
            <div class="col-lg-10 col-md-7">
                <div class="row contury">
                    <div class="contury-1-1">방콕·파타야</div>
                    <div class="contury-1-2">호치민·나트랑·달랏</div>
                    <div class="contury-1-3">푸켓</div>
                    <div class="contury-1-4">코타카나발루</div>
                    <div class="contury-1-5">대만</div>
                    <div class="contury-1-6">보홀</div>
                    <div class="contury-1-7">싱가포르</div>
                    <div class="contury-1-8">세부·클락</div>
                    <div class="contury-1-9">보라카이</div>
                </div>
                <div class="row contury">
                    <div class="contury-2-1">후쿠오카</div>
                    <div class="contury-2-2">오사카·교토</div>
                    <div class="contury-2-3">도쿄</div>
                    <div class="contury-2-4">샷포로</div>
                    <div class="contury-2-5">오키나와</div>
                </div>
                <div class="row contury">
                    <div class="contury-3-1">영국</div>
                    <div class="contury-3-2">프랑스</div>
                    <div class="contury-3-3">이탈리아</div>
                    <div class="contury-3-4">스위스</div>
                    <div class="contury-3-5">스페인·포르투칼</div>
                </div>
                <div class="row contury">
                    <div class="contury-4-1">미서부</div>
                    <div class="contury-4-2">미동부</div>
                    <div class="contury-4-3">하와이</div>
                    <div class="contury-4-4">캐나다</div>
                    <div class="contury-4-5">호주</div>
                </div>
            </div>
        </div>
        <div class="row">
            <form action="<%=request.getContextPath()%>/accompnay/accompanywriteend.do?useId=<%=loginMember.getUserId() %>" method="post" enctype="multipart/form-data">
                <div>
                    <input type="text" id="accompany-title" name="accompany-title" placeholder="제목 : 여행지/날짜/제목내용 으로 작성해주세요" style="width: 700px; border:solid gainsboro; margin-bottom: 10px;"">
                </div>
                <div>
                    <input type="text" id="kakao-link" name="kakao-link" placeholder="카카오톡 링크 적어주세요!" style="width: 700px; border:solid gainsboro;">
                </div>
                    <input type="file" id="accompany-file" name="accompany-file" accept="image/bmp,image/gif,image/jpg,image/jpeg,image/png,image/raw,image/tif,image/heif,image/heic,image/mp4,image/avi,image/mov,image/wmv,image/mkv,image/mpg,image/rm,image/asf,image/m4v,image/mpeg,image/mpg" style="display: none; margin: 0px; padding: 0px;">
                <div class="col-lg-12 file-btn" onclick="openFileDialog()">
                    <svg class="" width="50" height="50" viewBox="0 0 50 50" fill="none" xmlns="http://www.w3.org/2000/svg" style="display: inline-block;">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M0 6.54397C0 2.92984 2.93584 0 6.55738 0H43.4426C47.0642 0 50 2.92983 50 6.54397V43.456C50 47.0702 47.0642 50 43.4426 50H6.55738C2.93584 50 0 47.0702 0 43.456V6.54397ZM6.55738 2.86299C4.52026 2.86299 2.86885 4.51102 2.86885 6.54397V43.456C2.86885 45.489 4.52026 47.137 6.55738 47.137H9.23315L32.1003 23.5656C34.6482 20.9392 38.8581 20.9052 41.4483 23.4901L47.1311 29.1613V6.54397C47.1311 4.51102 45.4797 2.86299 43.4426 2.86299H6.55738ZM43.4426 47.137H13.2262L34.1615 25.557C35.5947 24.0796 37.9627 24.0605 39.4197 25.5145L47.1311 33.2102V43.456C47.1311 45.489 45.4797 47.137 43.4426 47.137ZM11.5779 17.1268C11.5779 14.1056 14.032 11.6564 17.0594 11.6564C20.0868 11.6564 22.541 14.1056 22.541 17.1268C22.541 20.148 20.0868 22.5971 17.0594 22.5971C14.032 22.5971 11.5779 20.148 11.5779 17.1268ZM17.0594 8.79346C12.4476 8.79346 8.70902 12.5244 8.70902 17.1268C8.70902 21.7292 12.4476 25.4601 17.0594 25.4601C21.6712 25.4601 25.4098 21.7292 25.4098 17.1268C25.4098 12.5244 21.6712 8.79346 17.0594 8.79346Z" fill="#DBDBDB"></path>
                    </svg>
                    <span>배경사진을 선택해주세요</span>
                </div>
                <div>
                    <textarea id="accompany-content" name="accompany-content" placeholder="1. 현재 동행이 있나요?&#13;&#10;ex)혼자에에요/동행 1명이 있어요.&#13;&#10;&#13;&#10;2.어떤 동행을 찾고 있나요?&#13;&#10;ex)맛집 돌아다니는거 좋아하는 20대 여성/남성 동행 구해요!&#13;&#10;&#13;&#10;3. 원하는 여행코스가있다면 적어주세요!&#13;&#10;&#13;&#10;&#13;&#10;글을 작성해주세요(1000자이내)" cols="150" rows="20" maxlength="1000" wrap="on" style="border:solid gainsboro; resize: none;" ></textarea>
                </div>
                <div>
                    <input type="submit" class="btn-success" value="게시글 등록" style="border:0px; margin-left: 965px; height:32px;">
                    <input type="reset" class="btn-success" value="취소">
                </div>
            </form>
        </div>
    </div>
    <script>
        function openFileDialog() {
            const fileInput = document.querySelector('input[type=file]');
            fileInput.click();
            fileInput.addEventListener('change', function () {
            const selectedFiles = fileInput.files;
            });
        }
        const continent = document.querySelector('.continent');
        const conturyElements = document.querySelectorAll('[class^="contury-"]');

        conturyElements.forEach((element) => {
            element.addEventListener('click', function() {
                conturyElements.forEach((el) => {
                    $(el).removeClass("choice-contury");
                });
                $(element).addClass("choice-contury");
                if(element.className.includes("1-")){
                    $.each($(".continent>div"),(i,e)=>{
                        if(e.classList.contains('con-1')){
                           $(e).addClass("choice-contury");
                        }else{
                            $(e).removeClass("choice-contury");
                        }
                    });
                }else if(element.className.includes("2-")){
                    $.each($(".continent>div"),(i,e)=>{
                        if(e.classList.contains('con-2')){
                            $(e).addClass("choice-contury");
                        }else{
                            $(e).removeClass("choice-contury");
                        }
                    });
                }else if(element.className.includes("3-")){
                    $.each($(".continent>div"),(i,e)=>{
                        if(e.classList.contains('con-3')){
                            $(e).addClass("choice-contury");
                        }else{
                            $(e).removeClass("choice-contury");
                        }
                    });
                }else if(element.className.includes("4-")){
                    $.each($(".continent>div"),(i,e)=>{
                        if(e.classList.contains('con-4')){
                            $(e).addClass("choice-contury");
                        }else{
                            $(e).removeClass("choice-contury");
                        }
                    });
                }
            });
        });
        //클릭해서 바로 보내는 개념이 아닌, AJAX로 모든 등록 게시글 파일 보내는 방식으로 수정
		document.addEventListener('DOMContentLoaded', function () {
		  	const conturyDivs = document.querySelectorAll('.contury div');
		  	conturyDivs.forEach(function (div) {
		    div.addEventListener('click', function () {
		      const clickedText = div.innerText;
		      console.log('Clicked Text:', clickedText);
		      // XMLHttpRequest를 생성
		      const nationdata = new XMLHttpRequest();
		      // POST 요청을 설정하고 서버의 URL을 지정
		      nationdata.open('POST', '<%=request.getContextPath()%>/accompnay/accompanywriteend.do', true);
		      // 요청 헤더 설정
		      nationdata.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		      // 서버로 보낼 데이터 설정
		      const data = 'clickedText=' + encodeURIComponent(clickedText);
		      // 요청을 전송
		      nationdata.send(data);
		    });
		  });
		});
		$("#accompany-file").change(e => {
		    $.each(e.target.files, (i, f) => {
		        const filereader = new FileReader();
		        filereader.readAsDataURL(f);
		        filereader.onload = (e) => {
		            console.log(e.target.result);
		            $(".file-btn").attr("display", "none");
		            const path = e.target.result;
		            const img = $("<img>").attr({ "src": path, "width": "1085px", "height": "300px" }).on("click",openFileDialog);
		            $(".file-btn").html(img);
		        }
		    });
		});
    </script>
</section>
</body>
<%@ include file="/views/common/footer.jsp"%>
<%@page import="com.web.member.dto.MemberToAcompanyWH"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.web.accompany.model.dto.AccompanyOffer"%>
<%@page import="com.web.accompany.model.dto.AccompanyComment"%>
<%@page import="java.util.List"%>
<%@page import="com.web.accompany.model.dto.AccompanyDTO"%>
<%@page import="com.web.accompany.model.dto.Continent"%>
<%@page import="com.web.accompany.model.dto.Coordinate"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>


<%
   
   AccompanyDTO b =(AccompanyDTO)request.getAttribute("board");      
   List <AccompanyOffer> offer =(List<AccompanyOffer>)request.getAttribute("offer");
   
   double latitude= b.getCoordinate().getLatitude();
   double longitude = b.getCoordinate().getLongitude();
   List<AccompanyComment> comments= (List<AccompanyComment>) request.getAttribute("comments");
   String acUserId= loginMember.getUserId();
   int acompanyBNo= b.getAccompanyNo(); 
   
   
   
%>



<style>
.accept-button,
    .decline-button {
        margin-left: 10px;
        cursor: pointer;
        padding: 5px 10px; /* Adjust padding to change button size */
        font-size: 14px; /* Adjust font size */
        /* Add additional styling as needed */
    }
    .blog__sidebar__recent {
        border: solid gainsboro;
    }

    .blog__sidebar__recent > div {
        display: flex;
        flex-direction: column;
    }

    .blog__sidebar__recent__item {
        display: flex;
        margin-bottom: 10px;
    }

    .blog__sidebar__recent__item__pic img {
        height: 60px;
        width: 60px;
        margin-top: 10px;
    }

    .blog__sidebar__recent__item__text {
        margin-left: 10px;
    }
div#googleMap img{
   border-radius:0;
}
#likeButtonContainer {
   text-align: center; /* 이 부분을 추가하여 내용을 가운데로 정렬합니다. */
}

.checkbox-group label {
   display: block;
   margin-bottom: 30px;
}

textarea {
   width: 100%;
   height: 30px;
   margin-bottom: 10px;
}

.popup {
   display: none;
   position: fixed;
   z-index: 9999;
   left: 0;
   top: 0;
   width: 100%;
   height: 100%;
   overflow: auto;
   background-color: rgb(0, 0, 0);
   background-color: rgba(0, 0, 0, 0.4);
   padding-top: 60px;
   cursor: pointer
}

.popup-content {
   background-color: #fefefe;
   margin: 5% auto;
   padding: 20px;
   border: 1px solid #888;
   width: 80%;
   max-width: 600px;
}

.close {
   color: #aaa;
   float: right;
   font-size: 28px;
   font-weight: bold;
}

.close:hover, .close:focus {
   color: black;
   text-decoration: none;
   cursor: pointer;
}

button {
   padding: 10px 20px;
   font-size: 16px;
}

.gotoprofile {
   cursor: pointer;
}

.comments {
   max-height: 300px;
   overflow-y: auto;
   border: 1px solid #ddd;
   padding: 10px;
   margin-bottom: 10px;
}

.comment-form {
   display: flex;
   align-items: center;
}

#commentText {
   flex-grow: 1;
   padding: 5px;
   border-radius: 5px;
   border: 1px solid #ccc;
   margin-right: 10px;
}

button {
   padding: 5px 10px;
   background-color: #3ec219;
   color: #fff;
   border: none;
   border-radius: 5px;
   cursor: pointer;
}

button:hover {
   background-color: #07950cec;
   }
#commentText{
   width :640px
}
table#tbl-comment tr.level2 td:first-of-type {
   padding-left: 100px;
}

table#tbl-comment tr.level2 sub.comment-writer {
   color: #8e8eff;
   font-size: 14px
}

table#tbl-comment tr.level2 sub.comment-date {
   color: #ff9c8a;
   font-size: 10px
}
div.subcategory>div{
   margin: 0px 5px 0px 5px;
}
div.subcategory>button{
   margin: 2px 5px 0px 5px;
   height:20px;
   width:40px;
   font-size:10px;
}

</style>

<script>
   function myMap(){
      /* var board = ${request.getAttribute("board")};
      console.log(latitude,longitude)
         
         var coordinate = board.coordinate; */
      var latitude1 =  <%= latitude %>;
       var longitude1 = <%= longitude %>;
       console.log(latitude1,longitude1)
        var mapOptions = { 
               center:new google.maps.LatLng(latitude1, longitude1),
               zoom:5
         };
    
         var map = new google.maps.Map( 
                document.getElementById("googleMap") , mapOptions );
         
   }
   
</script> 



<body>
<<<<<<< HEAD
   <!-- Blog Details Section Begin -->
   <section class="blog-details spad" style="padding-top:250px;">
      <div class="container">
         <div class="row">
            <div class="col-lg-3 col-md-5 order-md-1 order-2" >
               <div class="blog__sidebar" style="padding-top: 0px;">
               <%if(loginMember!=null){ %>
                  <div class="col-lg-12 blog__details__author">
                     <div class="row" style="margin-bottom:0px; border:solid gainsboro; width: 290px; height: 80px;" >
                        <div class="blog__details__author__pic col-sm-2">
                        <img src="<%=request.getContextPath() %>/img/profile/profile_default.png" alt="글쓴이 사진"  style="height: 60px; width: 60px; margin-top: 10px;">
                        
                        </div>
                        <div class="blog__details__author__text col-sm-9" style="padding-top: 10px; padding-right: 0px; display: flex; align-items: center; padding-bottom:10px">
                           <div class="cols">
                              <div class="gotoprofile,item col-sm-8" id="openProfilePopup">
                              <%= b.getUserId()%>
                              </div>
                              <div class="item col-sm-4">
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <%} %>
                  <div class="row" >
                     <div class="blog__sidebar__item">
                        <%MemberToAcompanyWH member= (MemberToAcompanyWH)request.getAttribute("member");
                        //로그인을 했다면 ! 버튼 생성 
                        if(loginMember!=null){ 
                           /* 로그인을 하고 로그인멤버가 글쓴이가 아니면 ~ 버튼 생성  */
                           if(loginMember.getUserNo()!= b.getMemberNo()){
                        	  /* 글의 모집이 마감되었고  */
                        	   if(b.getAccompanyStatus().equals("acRecruiting")){
		                              if(member!=null &&  member.getAcOffer().equals("대기중")) {%>
		                                 <div class="col-sm-12">
		                                 <button id="cancelButton" onclick="deleteAccompany()" style="margin:10px 0 10px 0; width: 290px; ">동행신청 취소하기</button>            
		                                 <button id="confirmButton" onclick="confirmAccompany()" style="margin:10px 0 10px 0; width: 290px; display: none;">동행신청하기</button>
		                              <%}else{ %>
		                                 <div class="col-sm-12">
		                                 <button id="confirmButton" onclick="confirmAccompany()" style="margin:10px 0 10px 0; width: 290px;">동행신청하기</button>
		                                 <button id="cancelButton" onclick="deleteAccompany()" style="margin:10px 0 10px 0; width: 290px; display: none;">동행신청 취소하기</button>
		                              <%}
                        	   }else{ %>
                        		   <div class="col-sm-12">
		                                 <button id="acClosebtn" onclick="acClosebtn()" style="margin:10px 0 10px 0; width: 290px;"  >신청이 마감되었습니다.</button>
                        	  <% }
                           }else{%>
                           <!-- 글쓴이라면 나의 글 화인하기  -->
                              <div class="col-sm-12">
                              <button style="margin:10px 0 10px 0; width: 290px;"> <a href="<%=request.getContextPath() %>/mywrite.do">나의 글 확인하기</a></button>
                           <%}
                        }%>
                        </div>
                        <div class="blog__sidebar__recent col-sm-12" style="border:solid gainsboro; margin-left: 15px; width: 289.8px;">
                           <div style="margin: 5px 0px 5px 0px;">
                              <%if (offer.isEmpty()){ %>
                                 <h5>신청자가 없습니다.</h5>
                              <%}else{ %>
                                 <h5>동행신청한 목록</h5>
                              
                           </div>
                           <div>
                           <%for( int i =0; i < offer.size(); i++){ %>
                                 <div style ="display: flex;">
                                    <div >
                                       <img src="<%=request.getContextPath() %>/img/profile/<%=offer.get(i).getOfferRename() %>" alt="동행 신청자 사진"  style="height: 60px; width: 60px; margin-top: 10px; margin-botton : 10px;">
                                    </div>
                                    <div >
                                       <div style ="margin: 5px; margin-bottom: 0px; margin-left: 10px; ">
                                          <h4 style ="margin-bottom: 0px"> <%=offer.get(i).getUserId() %></h4>
                                           
                                       </div>
                                    <!--  로그인회원이랑 작성자가 동일한 인물이라면 버튼을 보이게 하기     -->
                                       <%if(loginMember.getUserNo() == b.getMemberNo()){ 
                                    	   if(b.getAccompanyStatus().equals("acRecruiting")){
                                          /* offer status가 대기중이라면 ? */
                                           if(offer.get(i).getAccompanyOfferStatus().equals("대기중")){%>
                                             <div style="margin-bottom: 5px; margin-left: 20px; ">
                                                <button class="accept-button" data-member-no="<%=offer.get(i).getMemberNo() %>" onclick="acceptOffer(this)" >수락</button>
                                                <button class="decline-button" data-member-no="<%=offer.get(i).getMemberNo() %>" onclick="declineOffer(this)">거절</button>
                                             </div>
                                          <%}else if(offer.get(i).getAccompanyOfferStatus().equals("decline")){
                                             /* offer status가 decline이라면 ? */%>
                                             <div style="margin-bottom: 5px; margin-left: 20px; ">
                                                <button class="accept-button"  data-member-no="<%=offer.get(i).getMemberNo() %>" onclick="acceptOffer(this)" >수락</button>
                                                <span>거절중</span>
                                             </div>
                                          <%}else{
                                             /* offer status가 accept 수락한 상태라면 ? */%>
                                             <div style="margin-bottom: 5px; margin-left: 20px; ">
                                                <span>수락중</span>
                                                <button class="decline-button" data-member-no="<%=offer.get(i).getMemberNo() %>" onclick="declineOffer(this)">거절</button>
                                             </div>
                                          <%}
                                    	 }
                                       } %>
                                    </div>
                                 </div>
                              <%}
                           }%>                           
                              </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="col-lg-8 col-md-7 order-md-1 order-1" style="margin-bottom:0px; margin-bottom: 0px; margin-left: 30px;">
               <div style="padding-top:10px;">
                  <span style="font-size: larger; font-weight: bolder;" ><%=b.getAccompanyTitle() %></span> 
                  
                  <%
                  if(loginMember.getUserNo()== b.getMemberNo()){
                     if(b.getAccompanyStatus().equals("acClose")) {%>
                     <select id = "acSelect" onchange ="accompanySelect();">
                        <option name="acSelect" value ="acRecruiting">모집중</option>
                        <option name="acSelect" value= "acClose" selected>마감</option>
                     </select>
                        <%}else{ %>
                     <select id = "acSelect" onchange ="accompanySelect();">
                        <option name="acSelect" value ="acRecruiting" selected>모집중</option>
                        <option name="acSelect" value= "acClose" >마감</option>
                     </select>
                  <%}
               }%>
               </div>
               <div class="blog__details__text"  style="padding-top:20px;">
                  <div style="display:flex;">
                  <!-- 댓글처럼 따로 데이터를 불러서 사진 파일 들고오기  -->
                     <img src="<%=request.getContextPath() %>/upload/accompany/<%=b.getRenameFilename() %>" alt="여행사진"  style="width:450px; height: 250px; border-radius:0%;">
                     <div id="googleMap" style=" width: 250px; height: 250px;  border-radius:0% ;" > 지도 자리</div>
                  </div>
               </div>
               <div>
                  <p><%=b.getAccompanyContent() %></p>
               </div>
            <div class="subcategory" style="display: flex;">
                   <div><%=b.getAccompanyDate()%></div>
                   <div>조회수 <%=b.getAccompanyReadCount()%></div>
                        <%if(loginMember.getUserNo()==b.getMemberNo()){%>
                           <button onclick="location.assign('<%=request.getContextPath()%>/accompany/accompanymodify.do?memberNo=<%=b.getMemberNo()%>&accompanyNo=<%=b.getAccompanyNo()%>');" role="modify">수정</button>
                           <button onclick="deleteaccompanyBoard();" role="delete">삭제</button>
                     <%}%>
                </div>
               <div class="comment-section">
                  
                     <div class="comments" id="comments"> 
                     <%if(!comments.isEmpty()){ %>
                        <table id="tbl-comment">
                        <%for(AccompanyComment ac:comments){ 
                           if (ac.getAccompanyComtLevel() == 1) {
                        %>
                           <tr class="level1">
                              <td style="width:600px">
                                 <sub class="comment-writer"><%=ac.getUserId() %></sub>
                                 <sub class="comment-date"><%=ac.getAccompanyComtDate() %></sub>
                                 <br>
                                 <%=ac.getAccompanyComtContent() %>
                              </td>
                              <td>
                                 <button class="btn-reply" value="<%=ac.getAccompanyComtNo()%>">답글</button>
                                 <%if(ac.getUserId().equals(loginMember.getUserId())){ %>
                                 <button class="btn-delete" onclick="deleteComment(<%=ac.getAccompanyComtNo()%>)" value="<%=ac.getAccompanyComtNo()%>">삭제</button>
                                 <%} %>
                              </td>
                           </tr>
                           <%}else{ %>
                           <tr class="level2">
                              <td>
                                 <sub ><%=ac.getUserId() %></sub>
                                 <sub><%=ac.getAccompanyComtDate() %></sub>
                                 <br>
                                 <%=ac.getAccompanyComtContent() %>
                              </td>
                              <td>
                                 <button class="btn-delete" onclick="deleteComment(<%=ac.getAccompanyComtNo()%>)" value="<%=ac.getAccompanyComtNo()%>" style = "margin-left: 55px;">삭제</button>
                              
                              </td>
                           </tr>
                           <%} 
                        }%>
                        </table>
                        <%}%>
                     </div>
                  
                  <div class="comment-editor">
                  <form action = "<%=request.getContextPath() %>/accompany/insertaccompanycomment.do" method="post">
                     <input type="hidden" name="userNo" value="<%=loginMember.getUserNo()%>">
                     <input type="hidden" name="accompanyNo" value="<%=b.getAccompanyNo()%>">
                     <input type="hidden" name="level" value="1">
                     <input type="hidden" name="writer" value="<%=loginMember!=null? loginMember.getUserId():""%>">
                     <input type="hidden" name="accompanyCommentRef" value="0">
                     <input type="text" id="commentText" name="content" placeholder="댓글을 입력하세요" style="width:620px">
                     <button type="submit" id="btn-insert">댓글 추가</button>
                  </form>
                  </div>
               </div>
            </div>
         </div>
   </section>

       <script>
        $("#btn-insert").click(e=>{
          if(<%=loginMember==null%>){
             /* 로그인이 안됐을 때  */
             alert("로그인 후 이용할 수 있는 서비스입니다.");
           }
       }); 
       $(".btn-reply").click(e=>{
          /* alert("클릭"); */
          /* $(e.target).parents("tr").after($("<tr>").append($("<td>테스트</td>"))) */
          const $tr=$("<tr>");
         const $td=$("<td>").attr("colspan","2");
         const $form=$(".comment-editor>form").clone(); //form태그 복사 
         console.log($form);
         $form.find("input[name=level]").val("2");
         $form.find("textarea").attr({"rows":"1","cols":"40"});
         $form.find("button").removeAttr("id").addClass("btn-insert2");  //버튼의 아이디 속성은 지우고 클래스를 btn-insert2로 해라 
         $form.find("input[name=accompanyCommentRef]").val($(e.target).val()); //댓글관한 번호가 들어감. 
         $td.append($form);
         $tr.append($td);
         $(e.target).parents("tr").after($tr);
       })
       </script>          
<!------------------------프로필 Popup 부분 ------------------------>

   <div id="profilePopup" class="popup">
      <div class="popup-content">
         <span class="close" id="closeProfilePopup">&times;</span>
         <div>
            <div> 
               <img src="<%=request.getContextPath() %>/img/profile/profile_default.png" alt="프로필 사진"  style="display:flex; height: 150px; width: 150px; margin: auto;">
            </div>
               <div>
                  <div>
                     <h2><%=b.getUserId() %></h2>
                  </div>
                  <div id="profileInfo">
                  <!-- 프로필 정보를 추가하세요 -->
                     <p><%=b.getUserIntroduce() %></p>
                  </div>
               </div>
               <div style=" margin-left : 150px">
                  <button id="reportButton" onclick="openReportPopup()">신고하기</button>
                  <button id="blockButton">차단하기</button>
                  <button id="followButton">팔로우하기</button>
               </div>
         </div>
      </div>
   </div>
   
<!------------------------신고하기 Popup 부분 ------------------------>   

   <div id="reportPopup" class="popup">
      <div class="popup-content">
         <span class="close" onclick="closeReportPopup()">&times;</span>
         <h2>신고하기</h2>
         <p>신고 사유를 입력하세요:</p>
         <form action="<%=request.getContextPath() %>/report/report.do?no=<%=b.getAccompanyNo() %>&userNo=<%=loginMember.getUserNo() %>" method="post">
            <div class="checkbox-group">
               <label><input type="radio" value="illegal_advertising" name = "report"> 무단광고/홍보</label> 
               <label><input type="radio" value="abuse" name = "report"> 욕설 </label> 
               <label><input type="radio" value="offensive_language" name = "report"> 불쾌한 언어사용 및 컨테</label> 
               <label><input type="radio" value="text" name = "report"> 기타
                  <textarea id="reportReason" name = "reporttext"></textarea>
               </label>
            </div>
            <div><input type="submit" value="제출"></div>
         </form>
      </div>
   </div>
</body>

<!-- javaScript 부분   -->

   <script>
   
   /* 동행 신청 */
   
   document.addEventListener('DOMContentLoaded', function(){
      var openButton = document.getElementById('openProfilePopup');
      var profilePopup = document.getElementById('profilePopup');
      var closeButton = document.getElementById('closeProfilePopup');

      openButton.addEventListener('click', function(){
         profilePopup.style.display = 'block';
      });
      closeButton.addEventListener('click', function(){
         profilePopup.style.display = 'none';
      });
   });
      
      var isFilled = false;
      function toggleImage(){
         var button = document.getElementById('followButton');
         if (isFilled) {
            button.src = "<%=request.getContextPath()%>/img/accompany/팔로우(빈거).png";
         } else {
            button.src = "<%=request.getContextPath()%>/img/accompany/팔로우.png";
         }
         isFilled = !isFilled; 
      }
/* 신고하기  부분  */
      function openReportPopup(){
         var reportPopup = document.getElementById('reportPopup');
         reportPopup.style.display = 'block';
      }
      function closeReportPopup(){
         var reportPopup = document.getElementById('reportPopup');
         reportPopup.style.display = 'none';
      }
   </script>
   <script>
    //동행 모집중인지 여부 확인하는 ajax 
    function accompanySelect(){
       const acSelect  = document.getElementById("acSelect");
      const value = (acSelect.options[acSelect.selectedIndex].value);
      const boardNo = <%=acompanyBNo%>;
      
         $.ajax({
               url: "<%=request.getContextPath() %>/accompany/AccompanyResultAjax.do", 
               type: 'POST',
               data: { value: value,boardNo :boardNo}
           });
   };
   
   //회원이 동행신청하기 누르기 
   function confirmAccompany(){
      const confirmed=confirm("동행을 신청하시겠습니까?");
      const userNo=<%=loginMember.getUserNo() %>;
      const boardNo=<%=acompanyBNo%>;
      if(confirmed){
            alert("동행이 신청되었습니다!");
             $.ajax({
                     url: "<%=request.getContextPath() %>/accompay/AcommpanyApply.do", 
                     type: 'POST',
                     data: { userNo : userNo ,boardNo :boardNo},
                     success: function(response) {
                         window.open("<%=b.getOpenChattingLink()%>", "_blank");
                         $('#cancelButton').show();                         
                         $('#confirmButton').hide();
                     },
                     error: function(error) {
                        alert("동행 신청 중 오류가 발생했습니다.");
                     }
                 });
         }else{
            alert("동행 신청이 취소되었습니다.");
         }
       }
   
   /* 회원이 동행 신청하기누르고 다시 거절을 눌렀을 때  */
   function deleteAccompany(){
      const confirmed=confirm("동행 신청을 거절하시겠습니까?");
      const userNo=<%= loginMember.getUserNo() %>;
      const boardNo=<%=acompanyBNo%>;
      if(confirmed){
         alert("동행이 거절되었습니다!");
          $.ajax({
                  url:"<%=request.getContextPath() %>/accompay/deleteAccompany.do", 
                  type:'POST',
                  data:{ userNo : userNo ,boardNo :boardNo},
                  success: function(response) {
                      $('#cancelButton').hide();
                       $('#confirmButton').show();
                  },
                  error: function(error) {
                     alert("동행 거절 중 오류가 발생했습니다.");
                  }
              });
      }else{
         alert("동행 신청 거절이 취되었습니다.");
      }

   }
   
   /* 동행신청 수락버튼 누르기  */
   function acceptOffer(button) {
    const boardNo = <%=acompanyBNo%>;
    const memberNo = $(button).data("member-no");

    const confirmed = confirm("동행 신청을 수락하시겠습니까?");
    
    if (confirmed) {
        alert("동행이 수락되었습니다");
        $.ajax({
            url: "<%=request.getContextPath() %>/accompany/AcceptOfferajax.do", 
            type: 'POST',
            data: {boardNo: boardNo, memberNo: memberNo},
            success: function(response) {
               $(button).closest('div').replaceWith("<div style='margin-bottom: 5px; margin-left: 20px; '>" +
                        "<span>수락중</span>" +
                        "<button class='decline-button' data-member-no='" + memberNo + "' onclick='declineOffer(this)'>거절</button>" +
                     "</div>");
            },
            error: function() {
                alert("동행 신청 수락 중 오류가 발생했습니다.");
            }
        });
    } else {
        alert("동행 신청이 취소되었습니다.");
    }
}
      
   //글쓴이가 동행신청 목록에 
   function declineOffer(button) {
      const boardNo = <%=acompanyBNo%>;
      const memberNo = $(button).data("member-no");
      const confirmed = confirm("동행 신청을 거절하시겠습니까?");
       
       if (confirmed) {
           alert("동행 신청이 거절되었습니다.");       

           $.ajax({
               url: "<%=request.getContextPath() %>/accompay/Acommpanydecline.do", 
               type: 'POST',
               data: {boardNo: boardNo, memberNo: memberNo},
               success: function(response) {
                  $(button).closest('div').replaceWith("<div style='margin-bottom: 5px; margin-left: 20px; '>" +
                                    "<button class='accept-button' data-member-no='" + memberNo + "' onclick='acceptOffer(this)'>수락</button>" +
                                    "<span>거절중</span>" +
                                 "</div>");
        
               }, 
               error: function() {
                   alert("동행 신청 거절 중 오류가 발생했습니다.");
               }
           });
       } else {
           alert("동행 신청 거절이 취소되었습니다.");
       }
   }
    function deleteComment(commentNo) {
           var userNo = <%=loginMember.getUserNo()%>
           var boardNo = <%=b.getAccompanyNo()%>
           var confirmDelete = confirm("정말로 삭제하시겠습니까?");
           
           if (!confirmDelete) {
               return;
           }    
           window.location.href = "<%= request.getContextPath() %>/accompany/deletecomment.do?commentNo=" + commentNo + "&userNo=" + userNo + "&boardNo=" + boardNo;       }

    function deleteaccompanyBoard(){
         confirm("정말 삭제하시겠습니까?");
         if(confirm){
            location.assign("<%=request.getContextPath()%>/accompany/accompanydelete.do?memberNo=<%=b.getMemberNo()%>&accompanyNo=<%=b.getAccompanyNo()%>");
         }
      }
    function acClosebtn() {
        alert("신청이 마감되었습니다.");
    }
   </script>
 <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDxoCNyxIo2ayez96wuzbEDnutsv4MquEs&callback=myMap"></script> 
 
 <%@ include file="/views/common/footer.jsp"%>
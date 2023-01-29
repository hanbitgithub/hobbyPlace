<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.hp.lesson.model.vo.* , com.hp.tutor.model.vo.*,java.util.ArrayList, com.hp.common.model.vo.Attachment" %>         
    
<%
	ArrayList<Schedule> sList = (ArrayList<Schedule>)request.getAttribute("sList");
	Lesson l = (Lesson)request.getAttribute("l");
	ArrayList<Attachment> atList = (ArrayList<Attachment>)request.getAttribute("atList");
	ArrayList<Category> cList =(ArrayList<Category>)request.getAttribute("cList");

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<!-- include summernote css/js-->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  <script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
   
<!--주소입력 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>Insert title here</title>

<style>
        div{ box-sizing: border-box;}
       
        /*클래스 등록*/
	    
        .outer{  width: 1000px;}
        .outer>*{
            font-size: small;
        }
        #enroll-form input{
            margin: 5px 0px;
           
        } 
        #enroll-form input[type="radio"]{
            margin: 10px 5px;
           
        } 
        #enroll-form input[type="checkbox"]{
            margin: 10px 5px;
           
        } 
        .guide{
            float: right;
        }  
        .guidebtn{display: inline-block; width: 750px;} 
        
        .schedule{display: none; margin: 10pt;}
        .schedule+label{
            display: inline-block;
            cursor: pointer;
            padding: 3px 7px;
            text-align: center;
            font-size: 12px;
            border-radius: 5px;
            background-color: gray;
            color: white;
            
        }
        .schedule:checked+label{
            background-color: rgb(22, 160, 133);
        }
		.schedule+label:hover{
            background-color: rgb(22, 160, 133);
        }

        #form1, #form2{
        padding: 20px 50px;
        }
        

        /*운영시간*/
        .container * {
        box-sizing: border-box;
        padding: 0;
        margin: 0;
    }


    .container {
        margin: auto;
        padding: 10px;
    }

    ._table {
        border-collapse: collapse;
    }

    ._table :is(th, td) {/*:is 반복 줄임*/
        border: 1px solid rgba(210, 209, 209, 0.133);
        padding: 3px 5px;
    }

    .form_control {
        border: 1px solid rgba(15, 11, 11, 0.133);
        background-color: transparent;
        outline: none;
        padding: 8px 12px;
        font-family: 1.2rem;
        width: 100%;
        color:#333;
        transition: 0.3s ease-in-out;
    }

    .success {
        border-radius: 5px;
        background-color: rgb(22, 160, 133);
    }

    .danger {
        border-radius: 5px;
        background-color: rgb(99, 97, 97) !important;
    }

    .action_container {
        display: inline-flex;
    }

    .action_container>* {
        border: none;
        outline: none;
        color: rgb(247, 243, 243);
        text-decoration: none;
        display: inline-block;
        padding: 8px 10px;
        cursor: pointer;
        transition: 0.3s ease-in-out;
    }
    
        
    input[type="text"]{
        width: 300px;
        border: 1px solid rgb(202, 199, 199);
        height: 32px;
        border-radius: 5px;
    }

    input[type="number"]{
        width: 100px;
        border: 1px solid rgb(202, 199, 199);
        height: 32px;
        border-radius: 5px;
    }
    input[type="date"]{
        width: 150px;
        border: 1px solid rgb(202, 199, 199);
        height: 32px;
        border-radius: 5px;
    }

    input[type="time"]{
        width: 150px;
        border: 1px solid rgb(202, 199, 199);
        height: 32px;
        border-radius: 5px;
    }
    
   
    table{
        
        margin-left: 20px;
    }
    select{
    	 width: 150px;
        border: 1px solid rgb(202, 199, 199);
        height: 32px;
        border-radius: 5px;
  
    }
    
    /*클래스 등록*/
    input[type="text"]{
        width: 300px;
        border: 1px solid rgb(202, 199, 199);
        height: 32px;
        border-radius: 5px;
         }
         
        textarea{
        border: 1px solid rgb(202, 199, 199);
        border-radius: 5px;
        width: 700px;
        resize: none;
       
         }
         #refundPolicy{
            background-color: rgb(223, 222, 222);
         }
        table{
            margin-left: 20px;
        }


    
    </style>
</head>
<body>

<%@ include file="../common/tutorMenubar.jsp" %>

<div class="container">
     <br>
    <h5 style="font-weight: 900;">클래스 등록</h5>
    <div class="outer">

        <br>
     <!-- Nav tabs -->
  <ul class="nav nav-tabs nav-justified" role="tablist">
    <li class="nav-item">
      <a class="nav-link active form1" data-toggle="tab" href="#form1" style="font-weight: 600; font-size: 15px;">기본정보</a>
    </li>
    <li class="nav-item nav-justified">
      <a class="nav-link form2" data-toggle="tab" href="#form2" style="font-weight: 600; font-size: 15px;">상세정보</a>
    </li>
  </ul>

  <!-- Tab panes -->
  <form action="<%=contextPath %>/update.cl?no=<%=l.getClNo() %>" method="post" id="enroll-form" enctype="multipart/form-data">
	  	<div class="tab-content">
	  	  <div id="form1" class="container tab-pane active" ><br>
	        <span style="font-size: 14px; font-weight: 600;">기본정보</span>
	        <div class="guidebtn">
	        <button type="button" class="btn btn-secondary btn-sm guide">작성가이드</button>
	        </div>
	        <br><hr><br>
	       
	        <table id="basic">
	            <tr>
	                <th width=100>카테고리</th>
	                <td>
	                    <select name="category" id="category" class="ct" required onchange="changeCt();">
	                        <%for(Category c : cList){ %>
	                        <option value="<%=c.getCtNo()%>"><%=c.getCtName() %></option>
	                        <%} %>
	                    </select>
	                    
	                    <select name="dCategory" id="Dcategory" class="ct" required >
	                       
	
	                    </select>
	                </td>
	            </tr>
	            <script>
	            	$(function(){
	            		$("select[name=category] option").each(function(){
	            			if($(this).text() == "<%=l.getCtNo()%>"){
	            				$(this).attr("selected",true);
	            			}
	            		})
	            		
	            		$("select[name=dCategory] option").each(function(){
	            			if($(this).text()== "<%=l.getCtDno()%>"){
	            				$(this).attr("selected",true);
	            			}
	            		})
	            	})
	            	
	
	            </script>
	            
	           
	            <tr>
	                <th>클래스명</th>
	                <td>
	                    <br>
	                    <input type="text" id="clName"  name="className" min="10" max="50" class="form-control" value="<%=l.getClName()%>"required > 
						 <div style="font-size: 11px; ">*10자 이상으로 입력해주세요. &nbsp;<span class="textCount"></span></div>
        
	                </td>
	            </tr>
	            
	            <script>
	            
	            	 $("#clName").keyup(function(e){
	            		 let content = $(this).val();
	            		 
	            		 if(content.length == 0 || content ==''){
	            			 $(".textCount").text('0/50');
	            		 }else{
	            			 $(".textCount").text(content.length + "/50");
	            		 }
	            	 })
	            
	            </script>
				
	            <tr>
	
	                <th>진행장소</th>
	                <td>
	                 
	                    <input id="class_sido" type="hidden"  name="sido" placeholder="시/도" readonly value="<%=l.getLocalCode() %>">
	                    <input id="class_sigungu" type="hidden" name="sigungu" placeholder="구" readonly value="<%=l.getDistrCode() %>"> <br>
	                    
	                    <input id="class_addr" type="text" name="address" required  placeholder="주소입력" readonly value="<%=l.getClAddress()%>">
	                    <button type="button" onclick="findAddr()"  class="btn btn-secondary btn-sm">주소검색 </button><br>
	                    <input type="text" name="dAddress" placeholder="상세주소입력"><br>
	                    <label style="font-size: 11px; color: red;">*서울,인천,경기 지역만 등록가능합니다.😥</label>
	                    <script>
	                        function findAddr(){
	                            new daum.Postcode({
	                                oncomplete: function(data) {
	                                    
	                                    console.log(data);
	                                    
	                                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	                                    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                                    const roadAddr = data.roadAddress; // 도로명 주소 변수
	                                    const jibunAddr = data.jibunAddress; // 지번 주소 변수
	                                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                                    const sido = data.sido;
	                                    const sigungu = data.sigungu;
	                                    
	                                    document.getElementById("class_sido").value = sido;
	                                    document.getElementById("class_sigungu").value = sigungu;
	
	
	                                    if(roadAddr !== ''){
	                                        document.getElementById("class_addr").value = roadAddr;
	                                    } 
	                                    else if(jibunAddr !== ''){
	                                        document.getElementById("class_addr").value = jibunAddr;
	                                    }
	                                }
	                            }).open();
	                        }
	                    </script>    
	                    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	                </td>
	                
	
	            </tr>
	            <tr>
	                <th>최대인원</th>
	                <td><input type="number" name="clMax" min="1" class="form-control-sm" value="<%=l.getClMax()%>"required > 명</td>
	            </tr>
	            <tr>
	                <th>난이도</th>
	                <td>
	                    <input type="radio" name="level" value="없음" id="none"><label for="none">없음</label>
	                    <input type="radio" name="level" value="하" id="easy"><label for="easy">쉬움</label>
	                    <input type="radio" name="level" value="중" id="normal"><label for="normal">보통</label>
	                    <input type="radio" name="level" value="상" id="hard"><label for="hard">어려움</label>
	                </td>
	            </tr>
	            
	            <script>
	            $(function(){
	            	const level = '<%=l.getClLevel()%>';
	            	$("input:radio[name=level]").each(function(){
	            		if(level.search($(this).val()) != -1){
	            			$(this).attr("checked",true);
	            		}
	            	})
	            	
	            })

	            </script>
	
	        </table>
	        <br><br>
	        <h6 style="font-weight: 550;">판매일정</h6>
	        <hr>
	        <br>
	        <table>
	            <tr>
	                <th width="100">일정</th>
	                <td>
	                    <input type="radio" id="everyday" name="schedule"class="schedule" value="매일">
	                    <label for="everyday">매일</label>
	                    <input type="radio" id="weekly" name="schedule" class="schedule" value="매주">
	                    <label for="weekly">매주</label>
	                    <br>
	                    <script>
	                      $(function(){
			            	const schedule = '<%=l.getClSchedule()%>';
			            	$("input:radio[name=schedule]").each(function(){
			            		if(schedule.search($(this).val()) != -1){
			            			$(this).attr("checked",true);
			            		}
			            	})
			            	
			            })
	            		</script>
	
	
	                    <input type="checkbox" name="day" value="월" class="day" id="mon"><label for="mon">월</label>
	                    <input type="checkbox" name="day" value="화" class="day" id="tue"><label for="tue">화</label>
	                    <input type="checkbox" name="day" value="수" class="day" id="wed"><label for="wed">수</label>
	                    <input type="checkbox" name="day" value="목" class="day" id="thur"><label for="thur">목</label>
	                    <input type="checkbox" name="day" value="금" class="day" id="fri"><label for="fri">금</label>
	                    <input type="checkbox" name="day" value="토" class="day" id="sat"><label for="sat">토</label>
	                    <input type="checkbox" name="day" value="일" class="day" id="sun"><label for="sun">일</label>
	                    
	                </td>
	                
	                 <script>
	                      $(function(){
			            	const day = '<%=l.getClDay()%>';
			            	$("input:checkbox[name=day]").each(function(){
			            		if(day.search($(this).val()) != -1){
			            			$(this).attr("checked",true);
			            		}
			            	})
			            	
			            })
	            		</script>
	
	
	                <script>
	
	                    $("input:radio[name=schedule]").on('click',function(){
	                        if($(this).val() == '매일'){
	                            $("input:checkbox[name=day]").attr("checked",true);
	                        }else{
	                            $("input:checkbox[name=day]").attr("checked",false);
	                        }
	                    })
	                        
	                   
	                </script>
	            </tr>
	            <tr>
	                <th>일 운영횟수</th>
	                <td><input type="number" name="times" min="1" required value="<%=l.getClTimes()%>">회</td>
	            </tr>
	            <tr>
	                <th>운영시간</th>
	                
	                <td>
	
	                    <div class="container">
	                        <table class="_table">
	                          <thead>
	                            <tr>
	                              <th>클래스 회차</th>
	                              <th>시작시간</th>
	                              <th>종료시간</th>
	                              <th>
	                              <%for (Schedule s : sList){ %>
	                              <input type="hidden" name="schNo" value="<%=s.getSchNo()%>">
	                               <%} %>
	                                <div class="action_container">
	                                  <button type="button" class="success" onclick="add_tr('table_body')">+
	                                  </button>
	                                </div>
	                              </th>
	                            </tr>
	                          </thead>
	                          <%for (Schedule s : sList){ %>
	                          <tbody id="table_body">
	                                <tr>
	                                <td>
	                                    <input type="number" min="1" name="session" value="<%=s.getSessionNo() %>" class="form_control" >
	                                </td>
	                                <td>
	                                    <input type="time" name="startTime" value="<%=s.getStartTime() %>" class="form_control" >
	                                </td>
	                                <td>
	                                    <input type="time" name="endTime" value="<%=s.getEndTime() %>" class="form_control">
	                                </td>
	                                <td>
	                                <div class="action_container">
	                                <button type="button" class="danger" onclick="remove_tr(this)">-&nbsp;
	                                </button>
	                                </div>
	                                </td>
	                                </tr>
	            					<%} %>
	                            </tbody>
	                        </table>
	                      </div>
	                      
	                    
	                </td>
	            </tr>
	            
	            		
	        </table>
	        <h6 style="font-weight: 550;">판매가격</h6>
	        <hr><br>
	        <table>
	            <tr>
	                <th width="100">판매가</th>
	                <td><input type="text" class="form-control-sm" name="price" required value="<%=l.getClPrice() %>" > 원</td>
	            </tr>
	
	        </table>
	        <br>
	        <hr><br>
	        <div align="center">
	        <button type="button" class="btn btn-secondary btn-sm" onclick="$('.form2').trigger('click');">다음페이지로</button>
	       
	        </div>
	
	        <script>
	            function add_tr(table_id) {//행 추가
	                let table_body = document.getElementById(table_id);
	                let first_tr   = table_body.firstElementChild;
	                let tr_clone   = first_tr.cloneNode(true);//*1)복제된 node 반환
	    
	                table_body.append(tr_clone);
	                clean_first_tr(table_body.firstElementChild);
	            }
	    
	            function clean_first_tr(firstTr) {//값 초기화
	                let children = firstTr.children;//*2) 자식 요소가 포함된 HTMLCollection을 반환
	                
	                children = Array.isArray(children) ? children : Object.values(children);//*3)
	                children.forEach(x=>{
	                    if(x !== firstTr.lastElementChild){//마지막child가 아닐때
	                        x.firstElementChild.value = '';//td의 첫번째 child > input값 초기화
	                    }
	                });
	            }
	    
	            function remove_tr(This) {//행 삭제
	                //*4)closet:현재 엘리멘트에서 가장 가까운 조상을 반환
	                if(This.closest('tbody').childElementCount == 1)
	                {
	                    alert("삭제할 수 없습니다.");
	                }else{
	                    This.closest('tr').remove();//삭제
	                }
	            }
	          </script>
	          
	          
	          
	           <script>
	                    function changeCt(){
	                        var study = ["외국어","자격증","IT"];
	                        var diy = ["가죽/라탄","비누/꽃/향","뜨개/자수","기타"];
	                        var draw = ["취미미술","캘리그래피"];
	                        var cook = ["요리","베이킹"];
	                        var sport = ["실내스포츠","야외스포츠","레저/액티비티","요가 필라테스/ 헬스 PT"];
	     
	                        var changeDct;
	                        
	                        if( $("#category").val() == "11"){
	                            changeDct = study;
	                            
	                        }else if( $("#category").val() == "22"){
	                            changeDct = diy;
	                        }else if( $("#category").val() == "33"){
	                            changeDct = draw;
	
	                        }else if( $("#category").val() == "44"){
	                            changeDct = cook;
	                        }else if( $("#category").val()== "55"){
	                            changeDct = sport;
	                        }
	                        
	                        
	                        for(var i=0; i<changeDct.length; i++){
	                            var option = $("<option>"+changeDct[i]+"</option>");
	                            $("#Dcategory").append(option);
	                        }
	                        
	                    }
	                    
	                    
	            
	                    
	                    </script>
	                    
	                    
	                    	

	       
	    </div>
	    <div id="form2" class="container tab-pane fade"><br>
	        <span style="font-size: 14px; font-weight: 600;">클래스 설명</span>
	        <div class="guidebtn">
	        <button type="button" class="btn btn-secondary btn-sm guide">작성가이드</button>
	        </div>
	        <hr><br>
	        <table>
	            <tr>
	                <th width="100">대표이미지</th>
	                <td>    
	                    <img src="<%=contextPath %>/<%=l.getClThumb()%>" alt="" id="titleImg" width="170" height="100" onclick="clickFile(1);">
	                    <%if (!atList.isEmpty()){ %>
	                    <img src="<%=contextPath %>/<%=atList.get(0).getFilePath()+atList.get(0).getChangeName() %>" alt="" id="contentImg1" width="170" height="100" onclick="clickFile(2);">
	                    <img src="<%=contextPath %>/<%=atList.get(1).getFilePath()+atList.get(1).getChangeName() %>" alt="" id="contentImg2" width="170" height="100" onclick="clickFile(3);">
	                    <img src="<%=contextPath %>/<%=atList.get(2).getFilePath()+atList.get(2).getChangeName() %>" alt="" id="contentImg3" width="170" height="100" onclick="clickFile(4);">
	                    <%} %>
	                    <div style="font-size:12px;">🔺첫번째 선택한 사진이 썸네일 이미지로 사용됩니다. 사진은 4장 모두 등록해주세요</div>
					
	                    <div id="file-area" style="display: none;">
	                        <input type="file" name="file1" onchange="loadImg(this,1);" required> 
	                        <input type="file" name="file2" onchange="loadImg(this,2);" required>
	                        <input type="file" name="file3" onchange="loadImg(this,3);" required> 
	                        <input type="file" name="file4" onchange="loadImg(this,4);" required>
	                        
	                        <input type="hidden" name="originThumb" value="<%=l.getClThumb()%>">
	                       <%for (Attachment at : atList){ %>
	                        <input type="hidden" name="originfile" value="<%=at.getFileNo()%>">
	                        <%} %>
	                    
	                    
	                    
	                    </div>
	                    
	                </td>
	            </tr>
	            <script>
	                function clickFile(num){
	                    $("input[name=file"+num+"]").click();
	                }
	
	
	                function loadImg(inputFile, num){
	                  
	                    if(inputFile.files.length == 1){// 배열의 길이가 1일때 
	                         
	                        const reader = new FileReader();
	                        reader.readAsDataURL(inputFile.files[0]);
	                        reader.onload = function(e){
	                            //e.target.result => 읽어들인 파일의 고유한 url 
	                            switch(num){
	                                case 1: $("#titleImg").attr("src",e.target.result); break;
	                                case 2: $("#contentImg1").attr("src",e.target.result); break;
	                                case 3: $("#contentImg2").attr("src",e.target.result);break;
	                                case 4: $("#contentImg3").attr("src",e.target.result);break;
	                            }
	                        }
	
	                    }else{ 
	                        // 기존에 선택된 파일이 취소된 경우 => 미리보기 됐던거 사라지게 하기 
	                        switch(num){
	                                case 1: $("#titleImg").attr("src",null); break;
	                                case 2: $("#contentImg1").attr("src",null); break;
	                                case 3: $("#contentImg2").attr("src",null);break;
	                                case 4: $("#contentImg3").attr("src",null);break;
	
	                            }
	                    }
	                }
	            </script>
	
	        <tr>
	            <th>상세설명</th>
	            <td style="width: 100;">
	                <br>
	               
	                    <textarea id="summernote" name="editordata" ><%=l.getClDetail() %></textarea>
	                
	                
	                <script>
	                    $(document).ready(function() {
	                    //여기 아래 부분
	                    $('#summernote').summernote({
	                    
	                        height: 200,                 // 에디터 높이
	                        minHeight: 300,             // 최소 높이
	                        maxHeight: 300,             // 최대 높이
	                            // 에디터 로딩후 포커스를 맞출지 여부
	                        lang: "ko-KR",					// 한글 설정
	                        placeholder: '클래스에 대한 설명을 적어주세요.'	//placeholder 설정
	                       
	                    });
	                });
	                    
	                    
	                </script>
	                
	               
	            <br>
	        <tr>
	            <th>커리큘럼</th>
	            <td>
	                <textarea name="curriculum"  rows="4" style="resize:none" required ><%=l.getCurriculum() %></textarea>
	            </td>
	        </tr>
	        </table>
	        <table>
	            <tr>
	                <th width="100">환불규정</th>
	                <td>
	                    <textarea name="refundPolicy" id="refundPolicy"  rows="5" readonly style="font-size:11px">
	1. 결제 후 14일 이내 취소 시 : 전액 환불
	2. 결제 후 14일 이후 취소 시 : 환불 불가
	[환불 신청 방법]
	1. 해당 클래스 결제한 계정으로 로그인
	2. 마이 - 신청내역 or 결제내역"
	
	                    </textarea>
	                </td>
	            </tr>
	        </table>
	        <br><br>
	        <h5 style="font-weight: 550; font-size: 14px;">부가정보 (선택사항) </h5>
	        <hr><br>
	        <table>
	            <tr>
	                <th width="100">준비물</th>
	                <td><input type="text" name="supplies" value="<%=l.getClSupplies()== null ? "" :l.getClSupplies() %>" class="form-control"></td>
	                
	            </tr>
	            <tr>
	                <th>검색키워드</th>
	                <td><input type="text" name="keyword" value = "<%=l.getKeyword()== null ? "" :l.getKeyword() %>"class="form-control"></td>
	            </tr>
	           
	        </table>
	        <br><hr><br>
	        <div align="center">
	            <button type="button" class="btn btn-secondary btn-sm"  onclick="$('.form1').trigger('click');">이전</button>
	            <button type="submit" id="save" class="btn btn-secondary btn-sm">수정요청</button>
	            
	        </div>
	        
	        <script>
	        $(function(){
	        $(document).on('click', '#save', function () {
	            saveContent();
	          
	        });
		    });
	  
	        //데이터 저장
	        function saveContent() {
	        	
	            //값 가져오기
	            var summernoteContent = $('#summernote').summernote('code');        //썸머노트(설명)
	            console.log("summernoteContent : " + summernoteContent);

	        }
	        
	
	        </script>
	        
	        
	          
	    </div>
   </div>

</form>  
</div>

  
</div>

  <%@ include file="../common/footerbar.jsp" %>
  
      
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.hp.calculate.model.vo.Calculate"%>
<%
	ArrayList<Calculate> list = (ArrayList<Calculate>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div, p, form, input, table{box-sizing:border-box;}

   .outer{width:1000px; margin:auto; padding:20px 50px;}
   #calMng-form, #calMng-result{
    border:1px solid rgb(180, 180, 180); 
    border-radius:5px;
   }
   #calMng-form, #calMng-result{
    padding:20px;
   }

   #calMng-result td{
    text-align: center;
    vertical-align: middle;
    font-size:12px;
    padding:10px 0px;
   }
   #calMng-form td{
    padding:10px;
   }

   #selectCalMng-btn{
    width:60px;
    margin:0px 5px;
    background:rgb(22, 160, 133); 
    color:white;
   }
   input[name=dateType], input[name=calSta]{display: none; margin: 10px;}
   input[name=dateType]+label{
        display: inline-block;
        cursor: pointer;
        padding: 5px 8px;
        text-align: center;
        font-size: 12px;
        border-radius: 5px;
        background-color: rgb(101, 99, 99);
        color: white;
        line-height: 16px;
    }
    input[type=text]{
            width: 150px;
            border: 1px solid rgb(202, 199, 199);
            height: 30px;
            border-radius: 5px;
    }
    input[name=dateType]:checked+label, input[name=dateType]:hover+label{
        background-color: rgb(22, 160, 133);
    }
    
    input[name=calSta]+label{
        display: inline-block;
        cursor: pointer;
        padding: 5px 8px;
        text-align: center;
        border-radius: 5px;
        background-color: lightGray;
        line-height: 16px;
    }
    input[name=calSta]:checked+label, input[name=calSta]:hover+label{
        background-color: gray;
        color:white;
    }
    #tutorId{
        width:310px;
    }

   thead td{
    background:rgb(245, 245, 245);
   }
    .modal-body input{margin-left:10px;}
    #paging{
	    text-align: center;
	    display: inline-block;
		padding-left :0;
	}
	#paging li {
	    text-align: center;
	    float: left;
		list-style:none;
		border-radius:10px;
	}
	
	#paging li a {
	    display: block;
	    font-size: 12px;
		color: black;
	    padding: 5px 10px;
	    box-sizing: border-box;
		text-decoration-line:none;
	}
	
	#paging li.on {
	    background: gray;
	}
	
	#paging li.on a {
	    color: white;
	}
</style>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
</head>
<body>
	<%@ include file="../common/adminMenubar.jsp" %>
    <div class="outer">
        <h5><b>튜터 정산 관리</b></h5><br>
        <div id="calMng-form">
            <table width="850px">
                <tbody>
                	<tr>
                    	<td>진행상태</td>
                    	<td>
                    		<input type="radio" name="calSta" id="checkAll" value="정산" checked>
			                <label for="checkAll"><small>전체</small></label>
			                <input type="radio" name="calSta" id="checkWait" value="진행">
			                <label for="checkWait"><small>정산진행중</small></label>
			                <input type="radio" name="calSta" id="checkComplete" value="완료">
			                <label for="checkComplete"><small>정산완료</small></label>
                    	</td>
                    </tr>
                    <tr>
                        <td>튜터ID</td>
                        <td width="340">
                            <input type="text" name="tutorId" id="tutorId">
                        </td>
                    </tr>
                    <tr>
                        <td>조회 기간</td>
                        <td>
                            <div class="clearfix">
                                <!-- 시작일 -->
                                <span class="dset">
                                    <input type="text" class="datepicker inpType" name="searchStartDate" id="searchStartDate" >
                                    <a href="#none" class="btncalendar dateclick"></a>
                                </span>
                                <span class="demi">-</span>
                                <!-- 종료일 -->
                                <span class="dset">
                                    <input type="text" class="datepicker inpType" name="searchEndDate" id="searchEndDate" >
                                    <a href="#none" class="btncalendar dateclick"></a>
                                </span>
                            </div>  
                        </td>
                        <td>
                            <div class="searchDate">
                                <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType1" onclick="setSearchDate('0d')"/>
                                    <label for="dateType1">&nbsp;오늘&nbsp;</label>
                                 </span>
                                 <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType5" onclick="setSearchDate('1m')"/>
                                    <label for="dateType5">1개월</label>
                                 </span>
                                 <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType6" onclick="setSearchDate('3m')"/>
                                    <label for="dateType6">3개월</label>
                                 </span>
                                 <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType7" onclick="setSearchDate('6m')"/>
                                    <label for="dateType7">6개월</label>
                                 </span>
                                </div>  
                        </td>
                    </tr>
                    
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="3" align="center">
                            <button type="button" class="btn btn-sm" id="selectCalMng-btn" onclick="selectCalMng();">조회</button>
                            <button type="button" class="btn btn-sm btn-secondary" onclick="resetAll();">초기화</button>
                        </td>
                        
                    </tr>
                </tfoot>
            </table>
        </div>
        <script>
			function resetAll(){
				$("input:text").val("");
				$(".searchDate input:radio").removeAttr("checked");
			}
		</script>
        <script>                
		
		    $(function() {
		
		        //datepicker 한국어로 사용하기 위한 언어설정
		        $.datepicker.setDefaults($.datepicker.regional['ko']);     
		    
		        // Datepicker            
		        $(".datepicker").datepicker({
		            showButtonPanel: true,
		            dateFormat: "yy-mm-dd",
		            onClose : function ( selectedDate ) {
		            
		                var eleId = $(this).attr("id");
		                var optionName = "";
		
		                if(eleId.indexOf("StartDate") > 0) {
		                    eleId = eleId.replace("StartDate", "EndDate");
		                    optionName = "minDate";
		                } else {
		                    eleId = eleId.replace("EndDate", "StartDate");
		                    optionName = "maxDate";
		                }
		
		                $("#"+eleId).datepicker( "option", optionName, selectedDate );        
		                $(".searchDate").find(".chkbox2").removeClass("on"); 
		            }
		        }); 
		
		        $(".dateclick").dateclick();    // DateClick
		        $(".searchDate").schDate();        // searchDate
		        
		    });
		
		    // Search Date
		    jQuery.fn.schDate = function(){
		        var $obj = $(this);
		        var $chk = $obj.find("input[type=radio]");
		        $chk.click(function(){                
		            $('input:not(:checked)').parent(".chkbox2").removeClass("on");
		            $('input:checked').parent(".chkbox2").addClass("on");                    
		        });
		    };
		
		    // DateClick
		    jQuery.fn.dateclick = function(){
		        var $obj = $(this);
		        $obj.click(function(){
		            $(this).parent().find("input").focus();
		        });
		    }    
		
		    
		    function setSearchDate(start){
		
		        var num = start.substring(0,1);
		        var str = start.substring(1,2);
		
		        var today = new Date();
		
		        //var year = today.getFullYear();
		        //var month = today.getMonth() + 1;
		        //var day = today.getDate();
		        
		        var endDate = $.datepicker.formatDate('yy-mm-dd', today);
		        $('#searchEndDate').val(endDate);
		        
		        if(str == 'd'){
		            today.setDate(today.getDate() - num);
		        }else if (str == 'w'){
		            today.setDate(today.getDate() - (num*7));
		        }else if (str == 'm'){
		            today.setMonth(today.getMonth() - num);
		            today.setDate(today.getDate() + 1);
		        }
		
		        var startDate = $.datepicker.formatDate('yy-mm-dd', today);
		        $('#searchStartDate').val(startDate);
		                
		        // 종료일은 시작일 이전 날짜 선택하지 못하도록 비활성화
		        $("#searchEndDate").datepicker( "option", "minDate", startDate );
		        
		        // 시작일은 종료일 이후 날짜 선택하지 못하도록 비활성화
		        $("#searchStartDate").datepicker( "option", "maxDate", endDate );
		
		    }
        </script>
        <script>
        let totalData; //총 데이터 수
	    let dataPerPage=10; //한 페이지에 나타낼 글 수
	    let pageCount = 10; //페이징에 나타낼 페이지 수
	    let globalCurrentPage=1; //현재 페이지
	    let dataList; //표시하려하는 데이터 리스트
	
	    $(function () {
		     selectCalMng();
	    })
        function selectCalMng(){
    		$.ajax({
    			url:"<%=contextPath%>/manageSearch.cal",
    			data:{
    				memId:$("input[name=tutorId]").val(),
    				startDate:$("#searchStartDate").val(),
    				endDate:$("#searchEndDate").val(),
    				status:$("input[name=calSta]:checked").val()    				
    			},
    			success:function(list){
    				if(list.length == 0){
    					let value = "<tr>"
    						+	"<td colspan='7'>조회된 내역이 없습니다.</td>"
    						+ "</tr>"
    					$("#calMng-list tbody").html(value);
    					$("#paging").html("");
    				} else{
    					//totalData(총 데이터 수) 구하기
    	 		    	   totalData = list.length;
    	 		               //데이터 대입
    	 		           dataList=list;
    	 		           displayData(1, dataPerPage, totalData);
    	 		           paging(totalData, dataPerPage, pageCount, 1);
    				}
    			},error:function(){
    				console.log("정산목록 조회용 ajax 통신실패");
    			}
    		})
    	}
	    function displayData(currentPage, dataPerPage, totalData) {
	    	  let value = "";
	    	//Number로 변환하지 않으면 아래에서 +를 할 경우 스트링 결합이 되어버림.. 
	    	  currentPage = Number(currentPage);
	    	  dataPerPage = Number(dataPerPage);
	    	  if(totalData < dataPerPage){
	    		  dataPerPage = totalData;
	    	  }
	    	  for (let i = (currentPage - 1) * dataPerPage; 
	    	    i < (currentPage - 1) * dataPerPage + dataPerPage;
	    	    i++
	    	  ) {
	    		  value += "<tr class='calMngList'>"
							+	"<td>" + dataList[i].calNo + "</td>"
							+	"<td>" + dataList[i].rqDt + "</td>"
							+	"<td>" + dataList[i].calReg + "<br>" 
							+	"<td>" + dataList[i].calNm + "</td>"
							+	"<td>" + dataList[i].bank + "&nbsp;" + dataList[i].calAcc + "</td>"
							+	"<td>" + dataList[i].price  + "</td>"
							+	"<td>" + dataList[i].calSta + "&nbsp;<button type='button' class='btn btn-secondary btn-sm calChange-btn'>수정</button> </td>"
							+ "</tr>"
	    	  }
	    	  $("#calMng-list tbody").html(value);
	    	}
  	
  		function paging(totalData, dataPerPage, pageCount, currentPage) {
  		 
  			  totalPage = Math.ceil(totalData / dataPerPage); //총 페이지 수
      		  
      		  if(totalPage<pageCount){
      		    pageCount=totalPage;
      		  }
      		  
      		  let pageGroup = Math.ceil(currentPage / pageCount); // 페이지 그룹
      		  let last = pageGroup * pageCount; //화면에 보여질 마지막 페이지 번호
      		  
      		  if (last > totalPage) {
      		    last = totalPage;
      		  }

      		  let first = last - (pageCount - 1); //화면에 보여질 첫번째 페이지 번호
      		  let next = last + 1;
      		  let prev = first - 1;

      		  let pageHtml = "";

      		  if (prev > 0) {
      		    pageHtml += "<li><a href='#' id='prev'> 이전 </a></li>";
      		  }

      		 //페이징 번호 표시 
      		  for (let i = first; i <= last; i++) {
      		    if (currentPage == i) {
      		      pageHtml +=
      		        "<li class='on'><a href='#' id='" + i + "' class='page-btn'>" + i + "</a></li>";
      		    } else {
      		      pageHtml += "<li><a href='#' id='" + i + "' class='page-btn'>" + i + "</a></li>";
      		    }
      		  }

      		  if (last < totalPage) {
      		    pageHtml += "<li><a href='#' id='next'> 다음 </a></li>";
      		  }

      		  $("#paging").html(pageHtml);


      		  //페이징 번호 클릭 이벤트 
      		  $("#paging li a").click(function () {
      		    let $id = $(this).attr("id");
      		    selectedPage = $(this).text();

      		    if ($id == "next") selectedPage = next;
      		    if ($id == "prev") selectedPage = prev;
      		    //전역변수에 선택한 페이지 번호를 담는다...
      		    globalCurrentPage = selectedPage;
      		    //페이징 표시 재호출
      		    paging(totalData, dataPerPage, pageCount, selectedPage);
      		    //글 목록 표시 재호출
      		    displayData(selectedPage, dataPerPage, totalData-(selectedPage-1)*dataPerPage);
      		  });
  		  
  		}
        </script>
        <br>
        
        <div id="calMng-result">
                <b>조회 결과</b><br>
            <br>
            <table width="100%" class="table" id="calMng-list">
                <thead>
                    <tr>
                        <td>정산번호</td>
                        <td>신청일자</td>
                        <td>튜터ID</td>
                        <td>예금주 성함</td>
                        <td>입금 요청 은행</td>
                        <td>정산금액</td>
                        <td>진행상태</td>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
            <div align="center">
			    <ul id="paging">
				</ul>
        	</div>
        </div>
        
    
    </div>
    <script>
	    $(document).on("click", ".calChange-btn", function(){
	    	$(".calNo").val($(this).parent().siblings().eq(0).text());
	    	$('.calChangeModal').modal('show'); 
	    	let calChange = $(this);
	    	// 정산처리상태에 따라 라디오버튼 checked
	    	$(".modal-body label").each(function(){
				if($(calChange).parent().text().includes($(this).text())){
					$(this).prev().attr("checked", true);
				}
			})
	    })
    </script>
    <div class="modal calChangeModal">
        <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content">
                <form action="<%= contextPath%>/update.cal">
                    <div class="modal-body">
                        <b>정산 처리상태 변경</b> <br><br>
                        <div align="center">
                        <input type="radio" id="W" value="W" name="calSt"> <label for="W">정산 진행중</label>
                        <input type="radio" id="C" value="C" name="calSt"> <label for="C">정산완료</label> <br><br>
                        <button type="submit" class="btn btn-sm" style="background:rgb(22, 160, 133); color:white;">저장</button>
                        <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
                        </div>
                    </div>
                    <input type="hidden" name="calNo" class="calNo">
                </form>
            </div>  
        </div>
    </div>
    
</body>
</html>
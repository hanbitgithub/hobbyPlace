<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- datepicker 한국어로 -->
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
<script>                

    $(document).ready(function() {

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

        //시작일.
        /*$('#searchStartDate').datepicker("option","onClose", function( selectedDate ) {    
            // 시작일 datepicker가 닫힐때
            // 종료일의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
            $("#searchEndDate").datepicker( "option", "minDate", selectedDate );
            $(".searchDate").find(".chkbox2").removeClass("on");
        });
        */

        //종료일.
        /*$('#searchEndDate').datepicker("option","onClose", function( selectedDate ) {    
            // 종료일 datepicker가 닫힐때
            // 시작일의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
            $("#searchStartDate").datepicker( "option", "maxDate", selectedDate );
            $(".searchDate").find(".chkbox2").removeClass("on");
        });
        */

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

<title>Insert title here</title>
<style>
 #content2{
            width: 1000px;
        }

        .outer{
            padding: 30px 50px;

        }
        .outer>*{
            font-size: small;
        }
        #class-select input{
            margin: 5px 5px;
           
        } 
        #class-select input[type="checkbox"]{
            margin: 10px 5px;
           
        } 
        #class-select>tr{
           margin: 10px;
        }

        input[type=radio]{display: none; margin: 10pt;}
        input[type=radio]+label{
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
        input[type=radio]:checked+label{
            background-color: rgb(22, 160, 133);
        }
        input[type=radio]:hover+label{
            background-color: rgb(22, 160, 133);
        }

        .clearfix{display: inline-block;}
        .searchDate{display: inline;}





        /*테이블*/
        #table-area{
            text-align:center;
            cursor: pointer;
        }
        input[type="text"]{
        width: 150px;
        border: 1px solid rgb(202, 199, 199);
        height: 30px;
        border-radius: 5px;
        
    }
        input[type="search"]{
        width: 330px;
        border: 1px solid rgb(202, 199, 199);
        height: 32px;
        border-radius: 5px;
    }
    

 

</style>
</head>
<body>
<%@ include file="../common/tutorMenubar.jsp" %>
	  <div class="outer">
                    
                    <form action="" id="class_list" >
                    <h5 style="font-weight: 900;">내 클래스 목록</h5>
                    <br>
                    <h6 style="font-weight:600">클래스 조회</h6>
                    <hr><br>
                    <table id="class-select">
                        <tr>
                            <th width="100">검색어</th>
                            <td><input type="search">
                               
                            </td>

                        </tr>

                        <tr>
                            <th>조회기간</th>
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
                        <tr>
                            <th>등록상태</th>
                            <td>
                                <input type="checkbox" name="status" id="" value="">
                                <label for="">검수요청</label>
                                <input type="checkbox" name="status" id="" value="">
                                <label for="">검수반려</label>
                                <input type="checkbox" name="status" id="" value="">
                                <label for="">판매중</label>
                                <input type="checkbox" name="status" id="" value="">
                                <label for="">판매중지</label>
                            </td>
                        </tr>
                    </table>    
                    <br>
                    <hr>
                    <div align="center">
                    <button type="submit" class="btn btn-secondary btn-sm">조회하기</button>
                    
                    
                    </div>

                    </form>
                    <br><br>

                    <div id="list">
                        <h6 style="font-weight:600">조회 결과</h6>
                        <hr>
                        <div id="table-area" align="center">
                        <table class="table table-hover ">
                            <thead class="thead-light">
                            <tr>
                                <th>클래스번호</th>
                                <th width="450">클래스명</th>
                                <th width="100">등록일</th>
                                <th width="100">상태</th>
                                <th width="100">반려사유</th>
                            </tr>
                            </thead>
                            <tbody>
                          
                            <tr>
                                <td colspan="5">등록된 클래스가 없습니다.</td>
                                
                            </tr>
                            
                            <!-- 등록된 클래스 있을 경우 -->
                            
                                <tr>
                                    <td>1</td>
                                    <td>클래명쓰시오</td>
                                    <td>2023-01-24</td>
                                    <td>검수요청</td>
                                    <td>못생겻음</td>
                                </tr>
                             
                            </tbody>
                        </table>
                        </div>

                    </div>

                </div>

                 <div class="paging-area">
        
        	
               
                </div>
	
</body>
</html>
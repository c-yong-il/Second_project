<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기</title>



<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />    
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script>
function itemSum(frm)
{
   var value = frm.ticket.value;
   
   frm.totalPrice.value = value;
}
</script>


<script>
  $(function() {
    $( "#calendar" ).datepicker();
   // showAnim
   //옵션  : 매개변수값 2번째가 옵션의 타입이며 3번째 항목은 옵션에 대한 설정 값
    $( "#calendar" ).datepicker( "option", "dateFormat", "yy년-mm월-dd일" ); //데이터 포맷으로 날짜의 반환 타입을 지정
    $( "#calendar" ).datepicker( "option", "minDate", "slideDown" );     //달력의 표시 형태
  });
</script>

</head>
<body>

<!-- header start -->
	<iframe src="http://localhost:9000/cgv/header.jsp"  scrolling="no" frameborder="0" width="100%" height="150px"></iframe>

<h2>예매 옵션</h2>

	<form action="reserv_test.jsp">
	
		<p>
			<span>날짜:</span> <input type="text" id="calendar" name="calender">
		</p>
		<p>
			<span>입장권:</span> 
			<select name="ticket" class="h" onChange="itemSum(this.form);">
				<option value="0">선택</option>
				<option value="30000">입장권(대인) 1명</option>
				<option value="60000">입장권(대인) 2명</option>
				<option value="90000">입장권(대인) 3명</option>
				<option value="20000">입장권(소인) 1명</option>
				<option value="40000">입장권(소인) 2명</option>
				<option value="60000">입장권(소인) 3명</option>
			</select>
		</p>
		<p>
			<span>자유이용권:</span> 
			<select name="ticket" class="h" onChange="itemSum(this.form);">
				<option value="0">선택</option>
				<option value="60000">자유이용권(대인) 1명</option>
				<option value="120000">자유이용권(대인) 2명</option>
				<option value="180000">자유이용권(대인) 3명</option>
				<option value="40000">자유이용권(소인) 1명</option>
				<option value="80000">자유이용권(소인) 2명</option>
				<option value="120000">자유이용권(소인) 3명</option>
			</select>
		</p>
		<p>
			<span>전체 총가격:</span> <input type="text" name="totalPrice"  size="20" readonly>
		</p>
			<input type="submit" value="예매하기">
	</form>

<!-- footer start -->
	<iframe src="http://localhost:9000/cgv/footer.jsp"  scrolling="no" frameborder="0" width="100%" height="500px"></iframe>
</body>
</html>

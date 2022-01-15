<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  	 String calendar = (String)request.getParameter("calendar");
     String ticket1 = (String)request.getParameter("ticket1");
     String ticket2 = (String)request.getParameter("ticket2");
     String ticket3 = (String)request.getParameter("ticket3");
     String ticket4 = (String)request.getParameter("ticket4");
     String sh1 = (String)request.getParameter("sh1");
     String bh1 = (String)request.getParameter("bh1");
     String sh2 = (String)request.getParameter("sh2");
     String bh2 = (String)request.getParameter("bh2");
     String start = (String)request.getParameter("start");
     String free = (String)request.getParameter("free");
     String stotalPrice = (String)request.getParameter("totalPrice");
     int totalPrice = Integer.parseInt(stotalPrice);
 
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>kakao</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
    <script>
    $(function(){
        var IMP = window.IMP; // 생략가능
        IMP.init('imp23418340'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '놀이공원 티켓 결제',
            amount : <%=totalPrice%>,
            buyer_calendar : '<%=calendar%>',
            buyer_ticket1 : '<%=ticket1%>',
            buyer_ticket2 : '<%=ticket2%>',
            buyer_ticket3 : '<%=ticket3%>',
            buyer_ticket4 : '<%=ticket4%>',
            buyer_sh1 : '<%=sh1%>',
            buyer_bh1 : '<%=bh1%>',
            buyer_sh2 : '<%=sh2%>',
            buyer_bh2 : '<%=bh2%>',
            buyer_start : '<%=start%>',
            buyer_free : '<%=free%>',
            buyer_postcode : '123-456',
            //m_redirect_url : 'http://www.naver.com'
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        //기타 필요한 데이터가 있으면 추가 전달
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        
                        alert(msg);
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
                //성공시 이동할 페이지
               <%--  location.href='<%=request.getContextPath()%>/order/paySuccess?msg='+msg; --%>
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                location.href="<%=request.getContextPath()%>/order/payFail";
                alert(msg);
            }
        });
        
    });
    </script> 
 
</body>
</html>
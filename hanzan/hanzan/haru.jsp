<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="viewport" content="wodtj=device.width, inital-scale=1.0">
    <title>hanzan main</title>
    <link rel="stylesheet" href="../hanzan/css/hanzan.css">
    <script src="js/jquery-2.2.4.min.js"></script>
    <script src="js/hanzan.js"></script>
</head>
<body>
    <%
     //   로그인 상태를 유지하기 위하여, sid에 저장되었던 접속한 ID값을 
     //   session 객체로부터 가져와서 변수 id에 저장시킴 (loginOK.jsp의 43행부분 확인요망!)
   String id = (String)session.getAttribute("sid"); 
   // String id = session.getAttribute("sid").toString(); 와  동일함
                                                                                         
%>
    <header>
        <div class="logo">
		<%if(id == "" || id == null){%>
         <a href="index.html">
      <%} else {%>
         <a href="index.jsp">
      <%}%>
		<img src="../hanzan/img/logo.png"></a></div>
        <ul class="nav">
            <li class="main-menu"><a href="teastory.jsp">차 이야기</a></li>
            <li class="main-menu">
                <a href="#">차 가게</a>
                <ul class="sub-menu1 hide">
                    <li><a href="subn.jsp">녹차/발효차/홍차</a></li>
                    <li><a href="subm.jsp">허브티(무카페인)</a></li>
                    <li><a href="subb.jsp">블랜디드티</a></li>
                </ul><!--sub-menu-->
            </li>
            <li class="main-menu">
				<a href="#">다과</a>
                <ul class="sub-menu3 hide">
                    <li><a href="desert.jsp">한과</a></li>
                    <li><a href="desert2.jsp">화과자</a></li>
                </ul><!--sub-menu-->
			</li>
            <li class="main-menu">
                <a href="#">다구</a>
                <ul class="sub-menu2 hide">
                    <li><a href="teazan.jsp">찻잔</a></li>
                    <li><a href="teapot.jsp">티팟</a></li>
                </ul><!--sub-menu-->
            </li>
            <li class="main-menu"><a href="haru.jsp">하루한잔</a></li>
			<li class="main-menu"><%if(id == "" || id == null){%>
                           <a href="login.html"> LOGIN
                        <%} else {%>
                           <a href="logout.jsp"> LOGOUT 
                        <%}%></a></li>
            <li class="main-menu"><a href="mypage.jsp"><img src="../hanzan/img/mypage.png"></a></li>
            <li class="main-menu"><a href="showCart.jsp"><img src="../hanzan/img/cart.png"></a></li>
        </ul>
    </header>

    <div class="harumain">
        <p><span>이달에 어울리는 차를</span><span>정기구독하여 조금 더 싼 가격으로</span><span>매달 받아보세요.</span></p>
    </div>
    <div class="haru">
        <p>하루한잔,<span>나를 마주하는 시간</span></p>
        <p>이달의 나는 어떤가요?<span>하루한잔과 함께 하루에 한 번,</span><span>나를 마주하는 시간을 가져보세요.</span></p>
    </div>
    <div class="harucontent">
        <p class="htxt">내 라이프스타일에 맞는 하루한잔을 구독하여<span>매달 새로운 티를 만나보세요.</span></p>
        <ul class="haruselect">
            <li>
                <div class="harutxt">
                    <p>매일 만나는<span>하루한잔</span></p>
                    <p>저희가 직접 추천하는<span>이달에 어울리는 차 한 가지를</span><span>매달 정기적으로 배송 받아보세요.</span></p>
                    <div class="bar2"></div>
                    <p>매월 16,000원</p>
                    <p><span>* 20개 이상, 한 종류의 티백으로 구성</span><span>* 2만원 이상 정가 구성</span><span>* 최소 9만원 이상할인 (1년 구독 기준)</span></p>
                    <a href="viewDetailProduct8.jsp?prdNo=G1">자세히 보기</a>
                </div>
            </li>
            <li>
                <div class="harutxt">
                    <p>다양하게 만나는<span>하루한잔</span></p>
                    <p>다양한 차를 조금 저렴한 가격으로<span>몇가지 종류의 티를 랜덤으로</span><span>배송 받아보세요.</span></p>
                    <div class="bar2"></div>
                    <p>매월 25,000원</p>
                    <p><span>* 20개 이상, 5종류의 티백으로 구성</span><span>* 3만 5천원 이상 정가 구성</span><span>* 최소 12만원 이상할인 (1년 구독 기준)</span></p>
                    <a href="viewDetailProduct9.jsp?prdNo=G2">자세히 보기</a>
                </div>
            </li>
        </ul>
    </div>

    <footer>
        <ul class="icon">
            <li><a href = "https://www.instagram.com/"><img src="../hanzan/img/insta.png"></a></li>
            <li><a href = "https://www.facebook.com/"><img src="../hanzan/img/facebook.png"></a></li>
        </ul>
        <p><span><a href="adminlogin.jsp">관리자 로그인</a></span>
            Address : Gangnam, Seoul, Korea / tel : 010-1212-3232 / E-mail : hanzan@naver.com
            <span>Copyright : hanzan.All rights reserved.</span>
        </p>
    </footer>
</body>
</html>
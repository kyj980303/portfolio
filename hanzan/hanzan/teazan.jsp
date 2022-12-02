<%@ page contentType="text/html;charset=euc-kr" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
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

    <div class="teazanmain">
        <div class="zantxt">
            <p>찻잔</p>
            <p>예쁜잔에 마시면, 더욱더 좋은맛을 낸다.</p>
        </div>
    </div>

    <div class="teazan">
        <p class="zan">찻잔</p>
        <ul class="zan1">
            <li>
                <a href="viewDetailProduct5.jsp?prdNo=J1"><img src="./img/zan1.png"></a>
                <div class="zan1txt">
                    <p>화이트 베이직 티잔</p><a href="#"><img src="./img/arrow.png"></a>
                    <p><span>25,000원</span></p>
                </div>
            </li>
            <li>
                <a href="viewDetailProduct5.jsp?prdNo=J9"><img src="./img/zan9.png"></a>
                <div class="zan1txt">
                    <p>핑크 진주조개 티잔</p><a href="#"><img src="./img/arrow.png"></a>
                    <p><span>30,000원</span></p>
                </div>
            </li>
            <li>
                <a href="viewDetailProduct5.jsp?prdNo=J3"><img src="./img/zan3.png"></a>
                <div class="zan1txt">
                    <p>파스텔색 티잔</p><a href="#"><img src="./img/arrow.png"></a>
                    <p><span>30,000원</span></p>
                </div>
            </li>
            <li>
                <a href="viewDetailProduct5.jsp?prdNo=J4"><img src="./img/zan4.png"></a>
                <div class="zan1txt">
                    <p>옐로우 티잔</p><a href="#"><img src="./img/arrow.png"></a>
                    <p><span>25,000원</span></p>
                </div>
            </li>
            <li>
                <a href="viewDetailProduct5.jsp?prdNo=J6"><img src="./img/zan6.png"></a>
                <div class="zan1txt">
                    <p>투명 베이직 티잔</p><a href="#"><img src="./img/arrow.png"></a>
                    <p><span>20,000원</span></p>
                </div>
            </li>
            <li>
                <a href="viewDetailProduct5.jsp?prdNo=J7"><img src="./img/zan7.png"></a>
                <div class="zan1txt">
                    <p>내열유리 티잔</p><a href="#"><img src="./img/arrow.png"></a>
                    <p><span>35,000원</span></p>
                </div>
            </li>
            <li>
                <a href="viewDetailProduct5.jsp?prdNo=J8"><img src="./img/zan8.png"></a>
                <div class="zan1txt">
                    <p>땡땡이 도트 티잔</p><a href="#"><img src="./img/arrow.png"></a>
                    <p><span>30,000원</span></p>
                </div>
            </li>
			<li>
                <a href="viewDetailProduct5.jsp?prdNo=J2"><img src="./img/zan2.png"></a>
                <div class="zan1txt">
                    <p>그레이+화이트 투톤 티잔</p><a href="#"><img src="./img/arrow.png"></a>
                    <p><span>28,000원</span></p>
                </div>
            </li>
            <li>
                <a href="viewDetailProduct5.jsp?prdNo=J12"><img src="./img/zan12.png"></a>
                <div class="zan1txt">
                    <p>블랙 베이직 티잔</p><a href="#"><img src="./img/arrow.png"></a>
                    <p><span>20,000원</span></p>
                </div>
            </li>


        </ul>
    </div><!--teazan-->
    
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
<%@ page contentType="text/html;charset=euc-kr" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="wodtj=device.width, inital-scale=1.0">
    <title>한잔 명차</title>
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

    <div class="mtmain2">
        <div class="mtmaintxt2">
            <p>녹차/발효차/홍차</p>
            <p><span>심혈관계질환 예방에 좋은</span><span>녹차, 홍차입니다.</span></p>
        </div>
    </div>

    <div class="custom2">
        <div class="customtxt2">
            <p>발효도에 따른 차의 종류</p>
            <p>녹차를 발효시키면 홍차가 된다는<span> 사실을 알고 계셨나요?</span></p>
        </div>
    </div>

    <div class="submtea2">
        <p class="submt2">녹차/발효차/홍차</p>
        <ul class="subm2">
            <li>
                <a href="viewDetailProduct2.jsp?prdNo=N1"><img class="r" src="./img/ntea1.png"></a>
                <div class="submtxt2">
                    <p>제주 순수녹차</p><a href="#"><img src="./img/arrow.png"></a>
                    <p>부드럽고 깔끔한 맛의 녹차<span>9,500원</span></p>
                </div>
            </li>
            <li>
                <a href="viewDetailProduct2.jsp?prdNo=N2"><img class="r" src="./img/ntea2.png"></a>
                <div class="submtxt2">
                    <p>덖음차</p><a href="#"><img src="./img/arrow.png"></a>
                    <p>신선한 찻잎을 정성스레 덖은 녹차<span>15,000원</span></p>
                </div>
            </li>
            <li>
                <a href="viewDetailProduct2.jsp?prdNo=N3"><img class="r" src="./img/ntea3.png"></a>
                <div class="submtxt2">
                    <p>제주숲 홍차</p><a href="#"><img src="./img/arrow.png"></a>
                    <p>어린 찻잎으로 만든 산뜻한 향미의 홍차<span>15,000원</span></p>
                </div>
            </li>
            <li>
                <a href="viewDetailProduct2.jsp?prdNo=N4"><img class="r" src="./img/ntea4.png"></a>
                <div class="submtxt2">
                    <p>찬물녹차</p><a href="#"><img src="./img/arrow.png"></a>
                    <p>부드럽고 깔끔한 스틱형 녹차 아이스티<span>9,000원</span></p>
                </div>
            </li>
            <li>
                <a href="viewDetailProduct2.jsp?prdNo=N5"><img class="r" src="./img/ntea5.png"></a>
                <div class="submtxt2">
                    <p>제주 화산우롱차</p><a href="#"><img src="./img/arrow.png"></a>
                    <p>깊은 로스팅 풍미의 반발효차<span>9,500원</span></p>
                </div>
            </li>
            <li>
                <a href="viewDetailProduct2.jsp?prdNo=N6"><img class="r" src="./img/ntea6.png"></a>
                <div class="submtxt2">
                    <p>제주 얼그레이</p><a href="#"><img src="./img/arrow.png"></a>
                    <p>천연 베르가못향을 더한 클래식 얼그레이<span>9,500원</span></p>
                </div>
            </li>
            <li>
                <a href="viewDetailProduct2.jsp?prdNo=N7"><img class="r" src="./img/ntea7.png"></a>
                <div class="submtxt2">
                    <p>억수진</p><a href="#"><img src="./img/arrow.png"></a>
                    <p>조화로운 풍미를 가진 차<span>15,000원</span></p>
                </div>
            </li>
        </ul>
    </div><!--submtea-->
    
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
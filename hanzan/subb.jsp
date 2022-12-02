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

    <div class="mtmain3">
        <div class="mtmaintxt3">
            <p>블랜디드티</p>
            <p><span>티의 색, 향, 맛을 일정하게 유지하기 위해</span><span>여러 지역에서 수확한 찻잎들을 혼합해 만든 티로 새로운 향을 느껴보세요.</span></p>
        </div>
    </div>

    <div class="custom3">
        <div class="customtxt3">
            <p>제주의 향긋한 유채와 꿀의 만남</p>
            <p>봄의 시작을 알리는 유채꽃,<span> 제주 유채 & 꿀티로 봄을 느껴보세요.</span></p>
        </div>
    </div>

    <div class="submtea3">
        <p class="submt3">블랜디드티</p>
        <ul class="subm3">
            <li>
                <a href="viewDetailProduct3.jsp?prdNo=B1"><img class="r" src="./img/btea1.png"></a>
                <div class="submtxt3">
                    <p>레드파파야 블랙티</p><a href="#"><img src="./img/arrow.png"></a>
                    <p>붉은 장미와 달콤한 파파야의 만남<span>23,000원</span></p>
                </div>
            </li>
            <li>
                <a href="viewDetailProduct3.jsp?prdNo=B2"><img class="r" src="./img/btea2.png"></a>
                <div class="submtxt3">
                    <p>웨딩 그린티</p><a href="#"><img src="./img/arrow.png"></a>
                    <p>향기로운 꽃향이 가득한 진한 녹차<span>23,000원</span></p>
                </div>
            </li>
            <li>
                <a href="viewDetailProduct3.jsp?prdNo=B3"><img class="r" src="./img/btea3.png"></a>
                <div class="submtxt3">
                    <p>달빛걷기</p><a href="#"><img src="./img/arrow.png"></a>
                    <p>달큰한 배향이 달빛처럼 은은한 차<span>23,000원</span></p>
                </div>
            </li>
            <li>
                <a href="viewDetailProduct3.jsp?prdNo=B4"><img class="r" src="./img/btea4.png"></a>
                <div class="submtxt3">
                    <p>제주 유채 & 꿀티</p><a href="#"><img src="./img/arrow.png"></a>
                    <p>향긋한 유채와 달달한 꿀을 블랜딩한 티<span>9,500원</span></p>
                </div>
            </li>
            <li>
                <a href="viewDetailProduct3.jsp?prdNo=B5"><img class="r" src="./img/btea5.png"></a>
                <div class="submtxt3">
                    <p>동백이 피는 곶자왈</p><a href="#"><img src="./img/arrow.png"></a>
                    <p>제주 동백꽃향과 열대과일의 만남<span>23,000원</span></p>
                </div>
            </li>
            <li>
                <a href="viewDetailProduct3.jsp?prdNo=B6"><img class="r" src="./img/btea6.png"></a>
                <div class="submtxt3">
                    <p>삼다 꿀배 티</p><a href="#"><img src="./img/arrow.png"></a>
                    <p>그윽한 제주 밤바다와 달큰한 배의 만남<span>9,500원</span></p>
                </div>
            </li>
            <li>
                <a href="viewDetailProduct3.jsp?prdNo=B7"><img class="r" src="./img/btea7.png"></a>
                <div class="submtxt3">
                    <p>벚꽃향 가득한 올레</p><a href="#"><img src="./img/arrow.png"></a>
                    <p>제주 벚꽃향과 달콤새콤한 과실향<span>23,000원</span></p>
                </div>
            </li>
            <li>
                <a href="viewDetailProduct3.jsp?prdNo=B8"><img class="r" src="./img/btea8.png"></a>
                <div class="submtxt3">
                    <p>산호섬 아이스 티</p><a href="#"><img src="./img/arrow.png"></a>
                    <p>에메랄드빛 제주 바다를 닮은 머스캣향<span>13,000원</span></p>
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
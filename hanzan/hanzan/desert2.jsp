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
		<button class="btn_nav mobile hide"><img src="./img/menuicon.png"></button>
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
		<div class="nav2 hide">
            <nav id="navWrap">
                <div class="nav_inner">
                    <div class="logo2"><img src="./img/logo.png"></div>
                    <div class="close"><img src="./img/x.png"></div>
                    <ul class="gnb">
                        <li> <!--브랜드스토리 클릭했을때 열리게-->
                            <a href="teastory.jsp">차 이야기
                        </li>
                        <li> <!--브랜드스토리 클릭했을때 열리게-->
                            <a href="#">차 가게<img src="./img/arrowdown.png"></a>
                            <div class="sub_wrap hide">
                                <div class="left">
                                    <ul>
                                        <li><a href="subn.jsp">녹차/발효차/홍차</a></li>
                                        <li><a href="subm.jsp">허브티(무카페인)</a></li>
                                        <li><a href="subb.jsp">블랜디드티</a></li>
                                    </ul>
                                </div><!--left-->
                            </div><!--sub_wrap mobile:sub pc:absolute-->
                        </li>
                        <li> <!--브랜드스토리 클릭했을때 열리게-->
                            <a href="#">다과<img src="./img/arrowdown.png"></a>
                            <div class="sub_wrap hide">
                                <div class="left">
                                    <ul>
                                        <li><a href="desert.jsp">한과</a></li>
                                        <li><a href="desert2.jsp">화과자</a></li>
                                    </ul>
                                </div><!--left-->
                            </div><!--sub_wrap mobile:sub pc:absolute-->
                        </li>
                        <li> <!--브랜드스토리 클릭했을때 열리게-->
                            <a href="#">다구<img src="./img/arrowdown.png"></a>
                            <div class="sub_wrap hide">
                                <div class="left">
                                    <ul>
                                        <li><a href="teazan.jsp">찻잔</a></li>
                                        <li><a href="teapot.jsp">티팟</a></li>
                                    </ul>
                                </div><!--left-->
                            </div><!--sub_wrap mobile:sub pc:absolute-->
                        </li>
                        <li> <!--브랜드스토리 클릭했을때 열리게-->
                            <a href="haru.jsp">하루한잔</a>
                        </li>
                        <li class="main-menu"><%if(id == "" || id == null){%>
                           <a href="login.html"> LOGIN
                        <%} else {%>
                           <a href="logout.jsp"> LOGOUT 
                        <%}%><img src="../hanzan/img/loginikon.png"></a></li>
                        <li><a href="login.jsp">마이페이지<img src="../hanzan/img/mypageikon2.png"></a></li>
                        <li><a href="showCart.jsp">장바구니<img src="../hanzan/img/cartikon2.png"></a></li>
                    </ul>
                </div><!--nav_inner mobile:흰색영역 pc:가운데정렬-->
            </nav><!--navWrap mobile:검은영역 pc:전체영역-->
        </div> 
    </header>

    <div class="desertmain2">
        <div class="deserttxt">
            <p>차와 어울리는 화과자를 소개합니다.</p>
        </div>
    </div>
    
    <div class="submtead2">
        <p class="desert">화과자</p>
        <div class="dbar"></div>
        <ul class="subm2">
            <li>
                <a href="viewDetailProduct6.jsp?prdNo=W1"><img src="./img/hwa1.png"></a>
                <div class="submtxt2">
                    <p>수제 화과자</p><a href="#"><img src="./img/arrow.png"></a>
                    <p>쫀득하고 알록달록한 화과자<span>38,000원</span></p>
                </div>
            </li>
            <li>
                <a href="viewDetailProduct6.jsp?prdNo=W2"><img src="./img/hwa2.png"></a>
                <div class="submtxt2">
                    <p>도라지청과 곶감단지 화과자</p><a href="#"><img src="./img/arrow.png"></a>
                    <p>달콤한 곶감과 도라지 화과자<span>27,000원</span></p>
                </div>
            </li>
            <li>
                <a href="viewDetailProduct6.jsp?prdNo=W3"><img src="./img/hwa3.png"></a>
                <div class="submtxt2">
                    <p>눈꽃 화과자</p><a href="#"><img src="./img/arrow.png"></a>
                    <p>달달한 눈꽃 화과자<span>20,000원</span></p>
                </div>
            </li>
            <li>
                <a href="viewDetailProduct6.jsp?prdNo=W4"><img src="./img/hwa4.png"></a>
                <div class="submtxt2">
                    <p>카네이션 화과자</p><a href="#"><img src="./img/arrow.png"></a>
                    <p>쫀득하고 달달한 화과자<span>15,000원</span></p>
                </div>
            </li>
            <li>
                <a href="viewDetailProduct6.jsp?prdNo=W5"><img src="./img/hwa5.png"></a>
                <div class="submtxt2">
                    <p>우리쌀 화과자</p><a href="#"><img src="./img/arrow.png"></a>
                    <p>고소한 우리쌀 화과자<span>22,000원</span></p>
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
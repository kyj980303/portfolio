<%@ page contentType="text/html;" pageEncoding="utf-8" %>
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
    <div class="main">
        <div class="maintxt">
            <p>
                하루에 한 번,
                <span>나를 만나는 시간을 가져보세요.</span>
            </p>
        </div>
        <img class="arr" src="./img/scrolldown.png">
    </div>
    <div class="story">
        <img class="hanzanMi" src="./img/hanzanMi.png">
        <div class="hanzanStory">
            <div class="storytxt">
                <p class="s">HANZAN STORY</p>
                <p>한잔 차 잎은 맑은 공기와 깨끗한 물,<br> 그리고 정성으로 키웁니다.</p>
                <p>
                    한잔은 유기농 재배와 효율적인 경작을 위해 많은 노력과 투자를 하여 질이 좋은 고품질의 녹차를 생산하고 있습니다.
                </p>
                <p>
                    또한 아침부터 불어오는 따뜻한 바람으로 자연속에서 온화하게 성장합니다.
                </p>
				<img src="./img/storybg.png">
            </P><!--storytxt-->
        </div><!--hanzanStory-->
        <div class="mainhan" style="position: relative; top: -594px;">
            <ul class="mainhanzan">
                <li>
                    <div class="mainhanzantxt">
                        <p>한잔</p>
                        <p><span>저희의</span><span>한잔 명차를</span><span>만나보세요.</span></p>
                        <img class="arrb" src="./img/arrowB.png">
                    </div>
                </li>
                <li>
                    <a href="#"><img src="./img/m.png"></a>
                </li>
            </ul>
        </div>
    </div>
    <div class="cacktail">
        <ul class="cack">
            <li><img src="./img/mainda.png"></li>
            <li>
                <p>한과</p>
                <p><a href="desert.jsp">자세히 보기</a></p>
                <div class="hwa">
                    <p>화과자</p>
                    <p><a href="desert2.jsp">자세히 보기</a></p>
                </div>
                <a href="#"><img src="./img/da.png"></a>
            </li>
        </ul>
    </div><!--cacktail-->

    <div class="conviction">
        <div class="convictiontxt">
            <p>CUSTOMIZING</p>
            <P>내가 원하는 향으로,<span>내가 좋아하는 맛으로,</span><span>내 취향대로 나만의 티를</span><span>만들어보세요.</span></P>
            <a href="#"><img class="arrb" src="./img/arrowB.png"></a>
        </div>
        <a href="#"><img class="conv" src="./img/conv.png"></a>
    </div>

    <div class="madetea">
        <ul class="made">
            <li><img src="./img/madetea.png"></li>
            <li>
                <div class="mainhanzantxt">
                    <p>한잔</p>
                    <p><span>지금</span><span>나에게 꼭 맞는</span><span>릴렉싱 티를 알아보세요.</span></p>
                    <a href="#"><img class="arrb" src="./img/arrowB2.png"></a>
                </div>
				<img class="sbgl" src="./img/storybg.png">
            </li>
        </ul>
    </div>

    <div class="subscribe">
        <div class="mainhanzantxt">
            <p>하루한잔</p>
            <p>
                <span>하루에 한 번 나를 만나는 시간,</span><span>하루의 피로를 풀어주는 하루의 한 잔,</span>
                <span>하루한잔을 구독하여 한달에 한 번</span><span>새로운 티를 만나보세요.</span>
            </p>
            <a href="#"><img class="arrb" src="./img/arrowB.png"></a>
        </div>
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
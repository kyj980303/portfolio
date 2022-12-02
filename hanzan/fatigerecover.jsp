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

    <div class="recover">
        <div class="fcontent">
            <p>차 이야기</p>
            <p>피로회복에 좋은 차</p>
            <div class="fbar"></div>
            <img src="./img/arrow.png">
        </div>
        <div class="fcontent2">
            <img src="./img/tstory1.png">
            <p>피로회복에 좋은 차는 구기자차, 인삼차, 대추차, 황기차, 오미자차, 사과차입니다.</p>
            <p>
                <span>구기자차에는 베타인, 루틴, 비타민 B1, C 외에 필수 아미노산이 8가지나 들어있어 피로회복에</span>
                <span>아주 좋으며 구기자차를 진하게 해서 마시면 숙취로 인한 피로에도 좋습니다.</span>
                <span>만드는 법은 적당량의 구기자차 찻잎에 물을 붓고 물의 양이 반 정도가 될 때까지 달여서 하루에</span>
                <span>3~4회씩 마셔줍니다. 또한 구기자차 잠자리에 들기 전에 작은 잔으로 한 잔씩 마시는 것이 좋습니다.</span>
                <span>인삼차는 인삼의 사포닌이라는 성분이 허약체질을 보강해 줍니다.따라서 인삼은 몸의 활성이</span>
                <span>떨어지고 있는 사람들에게 좋습니다. 인삼을 오래 먹으면 몸이 가벼워지고, 여러 가지 신체 기능이</span>
                <span>되살아 나면서 생기를 찾을 수 있도록 도와줍니다.</span>
                <span>대추차는 대추의 단맛이 긴장을 완화시키는 작용을 하기 때문에 신경 안정, 스트레스 해소, 불면증에</span>
                <span>좋습니다. 평소 히스테리가 심하고 피곤을 잘 느끼는 사람이 붉은색이 우러나도록 대추를 끓여 마시면</span>
                <span>피로회복에 도움이 됩니다. 하지만 오랫동안 먹으면 소화장애가 생길 수 있으므로 소화 기능이 약한</span>
                <span>사람은 마시지 않는 것이 좋습니다.</span>
                <span>황기차는 중추신경계를 흥분시켜 성호르몬과 같은 작용을 하고 과로로 인해 쇠약해진 심장을 튼튼하게</span>
                <span>해줍니다.하루에 황기 20g을 300ml의 물에 넣고 절반 분량이 될 때까지 졸여 차처럼 수시로 마시면 </span>
                <span>피로회복에 도움이 됩니다.</span>
                <span>오미자차는 몸이 나른하고 피곤을 느낄 때 한 잔씩 마셔주면 좋습니다.</span>
                <span>사과차는 비타민 C와 유기산이 풍부해서 피로를 느낄 때마다 뜨거운 물에 타서 마시면 피로 회복에</span>
                <span>도움을 줍니다.</span>
            </p>
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
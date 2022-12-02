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
            <p>목감기에 좋은 차</p>
            <div class="fbar"></div>
            <img src="./img/arrow.png">
        </div>
        <div class="fcontent2">
            <img src="./img/tstory4.png">
            <p>목감기에 좋은 차는 배꿀차, 생강차, 유자차, 대추차, 모과 차, 도라지 차, 레몬차 입니다.</p>
            <p>
                <span>배꿀차는 기관지 질환에 효과가 있어서 감기, 천식 등에 좋습니다.</span>
                <span>생강차는 몸을 따뜻하게 해주고 신진대사를 촉진하는 효과가 있어 기침 뿐만 아니라 소화불량에도 </span>
                <span>효과가 좋습니다.</span>
                <span>유자차는 목을 보호하고 열을 내려주며, 비타민C가 함유되어 있어 피로회복에도 도움이 된다고 합니다.</span>
                <span>대추차는 깊은 향과 맛이 입안 가득 퍼지면서 맛있게 드실 수 있는 한방차 중 한가지로 단백질, 유기산, </span>
                <span>비타민A, 칼슘, 철분 등 들어있습니다. 대추는 몸에 온기가 돌 수 있도록 해주고 혈액순환이 잘 되도록</span>
                <span>도와줍니다.</span>
                <span>모과는 가래를 삭이고, 기관지를 튼튼하게 하며 목을 보호해 줍니다.</span>
                <span>또한 소화효소 분비를 촉진시켜 위장병에도 좋고, 건조한 목에 수분을 공급해 준다고 합니다.</span>
                <span>도라지차는 기침 및 가래처럼 기관지 질병을 개선하는데 효과적인 사포닌 성분이 면역력을 향상시켜주기</span>
                <span>때문에 목감기에 좋습니다. 그리고 도라지 특유의 씁쓸한 맛이 입맛을 돋우는 데에도 효과가 좋다고</span>
                <span>합니다.</span>
                <span>레몬차는 비타민C가 함유되어 있어 신진대사를 원활히 만들어주어 체온이 내려가는 걸 막아주고</span>
                <span>세균에 대한 저항력도 높이기 때문에 감기 예방에 효과적입니다.</span>
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
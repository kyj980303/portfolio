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
            <p>피부에 좋은 차</p>
            <div class="fbar"></div>
            <img src="./img/arrow.png">
        </div>
        <div class="fcontent2">
            <img src="./img/tstory3.png">
            <p>피부에 도움이 되는 차는 국화차, 매실차, 녹차, 율무차, 대나무 차입니다.</p>
            <p>
                <span>국화차는 혈액을 맑게 해주어 피부를 깨끗하게 해줍니다.</span>
                <span>또한, 배변 작용을 원활하게 하여 피부 트러블이 생기는 것을 방지해 줍니다.</span>
                <span>매실차는 해독작용으로 장을 튼튼하게 하여 설사나, 변비에 효과적이고 식중독을 예방해 줍니다.</span>
                <span>또한 매실은 화농성 여드름 치료에 좋습니다. 꾸준히 마시면 촉촉하고 탄력이 생겨 동안 피부를 </span>
                <span>가질 수 있습니다.</span>
                <span>녹차는 비타민C가 레몬의 5~6배 정도로 많이 함유되어 있어서 피로 회복이나, 피부미용에 아주</span>
                <span>좋습니다.</span>
                <span>율무차는 기미와 잡티 제거의 효과가 있습니다. 또한 노화 방지와 다이어트에도 도움을 줍니다.</span>
                <span>율무차는 분말 가루로 되어 파는 것보다 생식으로 율무를 마셔 주는 것이 좋습니다.</span>
                <span>하지만 율무는 수분을 많이 필요로 하는 곡물이기 때문에</span>
                <span>변비가 있거나 소변을 적게 보는 사람, 임산부는 자제하는 것이 좋습니다.</span>
                <span>대나무의 향과 고소한 맛이 나는 대나무 차는 은은하기 때문에 부담 없이 즐길 수 있는 차입니다.</span>
                <span>피부 보습에 좋은 차이기 때문에 건조함을 느끼는 사람들에게 좋고 눈의 부종과 통증을 완화시켜줘</span>
                <span>안과 질환에도 좋습니다.</span>
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
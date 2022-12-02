<%@ page contentType="text/html;charset=euc-kr" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="wodtj=device.width, inital-scale=1.0">
	<title>패스워드 찾기</title>
    <link rel="stylesheet" href="../hanzan/css/hanzan.css">
    <script src="js/jquery-3.5.1.min.js"></script>
    <script src="js/hanzan.js"></script>
	<script language="javascript" src="js_package.js"></script>
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
    <div class="findpw">
        <form method = "post" action="findIdResult.jsp" style ="margin-top:70px">
            <center>
            <table border=0 cellpadding=5 >
                <h1 style ="color: #333">FIND ID</h1>
                <tr>
                    <td><input type="text" name="name" class="findname" placeholder="이름"></td>
                    <td rowspan=2><a href="javascript:login_check()">
                </tr>
                <tr>
                    <td><input type="password" name="pass"  class="findid" placeholder="패스워드" onkeydown="onEnterSubmit()"></td> 
                </tr>
            </table> 
                <a href="findIdResult.jsp"><input type="submit" value="확인"></a>
                <a href="login.jsp"><input type="button" value="취소"></a>
            </center>
        </form>
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
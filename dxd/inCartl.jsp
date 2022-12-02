<%@ page contentType="text/html;charset=euc-kr"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="wodtj=device.width, inital-scale=1.0">
    <title>DXD Shoes</title>
    <link rel="stylesheet" href="../dxd/css/dxd.css">
    <script src="js/jquery-3.5.1.min.js"></script>
    <script src="js/dxd.js"></script>
</head>
<body>
	<header>
        <div class="logo"><a href="index.html"><img src="../dxd/img/logo.png"></a></div>
        <ul class="nav">
            <li class="main-menu"><a href="shoesl.jsp">SHOES</a></li>
            <li class="main-menu">
                <a href="collabol.jsp">COLLABORATION</a>
                <ul class="sub-menu hide">
                    <li><a href="collabol.jsp">NIKE X STUSSY</a></li>
                    <li><a href="collabol2.jsp">NIKE X OFF WHITE</a></li>
                    <li><a href="collabol3.jsp">NIKE X SUPREME</a></li>
                </ul><!--sub-menu-->
            </li>
            <li class="main-menu">
                <a href="socksl.jsp">ACC</a>
                <ul class="sub-menu hide">
                    <li><a href="socksl.jsp">SOCKS</a></li>
                    <li><a href="shoestiel.jsp">SHOES TIE</a></li>
                </ul><!--sub-menu--></li>
            </li>
            <li class="main-menu"><a href="communityl.jsp">COMMUNITY</a></li>
            <li class="main-menu"><a href="login.jsp">LOGIN</a></li>
            <li class="main-menu"><a href="login.jsp"><img src="../dxd/img/mypage.png"></a></li>
            <li class="main-menu"><a href="showCart.jsp"><img src="../dxd/img/cart.png"></a></li>
        </ul>
    </header>
<center>
<br><br><br> 
<font style="font-size:10pt;font-family:맑은 고딕">
		<p style="margin-top:300px;">상품 주문을 위해서는 로그인이 필요합니다! <br><br>	<a href="login.jsp" ><img src="./images/login.gif" border=0></a>
</font>
</center>

</body>
</html>

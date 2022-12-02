<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="wodtj=device.width, inital-scale=1.0">
    <title>DXD main</title>
    <link rel="stylesheet" href="../dxd/css/dxd.css">
    <script src="js/jquery-3.5.1.min.js"></script>
    <script src="js/dxd.js"></script>
	<script language="javascript" src="js_package.js"></script>
</head>
<body>
<%
	String id = (String)session.getAttribute("sid");  
%>
		<header>
        <div class="logo"><a href="index.html"><img src="../dxd/img/logo.png"></a></div>
        <ul class="nav">
            <li class="main-menu"><a href="shoes.jsp">SHOES</a></li>
            <li class="main-menu">
                <a href="collabo.html">COLLABORATION</a>
                <ul class="sub-menu hide">
                    <li><a href="collabo.html">NIKE X STUSSY</a></li>
                    <li><a href="collabo2.html">NIKE X OFF WHITE</a></li>
                    <li><a href="collabo3.html">NIKE X SUPREME</a></li>
                </ul><!--sub-menu-->
            </li>
            <li class="main-menu">
                <a href="socks.html">ACC</a>
                <ul class="sub-menu hide">
                    <li><a href="socks.html">SOCKS</a></li>
                    <li><a href="shoestie.html">SHOES TIE</a></li>
                </ul><!--sub-menu--></li>
            </li>
            <li class="main-menu"><a href="#">COMMUNITY</a></li>
            <li class="main-menu"><a href="index.html">LOGOUT</a></li>
            <li class="main-menu"><a href="login.jsp"><img src="../dxd/img/mypage.png"></a></li>
            <li class="main-menu"><a href="login.jsp"><img src="../dxd/img/cart.png"></a></li>
        </ul>
    </header>
</body>
</html>
<%@ page contentType="text/html;charset=euc-kr" pageEncoding="utf-8" %>
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
<%
	String id = (String)session.getAttribute("sid");          
%>
	<header>
        <div class="logo"><a href="index.jsp"><img src="../dxd/img/logo.png"></a></div>
        <ul class="nav">
            <li class="main-menu"><a href="shoes.jsp">SHOES</a></li>
            <li class="main-menu">
                <a href="collabo.jsp">COLLABORATION</a>
                <ul class="sub-menu hide">
                    <li><a href="collabo.jsp">NIKE X STUSSY</a></li>
                    <li><a href="collabo2.jsp">NIKE X OFF WHITE</a></li>
                    <li><a href="collabo3.jsp">NIKE X SUPREME</a></li>
                </ul><!--sub-menu-->
            </li>
            <li class="main-menu">
                <a href="socks.jsp">ACC</a>
                <ul class="sub-menu hide">
                    <li><a href="socks.jsp">SOCKS</a></li>
                    <li><a href="shoestie.jsp">SHOES TIE</a></li>
                </ul><!--sub-menu--></li>
            </li>
            <li class="main-menu"><a href="community.jsp">COMMUNITY</a></li>
            <li class="main-menu"><a href="logout.jsp">LOGOUT</a></li>
            <li class="main-menu"><a href="updateMember.jsp?id=<%=id%>"><img src="../dxd/img/mypage.png"></a></li>
            <li class="main-menu"><a href="showCart.jsp"><img src="../dxd/img/cart.png"></a></li>
        </ul>
    </header>
    <div class="shoesmain">
        <p>JUST DO IT</p>
    </div>
    <div class="basicShoes">
        <p class="sp">BASIC SHOES</p>
        <ul class="shoesPrd">
            <li>
                <a href="viewDetailProduct.jsp?prdNo=s1"><img src="../dxd/img/ss1.png"></a>
                <p>?????? ?????? AC</p>
                <p>78,000 ???</p>
            </li>
            <li>
                <a href="viewDetailProduct.jsp?prdNo=s2"><img src="../dxd/img/ss2.png"></a>
                <p>???????????? ??? ??????</p>
                <p>109,000 ???</p>
            </li>
            <li>
                <a href="viewDetailProduct.jsp?prdNo=s3"><img src="../dxd/img/ss3.png"></a>
                <p>????????????1 ?????????</p>
                <p>149,000 ???</p>
            </li>
            <li>
                <a href="viewDetailProduct.jsp?prdNo=s4"><img src="../dxd/img/ss4.png"></a>
                <p>??????????????????</p>
                <p>119,000 ???</p>
            </li>
            <li>
                <a href="viewDetailProduct.jsp?prdNo=s5"><img src="../dxd/img/ss5.png"></a>
                <p>???????????? 5?????????</p>
                <p>229,000 ???</p>
            </li>
            <li>
                <a href="viewDetailProduct.jsp?prdNo=s6"><img src="../dxd/img/ss6.png"></a>
                <p>???????????? 2021</p>
                <p>189,000 ???</p>
            </li>
            <li>
                <a href="viewDetailProduct.jsp?prdNo=s7"><img src="../dxd/img/ss7.png"></a>
                <p>?????? ????????????</p>
                <p>79,000 ???</p>
            </li>
            <li>
                <a href="viewDetailProduct.jsp?prdNo=s8"><img src="../dxd/img/ss8.png"></a>
                <p>?????? ?????????1</p>
                <p>109,000 ???</p>
            </li>
            <li>
                <a href="viewDetailProduct.jsp?prdNo=s9"><img src="../dxd/img/ss9.png"></a>
                <p>?????? ????????????2</p>
                <p>109,000 ???</p>
            </li>
            <li>
                <a href="viewDetailProduct.jsp?prdNo=s10"><img src="../dxd/img/ss10.png"></a>
                <p>????????? ?????? ?????? ???</p>
                <p>139,000 ???</p>
            </li>
            <li>
                <a href="viewDetailProduct.jsp?prdNo=s11"><img src="../dxd/img/ss11.png"></a>
                <p>?????? ????????? ??? ?????????</p>
                <p>139,000 ???</p>
            </li>
            <li>
                <a href="viewDetailProduct.jsp?prdNo=s12"><img src="../dxd/img/ss12.png"></a>
                <p>????????? GTS</p>
                <p>79,000 ???</p>
            </li>
        </ul>
    </div><!--basicShoes-->
    <footer>
        <ul class="icon">
            <li><img src="../dxd/img/insta.png"></li>
            <li><img src="../dxd/img/facebook.png"></li>
        </ul>
        <p>
            Address : Gangnam, Seoul, Korea / tel : 010-1212-3232 / E-mail : dxd@naver.com
            <span>Copyright : dxd.All rights reserved.</span>
        </p>
    </footer>
</body>
</html>
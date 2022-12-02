<%@ page contentType="text/html;charset=euc-kr" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="wodtj=device.width, inital-scale=1.0">
    <title>DXD collabo2</title>
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

    <div class="collabomain2">
        <p class="maintxt">
            <span style="font-family: 'HY견고딕';">2021</span>
            <span style="font-family: 'HY견고딕';">NIKE</span>
            <span style="font-family: 'HY견고딕';">X</span>
            <span style="font-family: 'HY견고딕';">OFF WHITE</span>
        </p>
    </div>
    
    <div class="collabo">
        <h1 style="font-family: 'HY견고딕';">OFF WHITE</h1>
        <div class="collabotxt">
            <p>
                <span>DESIGNER</span>
                <span>VIRGIL ABLOH</span>
            </p>
            <p>
                <span style="font-family: 'HY견고딕';">독특한 디자인의</span>
                <span style="font-family: 'HY견고딕';">고급 스트리트</span>
                <span style="font-family: 'HY견고딕';">웨어 브랜드</span>
            </p>
        </div>
        <img src="../dxd/img/collabooffd.png">
    </div><!--collabo-->
    
    <div class="collaboshoes2">
        <img class="collabos" src="../dxd/img/collabos2.png">
        <p style="font-family: 'HY견고딕';">React Hyperdunk</p>
        <p><a href="#"><span>자세히 보기</span></a></p>
    </div><!--collaboshoes-->

    <div class="nxs">
        <p class="nxsp" style="font-family: 'HY견고딕';">NIKE X OFF WHITE</p>
        <ul class="collaboshoesprd">
            <li>
                <a href="#"><img class="cprd" src="../dxd/img/no.png"></a>
                <div class="collatxt">
                    <p style="font-family: 'HY견고딕';">블래이져 미드</p>
                    <p>159,000원</p>
                    <p>7가지 색상</p>
                </div>
            </li>
            <li>
                <a href="#"><img class="cprd" src="../dxd/img/no2.png"></a>
                <div class="collatxt">
                    <p style="font-family: 'HY견고딕';">에어 프레스토</p>
                    <p>189,000원</p>
                    <p>3가지 색상</p>
                </div>
            </li>
            <li>
                <a href="#"><img class="cprd" src="../dxd/img/no3.png"></a>
                <div class="collatxt">
                    <p style="font-family: 'HY견고딕';">에어조던1</p>
                    <p>229,000원</p>
                    <p>3가지 색상</p>
                </div>
            </li>
            <li>
                <a href="#"><img class="cprd" src="../dxd/img/no4.png"></a>
                <div class="collatxt">
                    <p style="font-family: 'HY견고딕';">베이처맥스</p>
                    <p>229,000원</p>
                    <p>3가지 색상</p>
                </div>
            </li>
        </ul>
    </div><!--nxs-->

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
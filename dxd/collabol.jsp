<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="wodtj=device.width, inital-scale=1.0">
    <title>DXD collabo</title>
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
    <div class="collabomain">
        <p class="maintxt">
            <span style="font-family: 'HY?߰???';">2021</span>
            <span style="font-family: 'HY?߰???';">NIKE</span>
            <span style="font-family: 'HY?߰???';">X</span>
            <span style="font-family: 'HY?߰???';">STUSSY</span>
        </p>
    </div>

    <div class="collabo">
        <h1 style="font-family: 'HY?߰???';">STUSSY</h1>
        <div class="collabotxt">
            <p>
                <span>DESIGNER</span>
                <span>SHAWN STUSSY</span>
            </p>
            <p>
                <span style="font-family: 'HY?߰???';">?پ??? ?????ΰ?</span>
                <span style="font-family: 'HY?߰???';">??Ÿ???? ??????</span>
                <span style="font-family: 'HY?߰???';">?귣??</span>
            </p>
        </div>
        <img src="../dxd/img/collabostussyd.png">
    </div><!--collabo-->
    
    <div class="collaboshoes">
        <img class="collabos" src="../dxd/img/collabos.png">
        <p style="font-family: 'HY?߰???';">Air Zoom Spiridon Cage2</p>
        <p><a href="#"><span>?ڼ??? ????</span></a></p>
    </div><!--collaboshoes-->

    <div class="nxs">
        <p class="nxsp" style="font-family: 'HY?߰???';">NIKE X STUSSY</p>
        <ul class="collaboshoesprd">
            <li>
                <a href="viewDetailProduct.jsp?prdNo=s1"><img class="cprd" src="../dxd/img/ns1.png"></a>
                <div class="collatxt">
                    <p style="font-family: 'HY?߰???';">???? ?????? LE</p>
                    <p>280,000??</p>
                    <p>2???? ????</p>
                </div>
            </li>
            <li>
                <a href="#"><img class="cprd" src="../dxd/img/ns2.png"></a>
                <div class="collatxt">
                    <p style="font-family: 'HY?߰???';">???? ?? ???????? ??Ű??</p>
                    <p>209,000??</p>
                    <p>2???? ????</p>
                </div>
            </li>
            <li>
                <a href="#"><img class="cprd" src="../dxd/img/ns3.png"></a>
                <div class="collatxt">
                    <p style="font-family: 'HY?߰???';">????1 ?ο? ?Ľ?</p>
                    <p>499,000??</p>
                    <p>2???? ????</p>
                </div>
            </li>
            <li>
                <a href="#"><img class="cprd" src="../dxd/img/ns4.png"></a>
                <div class="collatxt">
                    <p style="font-family: 'HY?߰???';">???? ?????? ?? ??Ʈ??</p>
                    <p>139,000??</p>
                    <p>2???? ????</p>
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
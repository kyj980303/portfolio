<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="wodtj=device.width, inital-scale=1.0">
    <title>DXD socks</title>
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
    <div class="sk">
        <p>SOCKS</p>
    </div> 

    <div class="newSocks">
        <div class="socksText1">
            <p style="font-family:HY?߰???;"> 2021 NEW SOCKS</p>
        </div>

        <div class="colorsocks">
            <a href="#"><img src="img/todaypick.png"></a>
        </div>

        <div class="socksText2">
            <p style="font-family:HY?߰???;">TODAY PICKS</p>
        </div>

        <div class="socksText3">
             <p>?л????? ???????? ?????ϴ? ?縻</p>
        </div>
       
    </div>

    <div class="bestitem">
       
        <p style="font-family:HY?߰???;">BEST ITEM</p>
        
        <ul class="socks3">
            
            <li class="bal1">
                <a href="viewDetailSocksl.jsp?prdNo=so1"><img src="img/bestitem1.png" alt="???κ??? ?߰??? ?縻"></a>
                <div class="bal1text">
                    <p>???κ??? ?߰??? ?縻</p>
                    <p>1500??</p>
                </div>
            </li>
            
            <li class="bal1">
                <a href="viewDetailSocksl.jsp?prdNo=so2"><img src="img/bestitem2.png" alt="?÷? ???? ?縻"></a>
                <div class="bal1text">
                    <p>?÷? ???? ?縻</p>
                    <p>1500??</p>
                </div>
            </li>

            <li class="bal1">
                <a href="#"><img src="img/bestitem3.png" alt="?????? ?߸? ?縻"></a>
                <div class="bal1text">
                    <p>?????? ?߸? ?縻</p>
                    <p>1500??</p>
                </div>
            </li>
        </ul>

    </div>



    <div class="mainsocks">
       
        <p style="font-family:HY?߰???;">SOCKS</p>
        
        <ul class="socks4">
            
            <li class="bal2">
                <a href="#"><img src="img/socks1.png" alt="???κ??? ?߰??? ?縻"></a>
                <div class="bal1text2">
                    <p>??Ʈ ?????? ?縻</p>
                    <p>1500??</p>
                </div>
            </li>
            
            <li class="bal2">
                 <a href="#"><img src="img/socks2.png" alt="?÷? ???? ?縻"></a>
                <div class="bal1text2">
                    <p>???? ??Ÿ ?????縻</p>
                    <p>1500??</p>
                </div>
            </li>

            <li class="bal2">
                 <a href="#"><img src="img/socks3.png" alt="?????? ?߸? ?縻"></a>
                <div class="bal1text2">
                    <p>?????? ?????? ?縻</p>
                    <p>1500??</p>
                </div>
            </li>


            <li class="bal2">
                 <a href="#"><img src="img/socks4.png" alt="?????? ?߸? ?縻"></a>
                <div class="bal1text2">
                    <p>?????? ???? ?縻</p>
                    <p>1500??</p>
                </div>
            </li>

            
        </ul>


        <ul class="socks4">
            
            <li class="bal2">
                <a href="#"><img src="img/socks5.png" alt="ũ???????? ?縻"></a>
                <div class="bal1text2">
                    <p>ũ???????? ?縻</p>
                    <p>1500??</p>
                </div>
            </li>
            
            <li class="bal2">
                <a href="#"><img src="img/socks6.png" alt="???? ??Ʈ?????? ?縻"></a>
                <div class="bal1text2">
                    <p>???? ??Ʈ?????? ?縻</p>
                    <p>1500??</p>
                </div>
            </li>

            <li class="bal2">
                <a href="#"><img src="img/socks7.png" alt="???? ??Ʈ ?縻"></a>
                <div class="bal1text2">
                    <p>???? ??Ʈ ?縻 </p>
                    <p>1500??</p>
                </div>
            </li>


            <li class="bal2">
                <a href="#"><img src="img/socks8.png" alt="?????? ??Ʈ?????? ?縻"></a>
                <div class="bal1text2">
                    <p>?????? ??Ʈ?????? ?縻</p>
                    <p>1500??</p>
                </div>
            </li>

            
        </ul>



        <ul class="socks4">
            
            <li class="bal2">
                 <a href="#"><img src="img/socks9.png" alt="???ξ??? ?縻"></a>
                <div class="bal1text2">
                    <p>???ξ??? ?縻</p>
                    <p>1500??</p>
                </div>
            </li>
            
            <li class="bal2">
                 <a href="#"><img src="img/socks10.png" alt="?ƺ?ī?? ?縻"></a>
                <div class="bal1text2">
                    <p>?ƺ?ī?? ?縻</p>
                    <p>1500??</p>
                </div>
            </li>

            <li class="bal2">
                 <a href="#"><img src="img/socks11.png" alt="ȣ???? ?縻"></a>
                <div class="bal1text2">
                    <p>ȣ???? ?縻</p>
                    <p>1500??</p>
                </div>
            </li>


            <li class="bal2">
                <a href="#"><img src="img/socks12.png" alt="???̾Ƹ??? ???? ?縻"></a>
                <div class="bal1text2">
                    <p>???̾Ƹ??? ???? ?縻</p>
                    <p>1500??</p>
                </div>
            </li>

            
        </ul>

        

    </div>


    <footer>
        <ul class="icon">
            <li><a href="#"><img src="../dxd/img/insta.png"></a></li>
            <li><a href="#"><img src="../dxd/img/facebook.png"></a></li>
        </ul>
        <p>
            Address : Gangnam, Seoul, Korea / tel : 010-1212-3232 / E-mail : dxd@naver.com
            <span>Copyright : dxd.All rights reserved.</span>
        </p>
    </footer>
</body>
</html>
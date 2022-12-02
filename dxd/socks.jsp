<%@ page contentType="text/html;charset=euc-kr" pageEncoding="utf-8" %>
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
    <div class="sk">
        <p>SOCKS</p>
    </div> 

    <div class="newSocks">
        <div class="socksText1">
            <p style="font-family:HY견고딕;"> 2021 NEW SOCKS</p>
        </div>

        <div class="colorsocks">
            <a href="#"><img src="img/todaypick.png"></a>
        </div>

        <div class="socksText2">
            <p style="font-family:HY견고딕;">TODAY PICKS</p>
        </div>

        <div class="socksText3">
             <p>학생들과 사람들이 좋아하는 양말</p>
        </div>
       
    </div>

    <div class="bestitem">
       
        <p style="font-family:HY견고딕;">BEST ITEM</p>
        
        <ul class="socks3">
            
            <li class="bal1">
                <a href="viewDetailSocks.jsp?prdNo=so1"><img src="img/bestitem1.png" alt="레인보우 발가락 양말"></a>
                <div class="bal1text">
                    <p>레인보우 발가락 양말</p>
                    <p>1500원</p>
                </div>
            </li>
            
            <li class="bal1">
                <a href="viewDetailSocks.jsp?prdNo=so2"><img src="img/bestitem2.png" alt="컬러 수면 양말"></a>
                <div class="bal1text">
                    <p>컬러 수면 양말</p>
                    <p>1500원</p>
                </div>
            </li>

            <li class="bal1">
                <a href="#"><img src="img/bestitem3.png" alt="베이직 발목 양말"></a>
                <div class="bal1text">
                    <p>베이직 발목 양말</p>
                    <p>1500원</p>
                </div>
            </li>
        </ul>

    </div>



    <div class="mainsocks">
       
        <p style="font-family:HY견고딕;">SOCKS</p>
        
        <ul class="socks4">
            
            <li class="bal2">
                <a href="#"><img src="img/socks1.png" alt="레인보우 발가락 양말"></a>
                <div class="bal1text2">
                    <p>하트 베이직 양말</p>
                    <p>1500원</p>
                </div>
            </li>
            
            <li class="bal2">
                 <a href="#"><img src="img/socks2.png" alt="컬러 수면 양말"></a>
                <div class="bal1text2">
                    <p>퍼플 스타 수면양말</p>
                    <p>1500원</p>
                </div>
            </li>

            <li class="bal2">
                 <a href="#"><img src="img/socks3.png" alt="베이직 발목 양말"></a>
                <div class="bal1text2">
                    <p>스포츠 베이직 양말</p>
                    <p>1500원</p>
                </div>
            </li>


            <li class="bal2">
                 <a href="#"><img src="img/socks4.png" alt="베이직 발목 양말"></a>
                <div class="bal1text2">
                    <p>베이직 블랙 양말</p>
                    <p>1500원</p>
                </div>
            </li>

            
        </ul>


        <ul class="socks4">
            
            <li class="bal2">
                <a href="#"><img src="img/socks5.png" alt="크리스마스 양말"></a>
                <div class="bal1text2">
                    <p>크리스마스 양말</p>
                    <p>1500원</p>
                </div>
            </li>
            
            <li class="bal2">
                <a href="#"><img src="img/socks6.png" alt="퍼플 스트라이프 양말"></a>
                <div class="bal1text2">
                    <p>퍼플 스트라이프 양말</p>
                    <p>1500원</p>
                </div>
            </li>

            <li class="bal2">
                <a href="#"><img src="img/socks7.png" alt="블루 도트 양말"></a>
                <div class="bal1text2">
                    <p>블루 도트 양말 </p>
                    <p>1500원</p>
                </div>
            </li>


            <li class="bal2">
                <a href="#"><img src="img/socks8.png" alt="베이직 스트라이프 양말"></a>
                <div class="bal1text2">
                    <p>베이직 스트라이프 양말</p>
                    <p>1500원</p>
                </div>
            </li>

            
        </ul>



        <ul class="socks4">
            
            <li class="bal2">
                 <a href="#"><img src="img/socks9.png" alt="파인애플 양말"></a>
                <div class="bal1text2">
                    <p>파인애플 양말</p>
                    <p>1500원</p>
                </div>
            </li>
            
            <li class="bal2">
                 <a href="#"><img src="img/socks10.png" alt="아보카도 양말"></a>
                <div class="bal1text2">
                    <p>아보카도 양말</p>
                    <p>1500원</p>
                </div>
            </li>

            <li class="bal2">
                 <a href="#"><img src="img/socks11.png" alt="호랑이 양말"></a>
                <div class="bal1text2">
                    <p>호랑이 양말</p>
                    <p>1500원</p>
                </div>
            </li>


            <li class="bal2">
                <a href="#"><img src="img/socks12.png" alt="다이아몬드 패턴 양말"></a>
                <div class="bal1text2">
                    <p>다이아몬드 패턴 양말</p>
                    <p>1500원</p>
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
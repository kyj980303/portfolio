<%@ page contentType="text/html;charset=euc-kr" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="wodtj=device.width, inital-scale=1.0">
    <title>SHOES TIES</title>
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
    <div class="st" >
        <p>SHOES TIES</p>
    </div>  

    <div class="maed">
        <p class="mp">신발끈 매듭 묶는 방법 10가지</p>
        <ul class="maed2">
            <li class="bal3">
                <a href="https://blog.naver.com/cjy02120/222115838499" target="_blank"><img src="img/shape1.png" alt="기능성 깔창"></a>
                <p>별형</p>
            </li>
            <li class="bal3">
                <a href="https://blog.naver.com/cjy02120/222115838499" target="_blank"><img src="img/shape2.png" alt="골프화 전용 깔창"></a>
                <p>리본형</p>
            </li>
            <li class="bal3">
                <a href="https://blog.naver.com/cjy02120/222115838499" target="_blank"><img src="img/shape3.png"alt="등산화 전용깔창"></a>
                <p>꽈배기형 </p>
            </li>
            <li class="bal3">
                <a href="https://blog.naver.com/cjy02120/222115838499" target="_blank"><img src="img/shape4.png" alt="등산화 전용깔창"></a>
                <p>지그재그형 </p>
            </li>
            <li class="bal3">
                <a href="https://blog.naver.com/cjy02120/222115838499" target="_blank"><img src="img/shape5.png" alt="등산화 전용깔창"></a>
                <p>크로스형 </p>
            </li>
            <li class="bal3">
                <a href="https://blog.naver.com/cjy02120/222115838499" target="_blank"><img src="img/shape6.png" alt="등산화 전용깔창"></a>
                <p>고리형</p> 
            </li>
            <li class="bal3">
                <a href="https://blog.naver.com/cjy02120/222115838499" target="_blank"><img src="img/shape7.png" alt="등산화 전용깔창"></a>
                <p>사다리형 </p>
            </li>
            <li class="bal3">
                <a href="https://blog.naver.com/cjy02120/222115838499" target="_blank"><img src="img/shape8.png" alt="등산화 전용깔창"></a>
                <p>스파이더형 </p>
            </li>
            <li class="bal3">
                <a href="https://blog.naver.com/cjy02120/222115838499" target="_blank"><img src="img/shape9.png" alt="등산화 전용깔창"></a>
                <p>승마리본형 </p>
            </li>
            <li class="bal3">
                <a href="https://blog.naver.com/cjy02120/222115838499" target="_blank"><img src="img/shape10.png" alt="등산화 전용깔창"></a>
                <p>일자형 </p>
            </li>
        </ul>
    </div><!--maed-->

    <div class="shoestie">
        <p class="ss">INSOLE</p>
        <ul class="tie">
            <li class="bal1">
                <a href="#"><img src="img/insole1.png" alt="기능성 깔창"></a>
                <div class="bal1text">
                    <p>기능성 깔창</p>
                    <p>2000원</p>
                </div>
            </li>
            <li class="bal1">
                <a href="#"><img src="img/insole2.png" alt="골프화 전용 깔창"></a>
                <div class="bal1text">
                    <p>골프화 전용 깔창</p>
                    <p>2000원</p>
                </div>
            </li>
            <li class="bal1">
                <a href="#"><img src="img/insole3.png" alt="등산화 전용깔창"></a>
                <div class="bal1text">
                    <p>등산화 전용깔창 </p>
                    <p>2000원</p>
                </div>
            </li>
        </ul>
    </div>
        
    <div class="shoestie2">
        <p>SHOES TIE</p>
        <ul class="tie">
            <li class="bal1">
                <a href="#"><img src="img/tie1.png" alt="신축성왕 블랙 신발끈"></a>
                <div class="bal1text">
                    <p>신축성왕 블랙 신발끈</p>
                    <p>2000원</p>
                </div>
            </li>
            <li class="bal1">
                <a href="#"><img src="img/tie2.png" alt="브라운 베이직 신발"></a>
                <div class="bal1text">
                    <p>브라운 베이직 신발끈</p>
                    <p>2000원</p>
                </div>
            </li>
            <li class="bal1">
                <a href="#"><img src="img/tie3.png" alt="로프형 베이직 신발끈"></a>
                <div class="bal1text">
                    <p>로프형 베이직 신발끈 </p>
                    <p>2000원</p>
                </div>
            </li>
        </ul>
        <ul class="tie">
            <li class="bal1">
                <a href="#"><img src="img/tie4.png" alt="퍼플 리본 신발끈"></a>
                <div class="bal1text">
                    <p>퍼플 리본 신발끈</p>
                    <p>2000원</p>
                </div>
            </li>
            <li class="bal1">
                <a href="#"><img src="img/tie5.png" alt="옐로우 리본 신발끈"></a>
                <div class="bal1text">
                    <p>옐로우 리본 신발끈</p>
                    <p>2000원</p>
                </div>
            </li>
            <li class="bal1">
                <a href="#"><img src="img/tie6.png" alt="블루 매듭 신발끈"></a>
                <div class="bal1text">
                    <p>블루 매듭 신발끈 </p>
                    <p>2000원</p>
                </div>
            </li>
        </ul>
        <ul class="tie">
            <li class="bal1">
                <a href="#"><img src="img/tie7.png" alt="빨강 베이직 신발끈"></a>
                <div class="bal1text">
                    <p>빨강 베이직 신발끈</p>
                    <p>2000원</p>
                </div>
            </li>
            <li class="bal1">
                <a href="#"><img src="img/tie8.png" alt="베이직 패턴 신발끈"></a>
                <div class="bal1text">
                    <p>베이직 패턴 신발끈</p>
                    <p>2000원</p>
                </div>
            </li>
            <li class="bal1">
                <a href="#"><img src="img/tie9.png" alt=" 골드 베이직 신발끈"></a>
                <div class="bal1text">
                    <p>골드 베이직 신발끈 </p>
                    <p>2000원</p>
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
<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="wodtj=device.width, inital-scale=1.0">
    <title>DXD main</title>
    <link rel="stylesheet" href="../dxd/css/dxd.css">
    <script src="js/jquery-3.5.1.min.js"></script>
    <script src="js/dxd.js"></script>
</head>
<body>
<%
     //   �α��� ���¸� �����ϱ� ���Ͽ�, sid�� ����Ǿ��� ������ ID���� 
     //   session ��ü�κ��� �����ͼ� ���� id�� �����Ŵ (loginOK.jsp�� 43��κ� Ȯ�ο��!)
	String id = (String)session.getAttribute("sid");  
	// String id = session.getAttribute("sid").toString(); ��  ������
                                                                                         
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

    <div class="main">
        <video loop="" autoplay="" muted="" width="100%">
            <source src="../dxd/ad.mp4" type="video/mp4">
        </video>
    </div>

    <div class="dxdintroduce">
        <img src="../dxd/img/mainnike.png">
        <img src="../dxd/img/stussydesigner.png">
        <img src="../dxd/img/supremedesigner.png">
        <img src="../dxd/img/offwhitedesigner.png">
        <div class="introtxt">
            <p>
                <span>DXD</span>
                <span>Designer</span> 
                <span>X</span>
                <span>Designer</span>
            </p>
        </div><!--introtxt-->
    </div><!--dxdintroduce-->

    <div class="concept">
        <img src="../dxd/img/concept1.png">
        <img src="../dxd/img/concept2.png">
        <div class="contxt">
            <p>Our concept</p>
            <p>����� ����Ű �귣��� ���� �ݶ���<span>�귣�� �ȭ�� �Ǹ��ϴ� ����Ʈ��</span>
            <span>������, ����ȭ��Ʈ, ������ �귣��� �Բ��մϴ�.</span></p>
        </div>
    </div><!--concept--> 

    <div class="basicNew">
        <p>BASIC NEW</p>
        <ul class="basic1">
            <li><img src="../dxd/img/basicnew1.png"></li>
            <li class="basictxt">
                <p>����Ű ��ũ ���� ��</p>
                <p>80��� �� �������� �Ϻ��ϰ� ���ؼ��� ����Ű ��ũ ���̷���
                    <span>Ŭ���� ���� ž �����ΰ� ����Ƽ�� ����, ���� ��â�� ����� �� DNA��</span>
                    <span>����ϸ鼭 �������� �ڽŰ��� ǥ���� �ݴϴ�.</span>
                </p>
                <p><a href="viewDetailProduct.jsp?prdNo=s10"><span>�ڼ��� ����</span></a></p>
            </li>
        </ul>
        <ul class="basic1">
            <li><img src="../dxd/img/basicnew2.png"></li>
            <li class="basictxt">
                <p>�������� 5��Ʈ��</p>
                <p>������ �ż��ϸ� �� ����޴� �������� 5��Ʈ��
                    <span>�������� 5��Ʈ�δ� ������� ���� ������Ʈ�Ǿ����ϴ�.</span>
                    <span>�������� 5��Ʈ�δ� 1990�� Ŭ���� ��� ��ġ�˴ϴ�.</span>
                </p>
                <p><a href="viewDetailProduct.jsp?prdNo=s5"><span>�ڼ��� ����</span></a></p>
            </li>
        </ul>
        <ul class="basic1">
            <li><img src="../dxd/img/basicnew3.png"></li>
            <li class="basictxt">
                <p>�������� 5��Ʈ��</p>
                <p>������ �ż��ϸ� �� ����޴� �������� 5��Ʈ��
                    <span>�������� 5��Ʈ�δ� ������� ���� ������Ʈ�Ǿ����ϴ�.</span>
                    <span>�������� 5��Ʈ�δ� 1990�� Ŭ���� ��� ��ġ�˴ϴ�.</span>
                </p>
                <p><a href="viewDetailProduct.jsp?prdNo=s6"><span>�ڼ��� ����</span></a></p>
            </li>
        </ul>
    </div><!--basiNew-->

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
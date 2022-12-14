<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>

<meta charset="utf-8">
    <meta name="viewport" content="wodtj=device.width, inital-scale=1.0">
    <title>DXD 회원 정보 수정</title>
    <link rel="stylesheet" href="../dxd/css/dxd.css">
    <script src="js/jquery-3.5.1.min.js"></script>
    <script src="js/dxd.js"></script>
	<script language="javascript" src="js_package.js"></script>

<body>
<%
 try{
	String DB_URL="jdbc:mysql://localhost:3306/dxd";    //  접속DB명은 project임에 유의!
    String DB_ID="multi";  
    String DB_PASSWORD="abcd"; 
 	 
	Class.forName("org.gjt.mm.mysql.Driver"); 
 	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	request.setCharacterEncoding("euc-kr");
	String pNo = request.getParameter("prdNo");   //  상세조회하고자 하는 상품번호를 넘겨받아옴

    String jsql = "select * from goods where prdNo = ?";   
	PreparedStatement pstmt  = con.prepareStatement(jsql);
	pstmt.setString(1, pNo);

	ResultSet rs = pstmt.executeQuery();
    rs.next();

	String no = rs.getString("prdNo");
    String name =  rs.getString("prdName");	
	int price =  rs.getInt("prdPrice");
	String description =  rs.getString("prdDescription");
%>
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
	<form name= "product"  method="post">   
        <ul class="viewDetail">
            <li class="dimg"><a href="javascript:enlarge()"><img src="./img/<%=no%>.png"></a></li>
            <li class="detailTxt">
                <p>상품번호 <%=no%></p>
                <p style="font-family: 'HY견고딕';"><%=name%></p>
                <p><%=description%></p>
                <p style="font-family: 'HY견고딕';"><%=price%> 원</p>
                <p style="font-family: 'HY견고딕';">
                    수량 <input class="num" type="text" name="qty" size="7" value="1" onblur="javascript:amountCheck();">
                    <input type="button" value="+" onClick="amountPlus();">
                    <input type="button" value="-" onClick="amountMinus();">
                </p>
				<p class="bar"></p>
                <p>
                    <img class="directimg" src="./img/directorder.png" onClick="javascript:directOrd()" alt="바로 구매하기"> 
                </p>
                <p>
                    <img src="./img/incart.png" onClick="javascript:inCart()" alt="장바구니 담기">
                    <img src="./img/wish.png" onClick="javascript:inCart()" alt="위시리스트">
                </p>
            </li>
        </ul>
	</form>
	<div class ="sdetail">
        <p class="sdt" style= "font-family:HY견고딕">
            SNEAKERS<span>CASUAL</span><span>SHOES</span><span>GOOD STUFF</span><span><%=name%></span>
        </p>
        <img class="sdt1" src="./img/shoes<%=no%>.png">
        <p class="sdt2"style= "font-family:HY견고딕">
            <%=name%><span>튼튼하게 스티치 저리된 오버레이와</span>
            <span>깔끔한 마감 처리, 적당한 광택감으로 빛나는</span>
            <span>존재감을 발휘해보세요.</span>
        </p>
        <img class="sdt3" src="./img/shoes2<%=no%>.png">
    </div>

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
<%
    } catch(Exception e) {
		out.println(e);
}
%>
</center>
</body>
</html>
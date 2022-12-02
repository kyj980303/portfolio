<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>

<meta charset="utf-8">
    <meta name="viewport" content="wodtj=device.width, inital-scale=1.0">
    <title>DXD ȸ�� ���� ����</title>
    <link rel="stylesheet" href="../dxd/css/dxd.css">
    <script src="js/jquery-3.5.1.min.js"></script>
    <script src="js/dxd.js"></script>
	<script language="javascript" src="js_package.js"></script>

<body>
<%
 try{
	String DB_URL="jdbc:mysql://localhost:3306/dxd";    //  ����DB���� project�ӿ� ����!
    String DB_ID="multi";  
    String DB_PASSWORD="abcd"; 
 	 
	Class.forName("org.gjt.mm.mysql.Driver"); 
 	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	request.setCharacterEncoding("euc-kr");
	String pNo = request.getParameter("prdNo");   //  ����ȸ�ϰ��� �ϴ� ��ǰ��ȣ�� �Ѱܹ޾ƿ�

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
	<form name= "product"  method="post">   
        <ul class="viewDetail">
            <li class="dimg"><a href="javascript:enlarge()"><img src="./img/<%=no%>.png"></a></li>
            <li class="detailTxt">
                <p>��ǰ��ȣ <%=no%></p>
                <p style="font-family: 'HY�߰���';"><%=name%></p>
                <p><%=description%></p>
                <p style="font-family: 'HY�߰���';"><%=price%> ��</p>
                <p style="font-family: 'HY�߰���';">
                    ���� <input class="num" type="text" name="qty" size="7" value="1" onblur="javascript:amountCheck();">
                    <input type="button" value="+" onClick="amountPlus();">
                    <input type="button" value="-" onClick="amountMinus();">
                </p>
				<p class="bar"></p>
                <p>
                    <img class="directimg" src="./img/directorder.png" onClick="javascript:directOrd()" alt="�ٷ� �����ϱ�"> 
                </p>
                <p>
                    <a href="showCart.jsp"><img src="./img/incart.png" onClick="javascript:inCart()" alt="��ٱ��� ���"></a>
                    <img src="./img/wish.png" onClick="javascript:inCart()" alt="���ø���Ʈ">
                </p>
            </li>
        </ul>
	</form>
	<div class ="sdetail">
        <p class="sdt" style= "font-family:HY�߰���">
            SNEAKERS<span>CASUAL</span><span>SHOES</span><span>GOOD STUFF</span><span><%=name%></span>
        </p>
        <img class="sdt1" src="./img/shoes<%=no%>.png">
        <p class="sdt2"style= "font-family:HY�߰���">
            <%=name%><span>ưư�ϰ� ��Ƽġ ������ �������̿�</span>
            <span>����� ���� ó��, ������ ���ð����� ������</span>
            <span>���簨�� �����غ�����.</span>
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
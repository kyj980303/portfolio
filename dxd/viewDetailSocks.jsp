<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>

    <meta charset="utf-8">
    <meta name="viewport" content="wodtj=device.width, inital-scale=1.0">
     <title>DXD socks</title>
     <link rel="stylesheet" href="../dxd/css/dxd.css"> 
     <script src="js/jquery-3.5.1.min.js"></script>
     <script src="js/dxd.js"></script>

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
                <p>��ǰ��ȣ <%=no%></p>
                <p style="font-family: 'HY�߰��';"><%=name%></p>
                <p><%=description%></p>
                <p style="font-family: 'HY�߰��';"><%=price%> ��</p>
                <p style="font-family: 'HY�߰��';">
                    ���� <input class="num" type="text" name="qty" size="7" value="1" onblur="javascript:amountCheck();">
                    <input type="button" value="+" onClick="amountPlus();">
                    <input type="button" value="-" onClick="amountMinus();">
                </p>
				<p class="bar"></p>
                <p>
                    <img class="directimg" src="./img/directorder.png" onClick="javascript:directOrd()" alt="�ٷ� �����ϱ�"> 
                </p>
                <p>
                    <img src="./img/incart.png" onClick="javascript:inCart()" alt="��ٱ��� ���"></a>
                    <img src="./img/wish.png" onClick="javascript:inCart()" alt="���ø���Ʈ">
                </p>
            </li>
        </ul>
	</form>
          
        <div class="viewsocks2">
            <a href="#"><img src="img/socmain<%=no%>.png"></a>
            <div class="viewsockstext">
                <p>DAILY</p>
                <p style="font-family:HY�߰��;">SOCKS</p>
                <p>
                    <span>�˷ϴ޷� ��Ÿ�ϸ�����</span>
                    <span> ���ϸ� �縻</span>
                </p>
                
            </div>
        </div>
        <div class="viewsockstext2">
            <p style="font-family:HY�߰��;">DETALES</p>
            <div class="viewsocksimg1">
                <a href="#"><img src="img/soc<%=no%>.png"></a>
            </div>

            <div class="viewsocksimg2">
                <a href="#"><img src="img/soc2<%=no%>.png"></a>
            </div>
        </div>
        <div class="viewsockstext3">
            <p style="font-family:HY�߰��;">SPAN DECKS</p>
            <p><span>���ǵ����� ȿ���� ���뼺 ��� ����</span> 
                <span>ũ������ ������(Creora Fresh)��</span>
                <span>����� ���� �ð� ���� �� �߻��ϴ� </span>
                <span> ���븦 ���̰� �������� ���ӽ����ش�.</span>
            </p>
        </div>
        <div class="viewsockstext4">
            <p style="font-family:HY�߰��;">CASUAL SOCKS</p>
            <p><span>źź�ϰ� § ĳ�־� �轺.</span> 
                <span> �� ����� �ε巯�� ���밨</span>
            </p>     
        </div>
        <div class="viewsocksimg3">
            <a href="#"><img src="img/soc3<%=no%>.png"></a>
            <div class="viewsockstext6">
                <p style="font-family:HY�߰��;">DOWN DETALE</p>
                <p><span>�ٴ��� �������� �β��� ¥���� </span> 
                    <span>�׸� ���� �������� ��Ŵ��� �����ϸ�</span>
                    <span>���ÿ� ����� ���밨�� �����Ѵ�</span>
                </p>
            </div>
            <div class="viewsockstext7">
                <p style="font-family:HY�߰��;">MATARIALS</p>
                <p><span>�� 38% ���������� 7%</span> 
                    <span>�����췹ź 5% ���Ϸ� 5% </span>
                </p>
            </div>
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
	<%
    } catch(Exception e) {
		out.println(e);
}
%>
</body>
</html>
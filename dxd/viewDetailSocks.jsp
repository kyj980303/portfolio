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
                    <img src="./img/incart.png" onClick="javascript:inCart()" alt="장바구니 담기"></a>
                    <img src="./img/wish.png" onClick="javascript:inCart()" alt="위시리스트">
                </p>
            </li>
        </ul>
	</form>
          
        <div class="viewsocks2">
            <a href="#"><img src="img/socmain<%=no%>.png"></a>
            <div class="viewsockstext">
                <p>DAILY</p>
                <p style="font-family:HY견고딕;">SOCKS</p>
                <p>
                    <span>알록달록 스타일리쉬한</span>
                    <span> 데일리 양말</span>
                </p>
                
            </div>
        </div>
        <div class="viewsockstext2">
            <p style="font-family:HY견고딕;">DETALES</p>
            <div class="viewsocksimg1">
                <a href="#"><img src="img/soc<%=no%>.png"></a>
            </div>

            <div class="viewsocksimg2">
                <a href="#"><img src="img/soc2<%=no%>.png"></a>
            </div>
        </div>
        <div class="viewsockstext3">
            <p style="font-family:HY견고딕;">SPAN DECKS</p>
            <p><span>스판덱스는 효성의 소취성 기능 사인</span> 
                <span>크레오라 프레시(Creora Fresh)를</span>
                <span>사용해 오랜 시간 착용 시 발생하는 </span>
                <span> 악취를 줄이고 쾌적함을 지속시켜준다.</span>
            </p>
        </div>
        <div class="viewsockstext4">
            <p style="font-family:HY견고딕;">CASUAL SOCKS</p>
            <p><span>탄탄하게 짠 캐주얼 삭스.</span> 
                <span> 땀 흡수와 부드러운 착용감</span>
            </p>     
        </div>
        <div class="viewsocksimg3">
            <a href="#"><img src="img/soc3<%=no%>.png"></a>
            <div class="viewsockstext6">
                <p style="font-family:HY견고딕;">DOWN DETALE</p>
                <p><span>바닥은 이중으로 두껍게 짜여진 </span> 
                    <span>테리 파일 조직으로 쿠셔닝을 제공하며</span>
                    <span>동시에 편안한 착용감을 보장한다</span>
                </p>
            </div>
            <div class="viewsockstext7">
                <p style="font-family:HY견고딕;">MATARIALS</p>
                <p><span>면 38% 폴리에스터 7%</span> 
                    <span>폴리우레탄 5% 나일론 5% </span>
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
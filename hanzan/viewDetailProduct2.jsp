<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="wodtj=device.width, inital-scale=1.0">
    <title>한잔 명차</title>
    <link rel="stylesheet" href="../hanzan/css/hanzan.css">
    <script src="js/jquery-2.2.4.min.js"></script>
    <script src="js/hanzan.js"></script>
	<script language="javascript" src="js_package.js"></script>

</head>
<body onload="init();">
<script language="JavaScript">

var sell_price;
var qty;

function init () {
	sell_price = document.product.sell_price.value;
	qty = document.product.qty.value;
	document.product.sum.value = sell_price;
	change();
}
function change () {
	obj = document.product.qty;
	sum = document.product.sum;

		if (obj.value < 0) {
			obj.value = 0;
		}
	sum.value = parseInt(obj.value) * sell_price;
	sum.value = comma(uncomma(sum.value));
}  

 function comma(str) {
     str = String(str);
     return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
 }

 function uncomma(str) {
     str = String(str);
     return str.replace(/[^\d]+/g, '');
 }
</script>
    <%
     //   로그인 상태를 유지하기 위하여, sid에 저장되었던 접속한 ID값을 
     //   session 객체로부터 가져와서 변수 id에 저장시킴 (loginOK.jsp의 43행부분 확인요망!)
   String id = (String)session.getAttribute("sid"); 
   // String id = session.getAttribute("sid").toString(); 와  동일함
                                                                                         
%>
    <header>
        <div class="logo">
		<%if(id == "" || id == null){%>
         <a href="index.html">
      <%} else {%>
         <a href="index.jsp">
      <%}%>
		<img src="../hanzan/img/logo.png"></a></div>
        <ul class="nav">
            <li class="main-menu"><a href="teastory.jsp">차 이야기</a></li>
            <li class="main-menu">
                <a href="#">차 가게</a>
                <ul class="sub-menu1 hide">
                    <li><a href="subn.jsp">녹차/발효차/홍차</a></li>
                    <li><a href="subm.jsp">허브티(무카페인)</a></li>
                    <li><a href="subb.jsp">블랜디드티</a></li>
                </ul><!--sub-menu-->
            </li>
            <li class="main-menu">
				<a href="#">다과</a>
                <ul class="sub-menu3 hide">
                    <li><a href="desert.jsp">한과</a></li>
                    <li><a href="desert2.jsp">화과자</a></li>
                </ul><!--sub-menu-->
			</li>
            <li class="main-menu">
                <a href="#">다구</a>
                <ul class="sub-menu2 hide">
                    <li><a href="teazan.jsp">찻잔</a></li>
                    <li><a href="teapot.jsp">티팟</a></li>
                </ul><!--sub-menu-->
            </li>
            <li class="main-menu"><a href="haru.jsp">하루한잔</a></li>
			<li class="main-menu"><%if(id == "" || id == null){%>
                           <a href="login.html"> LOGIN
                        <%} else {%>
                           <a href="logout.jsp"> LOGOUT 
                        <%}%></a></li>
            <li class="main-menu"><a href="mypage.jsp"><img src="../hanzan/img/mypage.png"></a></li>
            <li class="main-menu"><a href="showCart.jsp"><img src="../hanzan/img/cart.png"></a></li>
        </ul>
    </header>
	<%
 try{
	String DB_URL="jdbc:mysql://localhost:3306/hanzan";    //  접속DB명은 project임에 유의!
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
    String name = rs.getString("prdName");	
	int price = rs.getInt("prdPrice");
	String description = rs.getString("prdDescription");
%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<form name= "product"  method="post">   
        <ul class="viewDetail">
            <li class="dimg"><a href="javascript:enlarge()"><img src="./img/<%=no%>.png"></a></li>
            <li class="detailTxt">
                <p style="font-family: '굴림';">상품번호 <%=no%></p>
				<p><input type="hidden" name="prdNo" value="<%=no%>"></p>
                <p style="font-family: 'HY견고딕';"><%=name%></p>
                <p style="font-family: '굴림';"><%=description%></p>
                <p style="font-family: 'HY견고딕';"><fmt:formatNumber value="<%=price%>" type="number"/> 원</p>
                <p>
                    <p style="float:left; position:relative; top:-43px; left:370px;">수량 <input type="hidden" name="sell_price" value="<%=price%>"></p>
					<input class="num" type="text" name="qty" size="7" value="1" onblur="javascript:amountCheck();"onchange="change();"style="position:relative; top:-45px; left:370px;">
                    <input type="button" value="-" onClick="amountMinus();" style="width:18;height:16;position:relative; top:-45px; left:330px;">
                    <input type="button" value="+" onClick="amountPlus();" style="width:18;height:16;position:relative; top:-45px; left:330px;">
                </p>
                <select style="position:relative; top:-45px;">
                    <option>쇼핑백</option>
                    <option>선택 안함</option>
                </select>
                <p class="bar" style="position:relative; top:-45px;"></p>
                <p style="position:relative; top:-45px;font-size:20px;">총 상품금액 <span><input name="sum" size="11" readonly style = "border:none;font-size:26px;width:90px;color:#88a736; margin-left:305px;">원</span></p>
                <p>
                    <img class="directimg" src="./img/directorder.png" onClick="javascript:directOrd()" alt="바로 구매하기"> 
                </p>
                <p>
                    <img src="./img/incart.png" onClick="javascript:inCart()" style="margin-right:20px;" alt="장바구니 담기">
                    <img src="./img/wish.png" onClick="javascript:favorit()" alt="위시리스트"></a>
                </p>
            </li>
        </ul>
	</form>
    
    <div class ="mdetail">
		<img src="./img/detail<%=no%>.png">
        <div class="mdetailtxt">
            <p><%=name%> 10개입</p>
            <p>
                <span>피라미드 티백이 하나씩</span>
                <span>포장되어있습니다.</span>
                <span>한잔의 티백은 일반 티백과는 달리,</span>
                <span>따뜻한 물이 더 잘 투과되는 재질로</span>
                <span>차가 더욱 잘 우러납니다.</span>
            </p>
        </div>
	</div>
	<div class="delicious">
        <p class="delicioustitle">한잔 티를<span>더 맛있게 즐기는 방법</span></p>
        <ul class="deliciousimg">
            <li>
                <img src="./img/first.png">
                <p>차잎준비</p>
                <p>1인 1피라미드 티백을 준비합니다.</p>
            </li>
            <li>
                <img src="./img/second.png">
                <p>찻물준비</p>
                <p>대용차는 뜨거운 물에도 마시기 쉬운차입니다.<span>90도의 물을 150ml준비해주세요.</span></p>
            </li>
            <li>
                <img src="./img/third.png">
                <p>기다린 후 음용</p>
                <p>2분간 천천히,<span>찻물이 물들어가는 것을 지켜보세요.</span></p>
            </li>
        </ul>
    </div>
    <div class="size">
        <img src="./img/size<%=no%>.png">
        <p>상품 상자 안에 가로 99mm 세로 86mm의 티백으로 구성되어 있습니다.</p>
    </div>
    
    <div class="categorybest">
        <p class="ctgtitle">BEST 상품</p>
        <ul class="ctgbest">
            <li>
                <a href="viewDetailProduct2.jsp?prdNo=N4"><img src="./img/subnbest1.png"></a>
                <p>찬물녹차<span>9,000원</span></p>
            </li>
            <li>
                <a href="viewDetailProduct2.jsp?prdNo=N2"><img src="./img/subnbest2.png"></a>
                <p>덖음차<span>15,000원</span></p>
            </li>
            <li>
                <a href="viewDetailProduct2.jsp?prdNo=N5"><img src="./img/subnbest3.png"></a>
                <p>제주 화산 우롱차<span>9,500원</span></p>
            </li>
            <li>
                <a href="viewDetailProduct2.jsp?prdNo=N3"><img src="./img/subnbest4.png"></a>
                <p>제주숲홍차<span>15,000원</span></p>
            </li>
        </ul>
    </div>
    <footer>
        <ul class="icon">
            <li><a href = "https://www.instagram.com/"><img src="../hanzan/img/insta.png"></a></li>
            <li><a href = "https://www.facebook.com/"><img src="../hanzan/img/facebook.png"></a></li>
        </ul>
        <p><span><a href="adminlogin.jsp">관리자 로그인</a></span>
            Address : Gangnam, Seoul, Korea / tel : 010-1212-3232 / E-mail : hanzan@naver.com
            <span>Copyright : hanzan.All rights reserved.</span>
        </p>
    </footer>
	<%
    } catch(Exception e) {
      out.println(e);
}
%>
</body>
</html>






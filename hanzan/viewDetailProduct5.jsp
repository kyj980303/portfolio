<%@ page contentType="text/html;charset=utf-8" %>
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
	String DB_URL="jdbc:mysql://localhost:3306/hanzan";   
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
        <div class="mdetailtxt" style = "margin-top:120px">
            <p><%=name%></p>
            <p>
                <span>편안함이 느껴지는 두께와 </span>
                <span>완만한 형태의 찻잔은 손가락에 딱 맞는 </span>
                <span>알맞은 크기의 손잡이와 함께 </span>
                <span>마실 때마다 기분 좋은 느낌을 </span>
                <span>선사합니다.</span>
            </p>
        </div>
	</div>
	<div class="delicious">
        <p class="delicioustitle" style="margin-left:-40px; margin-top:-70px"><%=name%><span>기능성</span></p>
        <ul class="deliciousimg">
            <li>
                <img src="./img/jfirst.png">
                <p>전자레인지</p>
                <p>내열유리로 되어있어 전자레인지<span>사용이 가능합니다.</span></p>
            </li>
            <li>
                <img src="./img/jsecond.png" style="margin-left:15px;">
                <p>손잡이</p>
                <p>둥근 굴곡으로 디자인한 손잡이는 손이<span>미끄러지지 않게 도와줍니다.</span></p>
            </li>
            <li>
                <img src="./img/jthird.png">
                <p>차 우리기</p>
                <p>최대 120도까지 가능하여 티백이 잘 <span>우러날 수 있도록 도와줍니다. </span></p>
            </li>
        </ul>
    </div>
    <div class="size">
        <img src="./img/size<%=no%>.png">
        <p>가로 80* 세로 100* 높이 100로 되어있습니다. (단위 mm)</p>
    </div>
    
    <div class="categorybest">
        <p class="ctgtitle">카테고리 베스트 상품</p>
        <ul class="ctgbest">
            <li>
                <a href="viewDetailProduct5.jsp?prdNo=J1"><img src="./img/jbest1.png"></a>
                <p>화이트 베이직 티잔<span>25,000원</span></p>
            </li>
            <li>
                <a href="viewDetailProduct5.jsp?prdNo=J9"><img src="./img/jbest2.png"></a>
                <p>핑크 진주 조개 티잔<span>30,000원</span></p>
            </li>
            <li>
                <a href="viewDetailProduct5.jsp?prdNo=J3"><img src="./img/jbest3.png"></a>
                <p>파스텔색 티잔<span>30,000원</span></p>
            </li>
            <li>
                <a href="viewDetailProduct5.jsp?prdNo=J6"><img src="./img/jbest4.png"></a>
                <p>투명 베이직 티잔<span>20,000원</span></p>
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






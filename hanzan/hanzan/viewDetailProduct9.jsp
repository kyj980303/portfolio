<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
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
    <div class ="gdetail">
        <p class="gp">다양하게 만나는 하루한잔</p>
        <div class="gbox1"><img src="./img/everyG2.png"></div>
        <div class="gbox2">
            <p>랜덤으로 다양한 티를 <span>맛보는 하루한잔</span></p>
            <p>매월 <span class="pd">20일</span>에 정기 결제됩니다. 
            <span>결제일은 변경 가능하며, 결제되기</span>
            <span><span class="pd">3일 전</span> 결제 알림 문자를 보내드립니다.</span>
            <span><span class="pd2">[이번 달 구독이 힘들 것 같다면 언제든</span></span>
            <span><span class="pd2">'쉬어가기'가 가능합니다.]</span></span>
            <p>매월<span class="pr">25,000원</span></p>
        </div>
    </div>
    <div class="compose">
        <img src="./img/detailG2.png">
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
        <p>가로 276* 세로 32* 높이 293의 소프트케이스로 되어있습니다. (단위 mm)</p>
    </div>
    
    <div class="guide">
        <h1>이용 안내 및 유의사항</h1>
        <p>- 결제일을 다음 달로 변경하신 경우, 기존에 선택한 구성으로 배송되지 않고, 다음 달 구성으로 배송됩니다.</p>
        <p>- 다음달 구성 선택은 전월 1일~25일 사이에 선택 가능합니다. (배송 상품은 결제일 해당 월 기준)</p>
        <p>- 매월 구성되는 상품은 1개의 세트입니다. 구성품 일부를 다른 상품으로 교체가 불가합니다.</p>
        <p>- 각 상품별 유통기한이 상이합니다. 상품 뒷면에 표기된 유통기한을 확인 해주세요.</p>
        <p>- 매월 26일부터 말일까지는 다음 달 준비 기간으로 결제가 어렵습니다.</p>
        <p>- 자동 결제일 및 배송지 변경은 기존 결제일 기준 2일 전까지만 가능합니다.</p>
        <p>- 최초 결제 완료 후 정기배송 해지 전까지는 매월 자동 결제됩니다. (최초 결제 일자 기준)</p>
        <p>- 주문취소는 주문 접수, 결제 완료 단계에서만 신청이 가능하며 즉시 처리됩니다.</p>
        <p>- 주문취소 처리 완료 후 환불금액은 2~3일 내 결제한 정보로 환불됩니다.</p>
        <p>- 교환 신청은 주문한 상품이 잘못 배송 되었거나 배송된 상품에 하자가 있을 경우 가능합니다.</p>
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






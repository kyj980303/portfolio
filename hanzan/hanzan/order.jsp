<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="wodtj=device.width, inital-scale=1.0">
    <title>hanzan main</title>
    <link rel="stylesheet" href="../hanzan/css/hanzan.css">
    <script src="js/jquery-2.2.4.min.js"></script>
    <script src="js/hanzan.js"></script>
    <script language="javascript" src="js_package.js"></script>
	<script type = "text/javascript" src = "https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
<body>
<script language="javascript" >
function zipCheck()
{
	window.open("zipCheck.jsp", "win", "width=600, height=200, scrollbars=yes, status=yes");
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
      <img src="../hanzan/img/logo.png" style="margin-top:20px"></a></div>
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
<script language="javascript" src="js_package.js"></script>

<center>
<div class="cart">
        <p class="cartt" style="width: 647px; text-align: left; float: left; font-size: 52px; font-family: G마켓 산스 TTF;">주문서작성/결제</p>
        <div class="icons">
            <ul class="carticon">
                <li><a href="showCart.jsp"><img src="./img/carticon2.png"></a></li>
                <li><p style="font-size: 16px; font-family: G마켓 산스 TTF; color: #000; margin-top: 20px; margin-left: 14px;">장바구니</p></li>
            </ul>
            <ul class="ordericon">
                <li><a href="#"><img src="./img/ordericon2.png"></a></li>
                <li><p style="font-size: 16px; font-family: G마켓 산스 TTF; color: #000; margin-top: 20px; margin-left: 14px;">주문서작성/결제</p></li>
            </ul>
            <ul class="orderokicon">
                <li><a href="#"><img src="./img/orderokicon.png"></a></li>
                <li><p style="font-size: 16px; font-family: G마켓 산스 TTF; color: #000; margin-top: 20px; margin-left: 14px;">결제완료</p></li>
            </ul>
        </div>
    </div>

<%
try {
     String DB_URL="jdbc:mysql://localhost:3306/hanzan";    // 접속 DB는 project
     String DB_ID="multi"; 
     String DB_PASSWORD="abcd";
     
    Class.forName("org.gjt.mm.mysql.Driver");  
     Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

   String ctNo = session.getId();   //세션 번호를 장바구니 번호로서 이용하기 위해 ctNo에 저장


   // 장바구니에 물건을 담기 전후, mysql상에서 select * from cart;의 결과를 함께 확인/비교 해가면서
   // cart테이블에 남아있는 상품레코드정보와 장바구니번호(ctNo)를 함께 이해해 보도록 할 것!
   //  =>  홈페이지상에서 보여지는 장바구니 내역에 포함된 레코드들이, 실제로 cart테이블상에서는 
   //         무엇을 의미하고 있는지 곰곰히 생각해 볼 것! (중요!)
   String jsql = "select * from cart where ctNo = ?";
   PreparedStatement pstmt = con.prepareStatement(jsql);
   pstmt.setString(1, ctNo);

   ResultSet rs = pstmt.executeQuery();

   if(!rs.next())    // 조회 결과가 존재하지 않으면,  rs.next()는 false를 리턴함. 
   {                       //  따라서,  !rs.next()의 값은 true가 됨 
%>
      <p style="margin-top:100px; font-size:20px;">장바구니가 비었습니다.
<%
   }
   else
   {
%>
<%
//  [78행~113행 설명] :
//  장바구니에 담긴 상품내역을 웹페이지상에 보여주고자 할 때, 각각의 항목들이
//  상품번호(prdNo),  상품명(prdName),  상품단가(prdPrice),  주문수량(ctQty), 
//  주문액(prdPrice*ctQty ),  전체주문총액(total)으로 구성되고 있음에 유의할 것! 
//   => 장바구니담기 실행 후 보여지는 해당 웹페이지의 출력결과를 토대로 각 구성요소들을 확인 요망!

//  cart 테이블:  상품번호(prdNo)와 주문수량(ctQty) 값을 추출해 올 수 있음.
//  goods 테이블:  상품명(prdName)과 상품단가(prdPrice) 값을 추출해 올 수 있음.
//  따라서, cart테이블과 goods테이블로부터, 동일한 상품번호(prdNo)에 해당하는 각 항목들의 값을 
//  추출해 올 수 있다. (mysql상에서 cart테이블과 goods테이블에 어떠한 필드들이 존재하는지 확인 요망!)
//  =>  <알고리즘 설명>:  cart테이블로부터 상품번호(prdNo)와 주문수량(ctQty) 값을 추출해 오고, 
//         여기서 추출한 상품번호(prdNo)에 근거하여 goods테이블로부터
//         상품명(prdName)과 상품단가(prdPrice) 를 추출해 낸다.
//         이를 토대로, 주문액(prdPrice*ctQty )과  전체주문총액(total)을 계산해 낸다.
//         그런 다음, 추출해 낸 각 필드들 및 계산된 결과값들을 웹브라우저상에 출력해 준다. 
//         이후, 이러한 레코드단위의 필드추출 및 웹브라우저로의 출력하는 과정을 
//         더 이상 장바구니에 상품레코드가 없을 때까지(총 상품레코드 수 만큼) 반복한다.  


      String jsql2 = "select prdNo, ctQty from cart where ctNo = ?";
      PreparedStatement pstmt2 = con.prepareStatement(jsql2);
      pstmt2.setString(1, ctNo);      

      ResultSet rs2 = pstmt2.executeQuery(); 

      int total=0;

      while(rs2.next()) 
        {                            
         String prdNo = rs2.getString("prdNo");   //  cart테이블로부터 상품번호 추출
          int ctQty = rs2.getInt("ctQty");                   //  cart테이블로부터 주문수량 추출 

          String jsql3 = "select prdName, prdPrice from goods where prdNo = ?";
          PreparedStatement pstmt3 = con.prepareStatement(jsql3);
          pstmt3.setString(1, prdNo);
          
         ResultSet rs3 = pstmt3.executeQuery(); 
         rs3.next();

         String prdName =  rs3.getString("prdName");     //  goods 테이블로부터 상품명 추출
         int prdPrice =  rs3.getInt("prdPrice");                 //  goods 테이블로부터 상품단가 추출
            
          int amount = prdPrice * ctQty;    //  주문액 계산
         total = total + amount;                  //  전체 주문총액 계산
%>
	<script>	

	$(document).ready(function(){
		$("#iamportPayment").click(function(){
			payment();
		});
	})

	function payment(data) {
		IMP.init('imp75627170');
		IMP.request_pay({
			pg: "kakaopay.TC0ONETIME",
			pay_method : "card",
			merchant_uid : Math.random(),
			name : "<%=prdName%>", // 상품명
			amount: <%=total%>, // 금액
			buyer_email : "testiamport@naver.com",
			buyer_name : "홍길동",
			buyer_tel : "01011111111"
		}, function (rsp) {
			if(rsp.success) {
				document.newMem.submit();
			} else {
				alert("결제를 취소하였습니다.");
			}
			});
		}
</script>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
   <table class="carttable">
    <tbody>
    <tr>       
        <td class="goods"><img src="./img/c<%=prdNo%>.png"></td>
        <td class="data">
            <p>상품번호 <%=prdNo%></p>
            <p><%=prdName%></p>
            <p>수량 <%=ctQty%></p>
            <p>상품가격 <fmt:formatNumber value="<%=amount%>" type="number"/></p>
        </td> 
        <td class="del">
            <p><a href="deleteCart.jsp?prdNo=<%=prdNo%>"><b>상품삭제</b></a></p>
        </td>
    </tr>    

<%
        }  // while문의 끝
 %>   

<%
   // (2)주문자 정보 출력 - 회원 테이블 정보 출력
   String myid = (String)session.getAttribute("sid");  // 로그인했었던 주문자 정보(즉, 아이디)를 받아옮

   String jsql4 = "select memName, memPhone from member where memId = ?";
   PreparedStatement pstmt4 = con.prepareStatement(jsql4);
   pstmt4.setString(1,myid);

   ResultSet rs4 = pstmt4.executeQuery();
   rs4.next();
   String  name = rs4.getString("memName");
   String  tel = rs4.getString("memPhone");
%>

<form name="newMem" method="Post" action="orderOk.jsp">     <!--  폼의 이름이 form으로 지정됨 -->
   <tr class="orderdata">
        <td>
            <p style="font-family: G마켓 산스 TTF;">주문자 정보</p>
        </td>
      <td>
            <p style="font-family: G마켓 산스 TTF;">주문자 <span><%=name%></span></p>
         <p style="font-family: G마켓 산스 TTF;">휴대폰 번호 <span><%=tel%></span></p>
   </tr>
   <tr class="recipient">
        <td>
            <p style="font-family: G마켓 산스 TTF;">수령인 정보</p>
        </td>
      <td>
            <p style="font-family: G마켓 산스 TTF;">이 름 <input type="text" name="receiver" placeholder="수령인 성명을 입력해주세요." size=40><p>
            <p style="font-family: G마켓 산스 TTF;">휴대폰 번호 <input type="text" name="rcvPhone" class="reciph" placeholder="수령인 휴대폰 번호를 입력해주세요."size=40></p>
            <p style="font-family: G마켓 산스 TTF;">주 소 
				<input type="text" class ="post" name="zipcode" size="7" readonly placeholder="우편번호를 입력해주세요."> 
			    <input type="button" class ="postbtn" value="우편번호검색" onClick="zipCheck()"><br>     
                <input type="text" class ="radd" name="address1" size="100" readonly placeholder="주소를 입력해주세요."><br>
				<input type="text" class ="radd" name="address2" size="100" placeholder="상세주소를 입력해주세요.">
            </p>
        </td>
   </tr>
    
   <tr class="total">
        <td colspan = 4 align=center><b>전체 주문 총액</b></td>
        <td align=right><input type="hidden" name="pay" value="<%=total%>"> <b><fmt:formatNumber value="<%=total%>" type="number"/>원</b></td>
    </tr>
    </tbody>
</table>   

<div class="cartbtn2">
    <p>
        <input type="reset" value="주문취소" name="reset" >
		<button type = "button" id = "iamportPayment" OnClick="check_val()">결제하기</button>
    </p>
</div>                        
</form>    
<%
    }   //  if-else문의 끝
  }  catch(Exception e)  {
        out.println(e);
} 
%>
</center> 
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
</body>
</html> 
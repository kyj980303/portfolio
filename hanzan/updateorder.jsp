<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="wodtj=device.width, inital-scale=1.0">
    <title>hanzan main</title>
    <link rel="stylesheet" href="../hanzan/css/hanzan.css">
    <script src="js/jquery-2.2.4.min.js"></script>
    <script src="js/hanzan.js"></script>
</head>
<body>
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
		<button class="btn_nav mobile hide"><img src="./img/menuicon.png"></button>
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
		<div class="nav2 hide">
            <nav id="navWrap">
                <div class="nav_inner">
                    <div class="logo2"><img src="./img/logo.png"></div>
                    <div class="close"><img src="./img/x.png"></div>
                    <ul class="gnb">
                        <li> <!--브랜드스토리 클릭했을때 열리게-->
                            <a href="teastory.jsp">차 이야기
                        </li>
                        <li> <!--브랜드스토리 클릭했을때 열리게-->
                            <a href="#">차 가게<img src="./img/arrowdown.png"></a>
                            <div class="sub_wrap hide">
                                <div class="left">
                                    <ul>
                                        <li><a href="subn.jsp">녹차/발효차/홍차</a></li>
                                        <li><a href="subm.jsp">허브티(무카페인)</a></li>
                                        <li><a href="subb.jsp">블랜디드티</a></li>
                                    </ul>
                                </div><!--left-->
                            </div><!--sub_wrap mobile:sub pc:absolute-->
                        </li>
                        <li> <!--브랜드스토리 클릭했을때 열리게-->
                            <a href="#">다과<img src="./img/arrowdown.png"></a>
                            <div class="sub_wrap hide">
                                <div class="left">
                                    <ul>
                                        <li><a href="desert.jsp">한과</a></li>
                                        <li><a href="desert2.jsp">화과자</a></li>
                                    </ul>
                                </div><!--left-->
                            </div><!--sub_wrap mobile:sub pc:absolute-->
                        </li>
                        <li> <!--브랜드스토리 클릭했을때 열리게-->
                            <a href="#">다구<img src="./img/arrowdown.png"></a>
                            <div class="sub_wrap hide">
                                <div class="left">
                                    <ul>
                                        <li><a href="teazan.jsp">찻잔</a></li>
                                        <li><a href="teapot.jsp">티팟</a></li>
                                    </ul>
                                </div><!--left-->
                            </div><!--sub_wrap mobile:sub pc:absolute-->
                        </li>
                        <li> <!--브랜드스토리 클릭했을때 열리게-->
                            <a href="haru.jsp">하루한잔</a>
                        </li>
                        <li class="main-menu"><%if(id == "" || id == null){%>
                           <a href="login.html"> LOGIN
                        <%} else {%>
                           <a href="logout.jsp"> LOGOUT 
                        <%}%><img src="../hanzan/img/loginikon.png"></a></li>
                        <li><a href="login.jsp">마이페이지<img src="../hanzan/img/mypageikon2.png"></a></li>
                        <li><a href="showCart.jsp">장바구니<img src="../hanzan/img/cartikon2.png"></a></li>
                    </ul>
                </div><!--nav_inner mobile:흰색영역 pc:가운데정렬-->
            </nav><!--navWrap mobile:검은영역 pc:전체영역-->
        </div> 
    </header>
<center>

<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/hanzan";  //  접속할 DB명
     String DB_ID="multi";  //  접속할 아이디
     String DB_PASSWORD="abcd"; // 접속할 패스워드
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  // JDBC 드라이버 로딩
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	 String key = request.getParameter("ordNo");

	 String jsql = "SELECT * FROM orderinfo WHERE ordNo = ?";       
	 PreparedStatement  pstmt  = con.prepareStatement(jsql);
	 pstmt.setString(1, key);

	 ResultSet rs = pstmt.executeQuery();//SQL문 실행	
	 rs.next();

	 String no = rs.getString("ordNo");
     String Id =  rs.getString("memId");	
	 String dday =  rs.getString("ordDate");
	 String rcv =  rs.getString("ordReceiver");	
	 String rcvhp =  rs.getString("ordRcvPhone");
	 String rcvadd =  rs.getString("ordRcvAddress1");
	 String rcvadd2 =  rs.getString("ordRcvAddress2");
%>

<div class="selallorder">
	<p>주문 정보 수정</p>
</div>
            
<form method="post" action="updateorderResult.jsp">
<table class="sela2">	
		<tr>
				<td>주문번호</td>
				<td><input type="hidden" name="no" value="<%=no%>" ><%=no%></td>
	    </tr>
		<tr>
				<td>주문자 ID</td>
				<td><input type=text name="Id" value="<%=Id%>"></td>
		</tr>
		<tr>
				<td>주문날짜</td>
				<td><input type=text name="dday" value="<%=dday%>"></td>
		</tr>
		<tr>
				<td>수령인</td>
				<td><input type=text name="rcv" value="<%=rcv%>"></td>
		</tr>
		<tr>
				<td>수령인 연락처</td>
				<td><input type=text name="rcvhp" value="<%=rcvhp%>"></td>
		</tr>
		<tr>
				<td>수령인 주소</td>
				<td><input type=text name="rcvadd" value="<%=rcvadd%>"><input type=text name="rcvadd2" value="<%=rcvadd2%>" ></td>
		</tr>
</table>

<div class="selebtn2">
	<p>
		<input type="submit" value="수정완료">
	</p>
</div>
</form>
<%
    } catch (Exception e) {
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
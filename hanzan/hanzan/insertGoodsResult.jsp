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

<% 
	request.setCharacterEncoding("euc-kr");  // 입력폼에서 전송된 한글데이터 처리

	// 입력폼에서 받는 데이터는 모두 String형임
	String no = request.getParameter("no");
	String name = request.getParameter("name");
   	int price =  Integer.parseInt(request.getParameter("price")); // String => int 변환
	int stock =  Integer.parseInt(request.getParameter("stock")); // String => int 변환
	String description = request.getParameter("description");


try {
 	 String DB_URL="jdbc:mysql://localhost:3306/hanzan";  //  접속할 DB명
     String DB_ID="multi";  //  접속할 아이디
     String DB_PASSWORD="abcd"; // 접속할 패스워드
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  // JDBC 드라이버 로딩
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
     // DB에 접속           

	//SQL문 작성 : 테이블 필드명
    String jsql = "INSERT INTO GOODS  (prdNo, prdName, prdPrice, prdStock, ";
	jsql = jsql + "prdDescription )  VALUES  (?, ?, ?, ?, ?)"; 
      
    //PreparedStatement 생성(SQL문의 형틀을 정의함)
	PreparedStatement pstmt = con.prepareStatement(jsql); 

	//위의 SQL문에서 ?에 해당되는 곳에 다음의 값들을 하나씩 할당함 (인수 전달)
	//정수형의 경우에는 setInt()를 사용함 
	pstmt.setString(1, no); 
    pstmt.setString(2, name);
	pstmt.setInt(3, price);  //정수값인 경우
	pstmt.setInt(4, stock); //정수값인 경우
	pstmt.setString(5, description);
	pstmt.executeUpdate(); // SQL문 실행
%>
<center>
<div class="goodsinsert">
	<p style="font-size:24px">등록된 상품 정보</p>
</div>
<table cellpadding="10" class="insertg">
	<tr>
		<td>상품번호</td>
		<td><%=no%></td>
	</tr>
	<tr>
		<td>상품명</td>
		<td><%=name%></td>
	</tr>
	<tr>
		<td>상품가격</td>
		<td><%=price%> 원</td>
	</tr>
	<tr>
		<td>재고수량</td>
		<td><%=stock%> 개</td>
	</tr>
	<tr>
		<td>상품설명</td>
		<td><%=description%></td>
	</tr>
</table><p>
<% 
  } catch(Exception e) { 
		out.println(e);
}
%>
<p>
<div class = "insertgbtn">
<p style="margin-top:15px"><a href = "selectAllGoods.jsp">전체 등록상품 조회</a></p></div>
</center>
</body>
</html>
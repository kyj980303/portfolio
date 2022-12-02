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
		<img src="../hanzan/img/logo.png" style="margin-top:20px;"></a></div>
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
<body>

<%
	//  로그인 성공시(loginOK.jsp의 42~51행 부분)에 부여한 "sid" 속성의 속성값은 
	//  "특정회원의 ID"를 나타내며,  이 속성값이 null인지 아닌지로 로그인 여부를 확인함. 
	//  (로그인이 안된 경우, 이 값은 null값을 가짐)
	//  => loginOK.jsp의 43행에서, session.setAttribute("sid", id); 로  이미 설정해 놓았음.
	//  따라서, 이러한 ID값을 가져오기 위해서는 (String)session.getAttribute("sid"); 를 이용하면 됨!
	String myid = (String)session.getAttribute("sid");  

if (myid == null)    //  로그인 하지 않은 상태에서, 장바구니를 보려고 하는 경우의 처리(24~34행)
{                             //   =>  먼저 로그인을 하도록 유도함 
%>
<center>
<br><br><br> 
<div style="font-size:20px; margin-top:350px; height:450px ">
      상품 주문을 위해서는 로그인이 필요합니다! <br><br>   <a href="login.jsp">login</a>
</div>
</center>
<%
}
else    // 이미 로그인되어 있는 경우,  장바구니 보기 처리 부분(35행~끝 까지)
{
 try
	 {
 	    String DB_URL="jdbc:mysql://localhost:3306/hanzan";    //  접속 DB는 project
        String DB_ID="multi"; 
        String DB_PASSWORD="abcd";
 	 
	    Class.forName("org.gjt.mm.mysql.Driver");  
 	    Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

		String ctNo = session.getId();  //세션 번호를 장바구니 번호(ctNo)로서 이용하기 위해 ctNo에 저장
 	                                                          // session.getId()함수의 리턴값(결과값)은  세션번호(세션ID)임.

        // [세션과 관련한 내용 부연 설명] :
        // 클라이언트가 서버에 접속하게 되면 서버로부터 세션번호(난수형태의 식별번호)를 부여받음.
        //  => 부여받은 세션번호를 프로그램상에서 가져오려면 session.getId()를 사용함.
        // 부여받은 세션번호는 로그인 된 상태 동안(세션이 유지되는 동안) 그대로 보존된다.
        // 만일, 동일한 ID로 서버에 재접속하게 되더라도 또 새로운 세션번호를 부여받음.
        // => 따라서, 이러한 세션을 이용하면, 장바구니의 개념이 그대로 표현가능해 질 수 있다. 

         
		 //  장바구니테이블(cart 테이블)을 구성하는 각 필드가 ctNo, prdNo, ctQty임에 주목!
		String prdNo = request.getParameter("prdNo"); // 상품번호
		int ctQty = Integer.parseInt(request.getParameter("qty")); //  주문수량(장바구니에 담을 상품수량)


		// (72~76행):  특정회원이 로그인 해 있는 동안에(특정 세션번호),  동일한 상품을 
		// 장바구니 테이블에 이미 담았었는지 아닌지를 확인하기 위해서 select문을 이용함!

		//  (1) 담고자 하는 상품레코드가 이미 장바구니테이블(cart)에 존재하는 경우(76~87행 부분) :
		//      => 장바구니테이블에 새로운 상품레코드를 추가(insert)시키는 것이 아니라, 
		//           이미 존재하는 상품레코드에 상품수량만을 갱신(update)시킨다.
		//  (2) 담고자 하는 상품레코드가 장바구니테이블(cart)에 존재하지 않는 경우(88~97행 부분):
		//      => 장바구니테이블에 새로운 상품레코드를 추가(insert)시킨다.
		String jsql = "select * from cart where ctNo = ? and prdNo = ?";
		PreparedStatement pstmt = con.prepareStatement(jsql);
		pstmt.setString(1, ctNo);
		pstmt.setString(2, prdNo);
		ResultSet rs = pstmt.executeQuery(); 

	   	if(rs.next())   // 동일 상품이 이미 장바구니에 존재한다면 수량만을 수정/갱신시킴.
		{		               // 즉, update문을 사용하여 이미 존재하는 상품데이터의 수량부분만을 갱신시킴.
			int sum = rs.getInt("ctQty") + ctQty;  //  이미 기존에 있는 수량에다 새로 추가시킬 수량을 합산함.

			String jsql2 = "update cart set ctQty=? where ctNo=? and prdNo=?";
			PreparedStatement pstmt2 = con.prepareStatement(jsql2);
			pstmt2.setInt(1, sum);
			pstmt2.setString(2, ctNo);
			pstmt2.setString(3, prdNo);

			pstmt2.executeUpdate();
		}
		else  // 동일 상품이 장바구니에 존재하지 않는다면, 새로운 상품레코드를 장바구니 테이블에 추가시킴
		{
			String jsql3 = "insert into cart (ctNo, prdNo, ctQty) values (?,?,?)";
			PreparedStatement pstmt3 = con.prepareStatement(jsql3);
			pstmt3.setString(1,ctNo);
			pstmt3.setString(2,prdNo);
			pstmt3.setInt(3,ctQty);	

			pstmt3.executeUpdate();
		}  //  76행~97행 if-else문의 끝
	 } 	catch(Exception e)  {
             out.println(e);
    }  // catch문 닫기		

     //  장바구니에 상품을 등록 또는 갱신시킨 후, 장바구니 내역을 보여주도록 showCart.jsp를 호출함.   
	    response.sendRedirect("showCart.jsp");   //  <jsp:forward page="showCart.jsp"/> 와 동일한 의미
}  // 24~104행 if-else문의 끝	                                     
%>
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

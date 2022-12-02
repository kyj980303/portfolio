<%@ page contentType="text/html;charset=euc-kr"  %>
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
    
    <div class="mypagemain">
        <p>마이페이지</p>
    </div>
    <div class="mypage">
        <ul class="mypagenav">
            <li>내 정보수정</li>
            <li>위시리스트</li>
            <li>주문내역</li>
        </ul>
	</div>
<%
	request.setCharacterEncoding("utf-8");
	
	String myid = request.getParameter("myid");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");

	String birthYear = request.getParameter("birthYear");
	String birthMonth = request.getParameter("birthMonth");
	String birthDay = request.getParameter("birthDay");
	String birth = birthYear + "-" + birthMonth + "-" + birthDay;

	String solar = request.getParameter("solar");
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");

	String hp1 = request.getParameter("hp1");
	String hp2 = request.getParameter("hp2");
	String hp3 = request.getParameter("hp3");
	String phone = hp1+"-"+hp2+"-"+hp3;	

try {
 	 String DB_URL="jdbc:mysql://localhost:3306/hanzan";
     String DB_ID="multi";  
     String DB_PASSWORD="abcd";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	 String jsql = "update member set memPasswd=?, memName=?, ";
	 jsql = jsql + "memBirth=?, memSolar=?, ";
	 jsql = jsql + "memAddress1=?, memAddress2=?, memPhone=? ";
	 jsql = jsql + "where memId=? ";	
	 PreparedStatement pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1,passwd);
	 pstmt.setString(2,name);
	 pstmt.setString(3,birth);
	 pstmt.setString(4,solar);
	 pstmt.setString(5,address1);
	 pstmt.setString(6,address2);
	 pstmt.setString(7,phone);
	 pstmt.setString(8,id);

	 pstmt.executeUpdate();  //  위에서 작성한 SQL문(update문)을 실행시킴
	                                            //   이 행을 완료한 직후, 실제로 DB상에 레코드정보가 수정됨


     //  이 이후 부분 내용은 DB상에 수정시킨 해당 레코드정보를 조회한 후, 
	 //  해당 내용을 웹브라우저로 출력해주는 코드에 해당됨
	 String jsql2 = "select * from member where memId=?";
	 PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	 pstmt2.setString(1,id);

	 ResultSet rs = pstmt2.executeQuery();
	 rs.next();  //  next()함수를 처음 수행하면, 첫번째 레코드(즉, 수정시킨 레코드)를 가리키게 됨
%>
	
<center>
		<div class="signcheck2">
            <h3>회원님의 정보가 다음과 같이 수정되었습니다.</h3>
            <table class="signt">
            <tr>
                <td width=100>ID</td>
                <td width=200><%=rs.getString("memId")%></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><%=rs.getString("memPasswd")%></td>
            </tr>
            <tr>
                <td>성명</td>
                <td><%=rs.getString("memName")%></td>
            </tr>
            <tr>
                <td>생년월일</td>
                <td>
                    <%=rs.getDate("memBirth")%> (<%=rs.getString("memSolar")%>)
                </td>
            </tr>
            <tr>
                <td>주소</td>
                <td><%=rs.getString("memAddress1")%><%=rs.getString("memAddress2")%></td>
            </tr>
            <tr>
                <td>휴대폰번호</td>
                <td><%=rs.getString("memPhone")%></td>
            </tr>
            </table>
            <p><a href="mypage.jsp">확인</a></p> 
			</div>
			<%
    } catch (Exception e) {
    	out.println(e);
}
%>
        

</center>
<div class="mypagecheck">
        <img src="./img/mypagecheck.png">
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
</body>
</html>
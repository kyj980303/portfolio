<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>위시리스트에 담기</title>

 <style type="text/css">
     a:link { text-decoration: none; color: black; }           <!-- 클릭하기전의 설정은 선없고 검정색 -->
     a:visited { text-decoration: none; color: black; }     <!-- 방문한뒤의 설정은 밑줄없고 검정 -->
     a:hover { text-decoration: underline; color:blue; } <!-- 마우스가 올라갈때 설정은 아랫줄있고 파랑 -->
 </style>

</head>
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
<font style="font-size:10pt;font-family:맑은 고딕">
		상품을 위시리스트에 담기 위해서는 로그인이 필요합니다! <br><br>	<a href="login.jsp" ><img src="./images/login.gif" border=0></a>
</font>
</center>
<%
}
else    //  이미 로그인되어 있는 경우,  장바구니 보기 처리 부분(35행~끝 까지)
{
 try
	 {
 	    String DB_URL="jdbc:mysql://localhost:3306/hanzan";    //  접속 DB는 project
        String DB_ID="multi"; 
        String DB_PASSWORD="abcd";
 	 
	    Class.forName("org.gjt.mm.mysql.Driver");  
 	    Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 


        // [세션과 관련한 내용 부연 설명] :
        // 클라이언트가 서버에 접속하게 되면 서버로부터 세션번호(난수형태의 식별번호)를 부여받음.
        //  => 부여받은 세션번호를 프로그램상에서 가져오려면 session.getId()를 사용함.
        // 부여받은 세션번호는 로그인 된 상태 동안(세션이 유지되는 동안) 그대로 보존된다.
        // 만일, 동일한 ID로 서버에 재접속하게 되더라도 또 새로운 세션번호를 부여받음.
        // => 따라서, 이러한 세션을 이용하면, 장바구니의 개념이 그대로 표현가능해 질 수 있다. 

        String prdNo = request.getParameter("prdNo"); // 상품번호
		 //  장바구니테이블(cart 테이블)을 구성하는 각 필드가 ctNo, prdNo, ctQty임에 주목!
		String jsql = "select prdName, prdPrice from goods where prdNo = ?";
		PreparedStatement pstmt = con.prepareStatement(jsql);
		pstmt.setString(1, prdNo);
		    
		ResultSet rs = pstmt.executeQuery(); 
		rs.next();

		String	prdName =  rs.getString("prdName");	  //  goods 테이블로부터 상품명 추출
		int prdPrice =  rs.getInt("prdPrice");  


		// (72~76행):  특정회원이 로그인 해 있는 동안에(특정 세션번호),  동일한 상품을 
		// 장바구니 테이블에 이미 담았었는지 아닌지를 확인하기 위해서 select문을 이용함!

		//  (1) 담고자 하는 상품레코드가 이미 장바구니테이블(cart)에 존재하는 경우(76~87행 부분) :
		//      => 장바구니테이블에 새로운 상품레코드를 추가(insert)시키는 것이 아니라, 
		//           이미 존재하는 상품레코드에 상품수량만을 갱신(update)시킨다.
		//  (2) 담고자 하는 상품레코드가 장바구니테이블(cart)에 존재하지 않는 경우(88~97행 부분):
		//      => 장바구니테이블에 새로운 상품레코드를 추가(insert)시킨다.

	   	
		String jsql2 = "insert into favorit (prdNo, prdName, prdPrice) values (?,?,?)";
		PreparedStatement pstmt2 = con.prepareStatement(jsql2);
		pstmt2.setString(1,prdNo);
		pstmt2.setString(2,prdName);
		pstmt2.setInt(3,prdPrice);	

		pstmt2.executeUpdate();
	 } 	catch(Exception e)  {
             out.println(e);
    }  // catch문 닫기		

     //  장바구니에 상품을 등록 또는 갱신시킨 후, 장바구니 내역을 보여주도록 showCart.jsp를 호출함.   
	    response.sendRedirect("showfavorit.jsp");   //  <jsp:forward page="showCart.jsp"/> 와 동일한 의미
}  // 24~104행 if-else문의 끝	                                     
%>
</body>
</html>

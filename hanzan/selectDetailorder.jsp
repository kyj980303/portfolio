<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html><head><title>주문 상세 정보 조회</title></head>
<body><center>

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
    	 String id =  rs.getString("memId");	
	 int dday =  rs.getInt("ordDate");
	 String rcv =  rs.getString("ordReceiver");		      
	 String  rcvadd =  rs.getString("ordRcvAddress");
	 String rcvhp =  rs.getString("ordRcvPhone");
%>

<font color="blue" size='6'><b>[주문 상세정보 조회]</b></font><p>
<table border="1"  style="font-size:10pt;font-family:맑은 고딕">
		<tr><td align=center>주문번호</td><td align=center><%=no%></td></tr>
		<tr><td align=center>주문자 ID</td><td align=center><%=id%></td></tr>
		<tr><td align=center>주문날짜</td><td align=center><%=dday%> 원</td></tr>
		<tr><td align=center>수령인</td><td align=center><%=rcv%> 개</td></tr>
		<tr><td align=center>수령인 주소</td><td align=center><%=rcvadd%></td></tr>
		<tr><td align=center>수령인 연락처</td><td align=center  width=300><%=rcvhp%></td></tr>
    </table><p>

<br><br>
<img src="./images/<%=no%>_detail.jpg" width=700 height=700 border=0>
<br><br><br>

<a href="updateorder.jsp?ordNo=<%=no%>" align=center style="font-size:10pt;font-family:맑은 고딕">수정</a>
&nbsp;&nbsp;&nbsp;<a href="deleteorder.jsp?ordNo=<%=no%>" align=center style="font-size:10pt;font-family:맑은 고딕">삭제</a>
<br><br><br>

</center>
<%
    } catch (Exception e) {
    	out.println(e);
}
%>
</body>
</html>


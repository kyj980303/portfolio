<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html><head><title>상품 상세 정보 조회</title></head>
<body><center>

<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/hanzan";  //  접속할 DB명
     String DB_ID="multi";  //  접속할 아이디
     String DB_PASSWORD="abcd"; // 접속할 패스워드
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  // JDBC 드라이버 로딩
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

  	 String key = request.getParameter("prdNo");

	 String jsql = "SELECT * FROM GOODS WHERE prdNo = ?";   
     PreparedStatement  pstmt  = con.prepareStatement(jsql);
	 pstmt.setString(1, key);
	 
	 ResultSet rs = pstmt.executeQuery();//SQL문 실행	
	 rs.next();

	 String no = rs.getString("prdNo");
	 String name =  rs.getString("prdName");	
	 int price =  rs.getInt("prdPrice");
	 int stock =  rs.getInt("prdStock");	
	 String description =  rs.getString("prdDescription");
%>

<font color="blue" size='6'><b>[상품 상세정보 조회]</b></font><p>
<table border="1"  style="font-size:10pt;font-family:맑은 고딕">
    	 <tr>
		      <td rowspan="7"  align=center ><img src="images\<%=no%>.jpg" width="300" height="300"></td>
	    </tr>
		<tr><td align=center>상품번호</td><td align=center><%=no%></td></tr>
		<tr><td align=center>상품명</td><td align=center><%=name%></td></tr>
		<tr><td align=center>상품가격</td><td align=center><%=price%> 원</td></tr>
		<tr><td align=center>재고수량</td><td align=center><%=stock%> 개</td></tr>
		<tr><td align=center>상품설명</td><td align=center  width=300><%=description%></td></tr>
    </table><p>

<br><br>
<img src="./images/<%=no%>_detail.jpg" width=700 height=700 border=0>
<br><br><br>

<a href="updateGoods.jsp?prdNo=<%=no%>" align=center style="font-size:10pt;font-family:맑은 고딕">수정</a>
&nbsp;&nbsp;&nbsp;<a href="deleteGoods.jsp?prdNo=<%=no%>" align=center style="font-size:10pt;font-family:맑은 고딕">삭제</a>
<br><br><br>

</center>
<%
    } catch (Exception e) {
    	out.println(e);
}
%>
</body>
</html>


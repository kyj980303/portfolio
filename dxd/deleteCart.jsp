<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html><head><title>장바구니 비우기 결과</title></head>
<body>

<%
try { 
 	 String DB_URL="jdbc:mysql://localhost:3306/dxd";
     String DB_ID="multi"; 
     String DB_PASSWORD="abcd";
	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	String ctNo = session.getId(); 
	String prdNo = request.getParameter("prdNo");

	String jsql = "delete from cart where ctNo=? and prdNo = ?";   
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, ctNo);
	pstmt.setString(2, prdNo);
	
	pstmt.executeUpdate();
	response.sendRedirect("showCart.jsp");    //   <jsp:forward page="showCart.jsp"/>와 같은 의미임
    } catch (Exception e) {
      out.println(e);
}
%>
</body>
</html>
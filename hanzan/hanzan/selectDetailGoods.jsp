<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html><head><title>��ǰ �� ���� ��ȸ</title></head>
<body><center>

<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/hanzan";  //  ������ DB��
     String DB_ID="multi";  //  ������ ���̵�
     String DB_PASSWORD="abcd"; // ������ �н�����
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  // JDBC ����̹� �ε�
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

  	 String key = request.getParameter("prdNo");

	 String jsql = "SELECT * FROM GOODS WHERE prdNo = ?";   
     PreparedStatement  pstmt  = con.prepareStatement(jsql);
	 pstmt.setString(1, key);
	 
	 ResultSet rs = pstmt.executeQuery();//SQL�� ����	
	 rs.next();

	 String no = rs.getString("prdNo");
	 String name =  rs.getString("prdName");	
	 int price =  rs.getInt("prdPrice");
	 int stock =  rs.getInt("prdStock");	
	 String description =  rs.getString("prdDescription");
%>

<font color="blue" size='6'><b>[��ǰ ������ ��ȸ]</b></font><p>
<table border="1"  style="font-size:10pt;font-family:���� ���">
    	 <tr>
		      <td rowspan="7"  align=center ><img src="images\<%=no%>.jpg" width="300" height="300"></td>
	    </tr>
		<tr><td align=center>��ǰ��ȣ</td><td align=center><%=no%></td></tr>
		<tr><td align=center>��ǰ��</td><td align=center><%=name%></td></tr>
		<tr><td align=center>��ǰ����</td><td align=center><%=price%> ��</td></tr>
		<tr><td align=center>������</td><td align=center><%=stock%> ��</td></tr>
		<tr><td align=center>��ǰ����</td><td align=center  width=300><%=description%></td></tr>
    </table><p>

<br><br>
<img src="./images/<%=no%>_detail.jpg" width=700 height=700 border=0>
<br><br><br>

<a href="updateGoods.jsp?prdNo=<%=no%>" align=center style="font-size:10pt;font-family:���� ���">����</a>
&nbsp;&nbsp;&nbsp;<a href="deleteGoods.jsp?prdNo=<%=no%>" align=center style="font-size:10pt;font-family:���� ���">����</a>
<br><br><br>

</center>
<%
    } catch (Exception e) {
    	out.println(e);
}
%>
</body>
</html>


<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html><head><title>�ֹ� �� ���� ��ȸ</title></head>
<body><center>

<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/hanzan";  //  ������ DB��
     String DB_ID="multi";  //  ������ ���̵�
     String DB_PASSWORD="abcd"; // ������ �н�����
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  // JDBC ����̹� �ε�
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

  	 String key = request.getParameter("ordNo");

	 String jsql = "SELECT * FROM orderinfo WHERE ordNo = ?";   
     PreparedStatement  pstmt  = con.prepareStatement(jsql);
	 pstmt.setString(1, key);
	 
	 ResultSet rs = pstmt.executeQuery();//SQL�� ����	
	 rs.next();

	 String no = rs.getString("ordNo");
    	 String id =  rs.getString("memId");	
	 int dday =  rs.getInt("ordDate");
	 String rcv =  rs.getString("ordReceiver");		      
	 String  rcvadd =  rs.getString("ordRcvAddress");
	 String rcvhp =  rs.getString("ordRcvPhone");
%>

<font color="blue" size='6'><b>[�ֹ� ������ ��ȸ]</b></font><p>
<table border="1"  style="font-size:10pt;font-family:���� ���">
		<tr><td align=center>�ֹ���ȣ</td><td align=center><%=no%></td></tr>
		<tr><td align=center>�ֹ��� ID</td><td align=center><%=id%></td></tr>
		<tr><td align=center>�ֹ���¥</td><td align=center><%=dday%> ��</td></tr>
		<tr><td align=center>������</td><td align=center><%=rcv%> ��</td></tr>
		<tr><td align=center>������ �ּ�</td><td align=center><%=rcvadd%></td></tr>
		<tr><td align=center>������ ����ó</td><td align=center  width=300><%=rcvhp%></td></tr>
    </table><p>

<br><br>
<img src="./images/<%=no%>_detail.jpg" width=700 height=700 border=0>
<br><br><br>

<a href="updateorder.jsp?ordNo=<%=no%>" align=center style="font-size:10pt;font-family:���� ���">����</a>
&nbsp;&nbsp;&nbsp;<a href="deleteorder.jsp?ordNo=<%=no%>" align=center style="font-size:10pt;font-family:���� ���">����</a>
<br><br><br>

</center>
<%
    } catch (Exception e) {
    	out.println(e);
}
%>
</body>
</html>


<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html><head><title>ȸ�� �� ���� ��ȸ   </title></head>
<body>

<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/hanzan";  
     String DB_ID="multi";  
     String DB_PASSWORD="abcd"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver"); 
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

  	 String key = request.getParameter("id");  //  �������� ��Ÿ�� ȸ�� ���̵� ���޹޾� ��
	 String jsql = "select * from member where memId = ?";   
     PreparedStatement  pstmt  = con.prepareStatement(jsql);
	 pstmt.setString(1, key);

	 ResultSet rs = pstmt.executeQuery();  //SQL�� ����	
	 rs.next();

	 String id = rs.getString("memId");  //  ���� �� �Լ����� �μ����� ���̺��� �� �ʵ�����
	 String passwd =  rs.getString("memPasswd");	
	 String  name = rs.getString("memName");
	 Date birth = rs.getDate("memBirth");
	 String solar =  rs.getString("memSolar");
	 String address1 =  rs.getString("memAddress1");
	 String address2 =  rs.getString("memAddress2");
	 String phone =  rs.getString("memPhone");
%>

<center>
<font color="blue" size='6'><b>[ȸ�� ������ ��ȸ]    </b></font><p>
<table border="2" cellpadding="10"  style="font-size:10pt;font-family:���� ���">
		<tr><td width=100>ID</td><td width=200><%=id%></td></tr>
		<tr><td>��й�ȣ</td><td><%=passwd%></td></tr>
		<tr><td>����</td><td><%=name%></td></tr>
		<tr><td>�������</td><td><%=birth%> (<%=solar%>)</td></tr>
		<tr><td>�ּ�</td><td><%=address1%><%=address2%></td></tr>
		<tr><td>�޴�����ȣ</td><td><%=phone%></td></tr>
    </table><p>

<a href="updateMember.jsp?id=<%=id%>" style="font-size:10pt;font-family:���� ���">����</a>&nbsp;&nbsp;
<a href="deleteMember.jsp?id=<%=id%>" style="font-size:10pt;font-family:���� ���">����</a>
</center>

<%
    } catch (Exception e) {
    	out.println(e);
}
%>
</body>
</html>
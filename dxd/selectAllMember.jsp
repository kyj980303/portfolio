<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html><head><title>ȸ�� ���̺� ���� ��ȸ   </title></head>
<body>

<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/dxd"; 
     String DB_ID="multi";  
     String DB_PASSWORD="abcd"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

     String jsql = "select * from member";   
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
	 ResultSet  rs = pstmt.executeQuery();
%>

<center>
<font color="blue" size='6'><b>[��ü ȸ�� ��ȸ]   </b></font><p>
<table border="2" cellpadding="10" style="font-size:10pt;font-family:���� ����">
	<tr>
		<td>ID</td><td>��й�ȣ</td><td>����</td><td>�ֹι�ȣ</td><td>�������</td>	
		<td>��ȭ</td><td><b>[����]</b></td><td><b>[����]</b></td>
	</tr>	

<%
		while(rs.next()){
			String id = rs.getString("memId");   //  ���� �� �Լ����� �μ����� ���̺��� �� �ʵ������
    		String passwd =  rs.getString("memPasswd");	
			String name = rs.getString("memName");
    		String joomin =  rs.getString("memJoomin");	
			Date birth = rs.getDate("memBirth");
    		String solar =  rs.getString("memSolar");	
			String tel = rs.getString("memTel");
%>
   <tr>                     <!--  �������� ��Ÿ�� ������ ��ũ�κп� ȸ�� ���̵� �Բ� �Ѱ��� -->
 	  <td> <a href="selectDetailMember.jsp?id=<%=id%>"><%=id%></a></td>
      <td><%=passwd%></td>
	  <td><%=name%></td>
	  <td><%=joomin%></td>
	  <td><%=birth%> (<%=solar%>)</td>	
 	  <td><%=tel%></td> 
	  <td align=center><a href="updateMember.jsp?id=<%=id%>">Yes</a></td>
  	  <td align=center><a href="deleteMember.jsp?id=<%=id%>">Yes</a></td>
  </tr>
<%
		}  // while���� ��
%>
</table><p>
<br>
 <a href="manager_index.jsp" style="font-size:10pt;font-family:���� ����">�����ڸ�� ����������</a>
 &nbsp&nbsp&nbsp

<%
    } catch (Exception e) {
      out.println(e);	
}
%>
</body>
</html>
<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html><head><title>�ֹ� �Ϸ� or  ��ٱ��ϳ��� ����</title></head>
<body>
<center>

<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/dx";
     String DB_ID="multi"; 
     String DB_PASSWORD="abcd";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	String ctNo = session.getId();   //  ���ǹ�ȣ(��ٱ��Ϲ�ȣ)�� ������
	String caseNo = request.getParameter("case");

	String jsql = "delete from cart where ctNo=?";   
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, ctNo);
	
    pstmt.executeUpdate();

	if(caseNo!= null)  //  (1) �ֹ��Ϸ�� ���� ��ٱ��� ���� �����ϰ� �� ���� �ֹ��Ϸ� �޽��� ���
	{                             //   orderOK.jsp�� 107�� ����
%>
<br><br>
<font size=6 color=blue><b>[��ǰ �ֹ� �Ϸ�]</b></font><p>
	��ǰ �ֹ��� �Ϸ�Ǿ����ϴ�.<br><br>
	�ֹ��Ͻ� ��ǰ�� �ֹ� �Ϸ� �� 2�� �̳��� ��۵� �����Դϴ�.<br><br>
	������ ��Ƽ���θ�(��)�� �̿��� �ּż� �����մϴ�!
<%
	}
	  else   //  (2) �ֹ��� ������� ��ٱ��� ���⸦ ������ ����� ���
	 {
%>
<br><br>
<font color="blue" size='6'><b>[��ٱ��� ���� ����]</b></font><p>
	��ٱ����� ��� ������ �����Ͽ����ϴ�.
<%
	  }
   } catch (Exception e) {
       out.println(e);
}
%>
</center>
</body>
</html>
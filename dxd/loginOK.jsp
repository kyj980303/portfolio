<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>

<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=euc-kr">
	<title>�α��� ó��/�Ǻ�</title>
</head>
<body>

<%
	String DB_URL="jdbc:mysql://localhost:3306/dxd";   //  dxd DB����
    String DB_ID="multi"; 
    String DB_PASSWORD="abcd";
 	 
	Class.forName("org.gjt.mm.mysql.Driver");  
 	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

    String id = request.getParameter("id");            // �α�����(login.jsp)���� �Է��� ID�� �Ѱܹ���
    String pass = request.getParameter("pass");  // �α�����(login.jsp)���� �Է��� PW�� �Ѱܹ���

    //  �α�����(login.jsp)���� �Է��� ID�� ������ ���ڵ带 member ���̺����� ��ȸ��
    String jsql = "select  *  from member where memId = ? "; 
    PreparedStatement pstmt = con.prepareStatement(jsql);
    pstmt.setString(1, id);

    ResultSet rs = pstmt.executeQuery(); 

    if( rs.next() )   // �Է��� ID�� ������ ���ڵ尡 member���̺��� �����ϴ� ���
    {
        if (pass.equals(rs.getString("memPasswd")))  // �Է��� ��й�ȣ�� member���̺����� ��й�ȣ�͵� ��ġ�ϴ� ���
        {
             session.setAttribute("sid", id);
 	      // �α��� ������, ������ ������� ID�� "sid" �Ӽ��� �Ӽ������� ������.
          // ���� �α��� �� ���¿��� ���� ID�� ���õ� ������ �ʿ�� �Ҷ�,
	      // (String)session.getAttribute("sid")�� �̿��Ͽ� ���� ID ������ ������ �� �ִ�.
     	  // �ܼ���, �α��� ���� �Ǻ��� �� �Ӽ����� null���� �ƴ����� �α��� ���θ� Ȯ����. 
	      // (�α����� �ȵ� ���, �� ���� null���� ����)

             response.sendRedirect("index.jsp");   	//  <jsp:forward page="index.jsp"/> �� ������

		 } else {   // �Է��� ID�� ������ ���ڵ尡 member���̺��� ����������, ��й�ȣ�� ����ġ�� ���
%>
      <script>
	  	alert('�н����尡 ��ġ���� �ʽ��ϴ�.');
		history.go(-1);
	  </script>
<%       
        }    
    } else {    // �Է��� ID�� ������ ���ڵ尡 member���̺��� �������� �ʴ� ���
 %>
      <script>
	  	alert('���̵� �������� �ʽ��ϴ�.');
		history.go(-1);
	  </script>
<%
   }  // ù��° if-else���� ��
%>

</body>
</html>

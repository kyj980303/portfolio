<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>

<html>
<head>
<title>�α��� ���</title>
</head>

 <body>
 <center>

<%
 	 String DB_URL="jdbc:mysql://localhost:3306/project";   //  DB���� project��
     String DB_ID="multi"; 
     String DB_PASSWORD="abcd";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

    String id = request.getParameter("id");  //  �α�����(manager_login.jsp)���� �Է��� ID�� �Ѱܹ���
    String pass = request.getParameter("pass");  //  �α�����(manager_login.jsp)���� �Է��� PW�� �Ѱܹ���

     //  �α�����(manager_login.jsp)���� �Է��� ID�� ������ ���ڵ带 manager ���̺����� ��ȸ��
    String jsql = "select * from manager where managerId = ? ";
    PreparedStatement pstmt = con.prepareStatement(jsql);
    pstmt.setString(1, id);

    ResultSet rs = pstmt.executeQuery(); 

    if( rs.next() )   //  (1) �Է��� ID�� ������ ���ڵ尡 manager ���̺��� �����ϴ� ���
    {
          if (pass.equals(rs.getString("managerPasswd")))
      	//  (1.1) �Է��� ID�� ������ ���ڵ尡 �����ϸ鼭, 
	    //	        �Է��� ��й�ȣ�� manager ���̺����� ��й�ȣ�͵� ��ġ�ϴ� ���
          {
              session.setAttribute("sid", id);
 	      // �α��� ������, ������ ID�� "sid" �Ӽ��� �Ӽ������� ������.
          // ���� �α��� �� ���¿��� ���� ID�� ���õ� ������ �ʿ�� �Ҷ�,
	      // (String)session.getAttribute("sid")�� �̿��Ͽ� ���� ID ������ ������ �� �ִ�.
     	  // �ܼ���, �α��� ���� �Ǻ��� �� �Ӽ����� null���� �ƴ����� �α��� ���θ� Ȯ����. 
	      //  (�α����� �ȵ� ���, �� ���� null���� ����)

              response.sendRedirect("manager_index.jsp");  	//  <jsp:forward page="manager_index.jsp"/> �� ������

		   }  else {   // (1.2) �Է��� ID�� ������ ���ڵ尡 manager���̺��� ����������, ��й�ȣ�� ����ġ�� ���
%>
           <br><br><br>
	       <font color=blue size=6><������ �α��� ����!></font><p><br><br>
           <font color=black size=3>
                ��й�ȣ�� �߸� �Ǿ����ϴ�.  �ٽ� Ȯ���� �ּ���!<p>
		        �α��� �������� ���ư��÷��� 
		 	    <a href="manager_login.jsp">����</a>�� Ŭ���Ͻð�, <p>
		 	    ���� �������� ���ư��÷���
			    <a href="index.html">����</a>�� Ŭ���ϼ���!
		   </font>              
<%       
          }  // �ι�° if-else ���� ��        
    } else {   //  (2)  �Է��� ID�� ������ ���ڵ尡 manager ���̺��� �������� �ʴ� ���
 %>
       <br><br><br>
      <font color=blue size=6><������ �α��� ����!></font><p><br><br>
	  <font color=black size=3>
			���̵� �������� �ʽ��ϴ�.	 �ٽ� Ȯ���� �ּ���!<p>
			�α��� �������� ���ư��÷��� 
			<a href="manager_login.jsp">����</a>�� Ŭ���Ͻð�, <p>
			���� �������� ���ư��÷���
			<a href="index.html">����</a>�� Ŭ���ϼ���!
	   </font>

<%
   }  // ù��° if-else���� ��
%>
</center>
</body>
</html>
<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.sql.*" %>

<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="wodtj=device.width, inital-scale=1.0">
	<title>�н����� ã�� ���</title>
    <link rel="stylesheet" href="../dxd/css/dxd.css">
    <script src="js/jquery-3.5.1.min.js"></script>
    <script src="js/dxd.js"></script>
	<script language="javascript" src="js_package.js"></script>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");

	String DB_URL="jdbc:mysql://localhost:3306/dxd";   // ���� DB�� project
    String DB_ID="multi";     
    String DB_PASSWORD="abcd"; 
 	 
	Class.forName("org.gjt.mm.mysql.Driver");  
 	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
        
	String name = request.getParameter("name");
	String id = request.getParameter("id");

	    
	String jsql = "select * from member where memName = ? and memId = ?";   
    PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, name);
	pstmt.setString(2, id);

	ResultSet rs = pstmt.executeQuery(); 

	if(rs.next()){
		String pass = rs.getString("memPasswd");
		%>
		<center>
			<div class="findpw">
				<h1>FIND PASSWORD</h1>
				<p class="findpwr"><%=name%>���� �н������ <%=pass%>�Դϴ�.</p>
				<a href="login.jsp"><input type="submit" value="�α����ϱ�" class="loginp"></a>
			</div>
		</center>
	<% }
	else{
	%>
		<script>
	  		alert('�̸� �Ǵ� ���̵� �ٽ� Ȯ�����ּ���');
			history.go(-1);
	    </script>
	<%
	}
%>
</body>
</html>
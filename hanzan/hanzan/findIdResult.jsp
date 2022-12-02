<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.sql.*" %>

<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="wodtj=device.width, inital-scale=1.0">
	<title>�н����� ã�� ���</title>
    <link rel="stylesheet" href="../hanzan/css/hanzan.css">
    <script src="js/jquery-3.5.1.min.js"></script>
    <script src="js/hanzan.js"></script>
	<script language="javascript" src="js_package.js"></script>
</head>
<body>
	<%
     //   �α��� ���¸� �����ϱ� ���Ͽ�, sid�� ����Ǿ��� ������ ID���� 
     //   session ��ü�κ��� �����ͼ� ���� id�� �����Ŵ (loginOK.jsp�� 43��κ� Ȯ�ο��!)
   String id = (String)session.getAttribute("sid"); 
   // String id = session.getAttribute("sid").toString(); ��  ������
                                                                                         
%>
    <header>
        <div class="logo">
		<%if(id == "" || id == null){%>
         <a href="index.html">
      <%} else {%>
         <a href="index.jsp">
      <%}%>
		<img src="../hanzan/img/logo.png"></a></div>
        <ul class="nav">
            <li class="main-menu"><a href="teastory.jsp">�� �̾߱�</a></li>
            <li class="main-menu">
                <a href="#">�� ����</a>
                <ul class="sub-menu1 hide">
                    <li><a href="subn.jsp">����/��ȿ��/ȫ��</a></li>
                    <li><a href="subm.jsp">���Ƽ(��ī����)</a></li>
                    <li><a href="subb.jsp">�����Ƽ</a></li>
                </ul><!--sub-menu-->
            </li>
            <li class="main-menu">
				<a href="#">�ٰ�</a>
                <ul class="sub-menu3 hide">
                    <li><a href="desert.jsp">�Ѱ�</a></li>
                    <li><a href="desert2.jsp">ȭ����</a></li>
                </ul><!--sub-menu-->
			</li>
            <li class="main-menu">
                <a href="#">�ٱ�</a>
                <ul class="sub-menu2 hide">
                    <li><a href="teazan.jsp">����</a></li>
                    <li><a href="teapot.jsp">Ƽ��</a></li>
                </ul><!--sub-menu-->
            </li>
            <li class="main-menu"><a href="haru.jsp">�Ϸ�����</a></li>
			<li class="main-menu"><%if(id == "" || id == null){%>
                           <a href="login.html"> LOGIN
                        <%} else {%>
                           <a href="logout.jsp"> LOGOUT 
                        <%}%></a></li>
            <li class="main-menu"><a href="mypage.jsp"><img src="../hanzan/img/mypage.png"></a></li>
            <li class="main-menu"><a href="showCart.jsp"><img src="../hanzan/img/cart.png"></a></li>
        </ul>
    </header>
<%
	request.setCharacterEncoding("euc-kr");

	String DB_URL="jdbc:mysql://localhost:3306/hanzan";   // ���� DB�� project
    String DB_ID="multi";     
    String DB_PASSWORD="abcd"; 
 	 
	Class.forName("org.gjt.mm.mysql.Driver");  
 	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
        
	String name = request.getParameter("name");
	String pass = request.getParameter("pass");

	    
	String jsql = "select * from member where memName = ? and memPasswd = ?";   
    PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, name);
	pstmt.setString(2, pass);

	ResultSet rs = pstmt.executeQuery(); 

	if(rs.next()){
		String id2 = rs.getString("memId");
		%>
		<center>
			<div class="findpw">
				<h1>FIND ID</h1>
				<p class="findpwr"><%=name%>���� ���̵�� <%=id2%>�Դϴ�.</p>
				<a href="login.jsp"><input type="submit" value="�α����ϱ�" class="loginp"></a>
			</div>
		</center>
	<% }
	else{
	%>
		<script>
	  		alert('�̸� �Ǵ� �н����带 �ٽ� Ȯ�����ּ���');
			history.go(-1);
	    </script>
	<%
	}
%>
	<footer>
        <ul class="icon">
            <li><a href = "https://www.instagram.com/"><img src="../hanzan/img/insta.png"></a></li>
            <li><a href = "https://www.facebook.com/"><img src="../hanzan/img/facebook.png"></a></li>
        </ul>
        <p><span><a href="adminlogin.jsp">������ �α���</a></span>
            Address : Gangnam, Seoul, Korea / tel : 010-1212-3232 / E-mail : hanzan@naver.com
            <span>Copyright : hanzan.All rights reserved.</span>
        </p>
    </footer>
</body>
</html>
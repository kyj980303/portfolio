<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="wodtj=device.width, inital-scale=1.0">
    <title>hanzan main</title>
    <link rel="stylesheet" href="../hanzan/css/hanzan.css">
    <script src="js/jquery-2.2.4.min.js"></script>
    <script src="js/hanzan.js"></script>
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
            <li class="main-menu"><a href="#"><img src="../hanzan/img/mypage.png"></a></li>
            <li class="main-menu"><a href="showCart.jsp"><img src="../hanzan/img/cart.png"></a></li>
        </ul>
    </header>
<body onLoad="login_focus()">  <!-- �α��� �������� �ε��Ǹ� ID �Էºκп� Ŀ�� Ȱ��ȭ��Ŵ -->
	<center>
	<div class="log">
		<form name="login" method="post" action="loginOK.jsp" target=_parent>  
			<table border= "0" cellpadding= "5">
				<tr>
					<td><h1>login</h1></td>
				</tr>
				<tr>
					<td><input type="text" name="id" class="logid" placeholder="���̵�"></td>
					<td rowspan=2><a href="javascript:login_check()">
				</tr>
				<tr>
					<td><input type="password" name="pass" class="logpw" placeholder="�н�����" onkeydown="onEnterSubmit()"></td> 
				</tr>
				<tr>
					<td><input type="submit" class="loginbtn" value="�α���"></td>
				</tr>
				<tr>
					<td>
						<a href="insertMember.jsp"><p class="f">ȸ������</p></a>
						<a href="findId.jsp"><p>���̵� ã��</p></a>
						<a href="findPw.jsp"><p>��й�ȣ ã��</p></a>
					</td>
				</tr>
			</table>	
		</form>    
	</div>    
</center>
</body>  
</html> 
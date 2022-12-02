<%@ page contentType="text/html;charset=euc-kr"  %>
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
            <li class="main-menu"><a href="mypage.jsp"><img src="../hanzan/img/mypage.png"></a></li>
            <li class="main-menu"><a href="showCart.jsp"><img src="../hanzan/img/cart.png"></a></li>
        </ul>
    </header>
    
    <div class="mypagemain">
        <p>����������</p>
    </div>
    <div class="mypage">
        <ul class="mypagenav">
            <li>�� ��������</li>
            <li>���ø���Ʈ</li>
            <li>�ֹ�����</li>
        </ul>
	</div>
<%
	request.setCharacterEncoding("utf-8");
	
	String myid = request.getParameter("myid");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");

	String birthYear = request.getParameter("birthYear");
	String birthMonth = request.getParameter("birthMonth");
	String birthDay = request.getParameter("birthDay");
	String birth = birthYear + "-" + birthMonth + "-" + birthDay;

	String solar = request.getParameter("solar");
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");

	String hp1 = request.getParameter("hp1");
	String hp2 = request.getParameter("hp2");
	String hp3 = request.getParameter("hp3");
	String phone = hp1+"-"+hp2+"-"+hp3;	

try {
 	 String DB_URL="jdbc:mysql://localhost:3306/hanzan";
     String DB_ID="multi";  
     String DB_PASSWORD="abcd";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	 String jsql = "update member set memPasswd=?, memName=?, ";
	 jsql = jsql + "memBirth=?, memSolar=?, ";
	 jsql = jsql + "memAddress1=?, memAddress2=?, memPhone=? ";
	 jsql = jsql + "where memId=? ";	
	 PreparedStatement pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1,passwd);
	 pstmt.setString(2,name);
	 pstmt.setString(3,birth);
	 pstmt.setString(4,solar);
	 pstmt.setString(5,address1);
	 pstmt.setString(6,address2);
	 pstmt.setString(7,phone);
	 pstmt.setString(8,id);

	 pstmt.executeUpdate();  //  ������ �ۼ��� SQL��(update��)�� �����Ŵ
	                                            //   �� ���� �Ϸ��� ����, ������ DB�� ���ڵ������� ������


     //  �� ���� �κ� ������ DB�� ������Ų �ش� ���ڵ������� ��ȸ�� ��, 
	 //  �ش� ������ ���������� ������ִ� �ڵ忡 �ش��
	 String jsql2 = "select * from member where memId=?";
	 PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	 pstmt2.setString(1,id);

	 ResultSet rs = pstmt2.executeQuery();
	 rs.next();  //  next()�Լ��� ó�� �����ϸ�, ù��° ���ڵ�(��, ������Ų ���ڵ�)�� ����Ű�� ��
%>
	
<center>
		<div class="signcheck2">
            <h3>ȸ������ ������ ������ ���� �����Ǿ����ϴ�.</h3>
            <table class="signt">
            <tr>
                <td width=100>ID</td>
                <td width=200><%=rs.getString("memId")%></td>
            </tr>
            <tr>
                <td>��й�ȣ</td>
                <td><%=rs.getString("memPasswd")%></td>
            </tr>
            <tr>
                <td>����</td>
                <td><%=rs.getString("memName")%></td>
            </tr>
            <tr>
                <td>�������</td>
                <td>
                    <%=rs.getDate("memBirth")%> (<%=rs.getString("memSolar")%>)
                </td>
            </tr>
            <tr>
                <td>�ּ�</td>
                <td><%=rs.getString("memAddress1")%><%=rs.getString("memAddress2")%></td>
            </tr>
            <tr>
                <td>�޴�����ȣ</td>
                <td><%=rs.getString("memPhone")%></td>
            </tr>
            </table>
            <p><a href="mypage.jsp">Ȯ��</a></p> 
			</div>
			<%
    } catch (Exception e) {
    	out.println(e);
}
%>
        

</center>
<div class="mypagecheck">
        <img src="./img/mypagecheck.png">
    </div>

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
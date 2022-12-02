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
		<button class="btn_nav mobile hide"><img src="./img/menuicon.png"></button>
        <ul class="nav">
            <li class="main-menu"><a href="teastory.jsp">�� �̾߱�</a></li>
            <li class="main-menu">
                <a href="#">�� ����</a>
                <ul class="sub-menu1 hide">
                    <li><a href="subn.jsp">����/��ȿ��/ȫ��</a></li>
                    <li><a href="subm.jsp">���Ƽ(��ī����)</a></li>
                    <li><a href="subb.jsp">�������Ƽ</a></li>
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
		<div class="nav2 hide">
            <nav id="navWrap">
                <div class="nav_inner">
                    <div class="logo2"><img src="./img/logo.png"></div>
                    <div class="close"><img src="./img/x.png"></div>
                    <ul class="gnb">
                        <li> <!--�귣�彺�丮 Ŭ�������� ������-->
                            <a href="teastory.jsp">�� �̾߱�
                        </li>
                        <li> <!--�귣�彺�丮 Ŭ�������� ������-->
                            <a href="#">�� ����<img src="./img/arrowdown.png"></a>
                            <div class="sub_wrap hide">
                                <div class="left">
                                    <ul>
                                        <li><a href="subn.jsp">����/��ȿ��/ȫ��</a></li>
                                        <li><a href="subm.jsp">���Ƽ(��ī����)</a></li>
                                        <li><a href="subb.jsp">�������Ƽ</a></li>
                                    </ul>
                                </div><!--left-->
                            </div><!--sub_wrap mobile:sub pc:absolute-->
                        </li>
                        <li> <!--�귣�彺�丮 Ŭ�������� ������-->
                            <a href="#">�ٰ�<img src="./img/arrowdown.png"></a>
                            <div class="sub_wrap hide">
                                <div class="left">
                                    <ul>
                                        <li><a href="desert.jsp">�Ѱ�</a></li>
                                        <li><a href="desert2.jsp">ȭ����</a></li>
                                    </ul>
                                </div><!--left-->
                            </div><!--sub_wrap mobile:sub pc:absolute-->
                        </li>
                        <li> <!--�귣�彺�丮 Ŭ�������� ������-->
                            <a href="#">�ٱ�<img src="./img/arrowdown.png"></a>
                            <div class="sub_wrap hide">
                                <div class="left">
                                    <ul>
                                        <li><a href="teazan.jsp">����</a></li>
                                        <li><a href="teapot.jsp">Ƽ��</a></li>
                                    </ul>
                                </div><!--left-->
                            </div><!--sub_wrap mobile:sub pc:absolute-->
                        </li>
                        <li> <!--�귣�彺�丮 Ŭ�������� ������-->
                            <a href="haru.jsp">�Ϸ�����</a>
                        </li>
                        <li class="main-menu"><%if(id == "" || id == null){%>
                           <a href="login.html"> LOGIN
                        <%} else {%>
                           <a href="logout.jsp"> LOGOUT 
                        <%}%><img src="../hanzan/img/loginikon.png"></a></li>
                        <li><a href="login.jsp">����������<img src="../hanzan/img/mypageikon2.png"></a></li>
                        <li><a href="showCart.jsp">��ٱ���<img src="../hanzan/img/cartikon2.png"></a></li>
                    </ul>
                </div><!--nav_inner mobile:������� pc:�������-->
            </nav><!--navWrap mobile:�������� pc:��ü����-->
        </div> 
    </header>
<center>

<%
	 request.setCharacterEncoding("euc-kr");
	
	 String no = request.getParameter("no");
     String Id =  request.getParameter("Id");	
	 String dday =  request.getParameter("dday");
	 String rcv =  request.getParameter("rcv");
	 String rcvhp =  request.getParameter("rcvhp");
	 String rcvadd =  request.getParameter("rcvadd");
	 String rcvadd2 =  request.getParameter("rcvadd2");

try {
 	 String DB_URL="jdbc:mysql://localhost:3306/hanzan";  //  ������ DB��
     String DB_ID="multi";  //  ������ ���̵�
     String DB_PASSWORD="abcd"; // ������ �н�����
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  // JDBC ����̹� �ε�
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 
     // DB�� ����

     // ��ǰ������ �����ϱ� ���� SQL�� �ۼ�
	 String jsql = "UPDATE orderinfo SET memId=?, ordDate=?, ordReceiver=?, ordRcvPhone=?, ordRcvAddress1=?, ";
     jsql = jsql + "ordRcvAddress2=? WHERE ordNo=?";  
	 PreparedStatement  pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1, Id); 
     pstmt.setString(2, dday);
	 pstmt.setString(3, rcv); 
	 pstmt.setString(4, rcvhp);
	 pstmt.setString(5, rcvadd);
	 pstmt.setString(6, rcvadd2);
	 pstmt.setString(7, no);

     pstmt.executeUpdate();  
	 //   ��������ؼ� DB�� ��ǰ������ ����(����)�ϴ� �κ��� �Ϸ��!
     //   ���ĺ��� ������ ������ ������ ������ �� �������� �����ֱ� ���� �뵵�� �ڵ���.

	// ������ ��ǰ������ ������ ��ȸ(���)�ϱ� ���� SQL�� �ۼ�
	 String jsql2 =  "SELECT * FROM orderinfo WHERE ordNo=?";  	 
	 PreparedStatement  pstmt2 = con.prepareStatement(jsql2);
	 pstmt2.setString(1, no);

	 ResultSet rs = pstmt2.executeQuery();
     rs.next();
%>

<div class="selallorder">
	<p>������ ��ǰ������ ������ �����ϴ�.</p>
</div>
<table class="sela2">
		<tr><td>�ֹ���ȣ</td> <td><%=rs.getString("ordNo")%></td></tr>
		<tr><td>�ֹ��� ID</td> <td><%=rs.getString("memId")%></td></tr>
		<tr><td>�ֹ���¥</td><td><%=rs.getString("ordDate")%></td></tr>
		<tr><td>������</td><td><%=rs.getString("ordReceiver")%></td></tr>
		<tr><td>������ ����ó</td> <td><%=rs.getString("ordRcvPhone")%></td></tr>
		<tr><td>������ �ּ�</td> <td><%=rs.getString("ordRcvAddress1")%><%=rs.getString("ordRcvAddress2")%></td></tr>
</table>
<div class="selebtn">
	<p>
		<a href="selectAllorder.jsp" align=center style="font-size:10pt;font-family:���� ����">��ü����ֹ���ȸ</a>
	</p>
</div>
<%
    } catch (Exception e) {
    	out.println(e);
}
%>
</center>
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
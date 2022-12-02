<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="wodtj=device.width, inital-scale=1.0">
    <title>hanzan main</title>
    <link rel="stylesheet" href="../hanzan/css/hanzan.css">
    <script src="js/jquery-2.2.4.min.js"></script>
    <script src="js/hanzan.js"></script>
	<script language="javascript" src="js_package.js"></script>
	<script type = "text/javascript" src = "https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
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
		<img src="../hanzan/img/logo.png" style="margin-top:20px;"></a></div>
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
<body>

<%
	//  �α��� ������(loginOK.jsp�� 42~51�� �κ�)�� �ο��� "sid" �Ӽ��� �Ӽ����� 
	//  "Ư��ȸ���� ID"�� ��Ÿ����,  �� �Ӽ����� null���� �ƴ����� �α��� ���θ� Ȯ����. 
	//  (�α����� �ȵ� ���, �� ���� null���� ����)
	//  => loginOK.jsp�� 43�࿡��, session.setAttribute("sid", id); ��  �̹� ������ ������.
	//  ����, �̷��� ID���� �������� ���ؼ��� (String)session.getAttribute("sid"); �� �̿��ϸ� ��!
	String myid = (String)session.getAttribute("sid");  

if (myid == null)    //  �α��� ���� ���� ���¿���, ��ٱ��ϸ� ������ �ϴ� ����� ó��(24~34��)
{                             //   =>  ���� �α����� �ϵ��� ������ 
%>
<center>
<br><br><br> 
<div style="font-size:20px; margin-top:350px; height:450px ">
      ��ǰ �ֹ��� ���ؼ��� �α����� �ʿ��մϴ�! <br><br>   <a href="login.jsp">login</a>
</div>
</center>
<%
}
else    // �̹� �α��εǾ� �ִ� ���,  ��ٱ��� ���� ó�� �κ�(35��~�� ����)
{
 try
	 {
 	    String DB_URL="jdbc:mysql://localhost:3306/hanzan";    //  ���� DB�� project
        String DB_ID="multi"; 
        String DB_PASSWORD="abcd";
 	 
	    Class.forName("org.gjt.mm.mysql.Driver");  
 	    Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

		String ctNo = session.getId();  //���� ��ȣ�� ��ٱ��� ��ȣ(ctNo)�μ� �̿��ϱ� ���� ctNo�� ����
 	                                                          // session.getId()�Լ��� ���ϰ�(�����)��  ���ǹ�ȣ(����ID)��.

        // [���ǰ� ������ ���� �ο� ����] :
        // Ŭ���̾�Ʈ�� ������ �����ϰ� �Ǹ� �����κ��� ���ǹ�ȣ(���������� �ĺ���ȣ)�� �ο�����.
        //  => �ο����� ���ǹ�ȣ�� ���α׷��󿡼� ���������� session.getId()�� �����.
        // �ο����� ���ǹ�ȣ�� �α��� �� ���� ����(������ �����Ǵ� ����) �״�� �����ȴ�.
        // ����, ������ ID�� ������ �������ϰ� �Ǵ��� �� ���ο� ���ǹ�ȣ�� �ο�����.
        // => ����, �̷��� ������ �̿��ϸ�, ��ٱ����� ������ �״�� ǥ�������� �� �� �ִ�. 

         
		 //  ��ٱ������̺�(cart ���̺�)�� �����ϴ� �� �ʵ尡 ctNo, prdNo, ctQty�ӿ� �ָ�!
		String prdNo = request.getParameter("prdNo"); // ��ǰ��ȣ
		int ctQty = Integer.parseInt(request.getParameter("qty")); //  �ֹ�����(��ٱ��Ͽ� ���� ��ǰ����)


		// (72~76��):  Ư��ȸ���� �α��� �� �ִ� ���ȿ�(Ư�� ���ǹ�ȣ),  ������ ��ǰ�� 
		// ��ٱ��� ���̺��� �̹� ��Ҿ����� �ƴ����� Ȯ���ϱ� ���ؼ� select���� �̿���!

		//  (1) ����� �ϴ� ��ǰ���ڵ尡 �̹� ��ٱ������̺�(cart)�� �����ϴ� ���(76~87�� �κ�) :
		//      => ��ٱ������̺��� ���ο� ��ǰ���ڵ带 �߰�(insert)��Ű�� ���� �ƴ϶�, 
		//           �̹� �����ϴ� ��ǰ���ڵ忡 ��ǰ�������� ����(update)��Ų��.
		//  (2) ����� �ϴ� ��ǰ���ڵ尡 ��ٱ������̺�(cart)�� �������� �ʴ� ���(88~97�� �κ�):
		//      => ��ٱ������̺��� ���ο� ��ǰ���ڵ带 �߰�(insert)��Ų��.
		String jsql = "select * from cart where ctNo = ? and prdNo = ?";
		PreparedStatement pstmt = con.prepareStatement(jsql);
		pstmt.setString(1, ctNo);
		pstmt.setString(2, prdNo);
		ResultSet rs = pstmt.executeQuery(); 

	   	if(rs.next())   // ���� ��ǰ�� �̹� ��ٱ��Ͽ� �����Ѵٸ� �������� ����/���Ž�Ŵ.
		{		               // ��, update���� ����Ͽ� �̹� �����ϴ� ��ǰ�������� �����κи��� ���Ž�Ŵ.
			int sum = rs.getInt("ctQty") + ctQty;  //  �̹� ������ �ִ� �������� ���� �߰���ų ������ �ջ���.

			String jsql2 = "update cart set ctQty=? where ctNo=? and prdNo=?";
			PreparedStatement pstmt2 = con.prepareStatement(jsql2);
			pstmt2.setInt(1, sum);
			pstmt2.setString(2, ctNo);
			pstmt2.setString(3, prdNo);

			pstmt2.executeUpdate();
		}
		else  // ���� ��ǰ�� ��ٱ��Ͽ� �������� �ʴ´ٸ�, ���ο� ��ǰ���ڵ带 ��ٱ��� ���̺��� �߰���Ŵ
		{
			String jsql3 = "insert into cart (ctNo, prdNo, ctQty) values (?,?,?)";
			PreparedStatement pstmt3 = con.prepareStatement(jsql3);
			pstmt3.setString(1,ctNo);
			pstmt3.setString(2,prdNo);
			pstmt3.setInt(3,ctQty);	

			pstmt3.executeUpdate();
		}  //  76��~97�� if-else���� ��
	 } 	catch(Exception e)  {
             out.println(e);
    }  // catch�� �ݱ�		

     //  ��ٱ��Ͽ� ��ǰ�� ��� �Ǵ� ���Ž�Ų ��, ��ٱ��� ������ �����ֵ��� showCart.jsp�� ȣ����.   
	    response.sendRedirect("showCart.jsp");   //  <jsp:forward page="showCart.jsp"/> �� ������ �ǹ�
}  // 24~104�� if-else���� ��	                                     
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
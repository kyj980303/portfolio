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
		<img src="../hanzan/img/logo.png" style="margin-top:20px"></a></div>
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
<div class="cart">
        <p class="cartt" style="width: 647px; text-align: left; float: left; font-size: 52px; font-family: G���� �꽺 TTF;">��ٱ���</p>
        <div class="icons">
            <ul class="carticon">
                <li><a href="showCart.jsp"><img src="./img/carticon.png"></a></li>
                <li><p style="font-size: 16px; font-family: G���� �꽺 TTF; color: #000; margin-top: 20px; margin-left: 14px;">��ٱ���</p></li>
            </ul>
            <ul class="ordericon">
                <li><a href="#"><img src="./img/ordericon.png"></a></li>
                <li><p style="font-size: 16px; font-family: G���� �꽺 TTF; color: #000; margin-top: 20px; margin-left: 14px;">�ֹ����ۼ�/����</p></li>
            </ul>
            <ul class="orderokicon">
                <li><a href="#"><img src="./img/orderokicon.png"></a></li>
                <li><p style="font-size: 16px; font-family: G���� �꽺 TTF; color: #000; margin-top: 20px; margin-left: 14px;">�����Ϸ�</p></li>
            </ul>
        </div>
    </div>
<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/hanzan";    // ���� DB�� project
     String DB_ID="multi"; 
     String DB_PASSWORD="abcd";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	 String ctNo = session.getId();   //���� ��ȣ�� ��ٱ��� ��ȣ�μ� �̿��ϱ� ���� ctNo�� ����
	

	 // ��ٱ��Ͽ� ������ ��� ����, mysql�󿡼� select * from cart;�� ����� �Բ� Ȯ��/�� �ذ��鼭
	 // cart���̺��� �����ִ� ��ǰ���ڵ������� ��ٱ��Ϲ�ȣ(ctNo)�� �Բ� ������ ������ �� ��!
	 //  =>  Ȩ�������󿡼� �������� ��ٱ��� ������ ���Ե� ���ڵ����, ������ cart���̺��󿡼��� 
	 //         ������ �ǹ��ϰ� �ִ��� ������ ������ �� ��! (�߿�!)
	 String jsql = "select * from cart where ctNo = ?";
	 PreparedStatement pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1, ctNo);

	 ResultSet rs = pstmt.executeQuery();

	 if(!rs.next())    // ��ȸ ����� �������� ������,  rs.next()�� false�� ������. 
	 {                       //  ����,  !rs.next()�� ���� true�� �� 
%>
		<p style="margin-top:250px; font-size:20px; height:300px">��ٱ��ϰ� ������ϴ�.
<%
	}
	else
	{
%>
		
	
<%
//  [74��~109�� ����] :
//  ��ٱ��Ͽ� ��� ��ǰ������ ���������� �����ְ��� �� ��, ������ �׸����
//  ��ǰ��ȣ(prdNo),  ��ǰ��(prdName),  ��ǰ�ܰ�(prdPrice),  �ֹ�����(ctQty), 
//  �ֹ���(prdPrice*ctQty ),  ��ü�ֹ��Ѿ�(total)���� �����ǰ� ������ ������ ��! 
//   => ��ٱ��ϴ�� ���� �� �������� �ش� ���������� ��°���� ���� �� ������ҵ��� Ȯ�� ���!

//  cart ���̺�:  ��ǰ��ȣ(prdNo)�� �ֹ�����(ctQty) ���� ������ �� �� ����.
//  goods ���̺�:  ��ǰ��(prdName)�� ��ǰ�ܰ�(prdPrice) ���� ������ �� �� ����.
//  ����, cart���̺��� goods���̺��κ���, ������ ��ǰ��ȣ(prdNo)�� �ش��ϴ� �� �׸���� ���� 
//  ������ �� �� �ִ�. (mysql�󿡼� cart���̺��� goods���̺��� ��� �ʵ���� �����ϴ��� Ȯ�� ���!)
//  =>  <�˰����� ����>:  cart���̺��κ��� ��ǰ��ȣ(prdNo)�� �ֹ�����(ctQty) ���� ������ ����, 
//         ���⼭ ������ ��ǰ��ȣ(prdNo)�� �ٰ��Ͽ� goods���̺��κ���
//         ��ǰ��(prdName)�� ��ǰ�ܰ�(prdPrice) �� ������ ����.
//         �̸� ����, �ֹ���(prdPrice*ctQty )��  ��ü�ֹ��Ѿ�(total)�� ����� ����.
//         �׷� ����, ������ �� �� �ʵ�� �� ���� ��������� ���������� ����� �ش�. 
//         ����, �̷��� ���ڵ������ �ʵ����� �� ������������ ����ϴ� ������ 
//         �� �̻� ��ٱ��Ͽ� ��ǰ���ڵ尡 ���� ������(�� ��ǰ���ڵ� �� ��ŭ) �ݺ��Ѵ�.  


		String jsql2 = "select prdNo, ctQty from cart where ctNo = ?";
		PreparedStatement pstmt2 = con.prepareStatement(jsql2);
		pstmt2.setString(1, ctNo);		

		ResultSet rs2 = pstmt2.executeQuery(); 

		int total=0;

		while(rs2.next()) 
  		{			                   
			String prdNo = rs2.getString("prdNo");	//  cart���̺��κ��� ��ǰ��ȣ ����
    		int ctQty = rs2.getInt("ctQty");	                //  cart���̺��κ��� �ֹ����� ���� 

    		String jsql3 = "select prdName, prdPrice from goods where prdNo = ?";
	    	PreparedStatement pstmt3 = con.prepareStatement(jsql3);
		    pstmt3.setString(1, prdNo);
		    
			ResultSet rs3 = pstmt3.executeQuery(); 
			rs3.next();

			String	prdName =  rs3.getString("prdName");	  //  goods ���̺��κ��� ��ǰ�� ����
			int prdPrice =  rs3.getInt("prdPrice");                 //  goods ���̺��κ��� ��ǰ�ܰ� ����
				
    		int amount = prdPrice * ctQty;    //  �ֹ��� ���
			total = total + amount;                  //  ��ü �ֹ��Ѿ� ���
%> 
  <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<table class="carttable">
    <tbody>
    <tr>       
        <td class="goods"><img src="./img/c<%=prdNo%>.png"></td>
        <td class="data">
            <p>��ǰ��ȣ <%=prdNo%></p>
            <p><%=prdName%></p>
            <p>���� <%=ctQty%></p>
            <p>��ǰ���� <fmt:formatNumber value="<%=amount%>" type="number"/></p>
        </td> 
        <td class="del">
            <p><a href="deleteCart.jsp?prdNo=<%=prdNo%>"><b>��ǰ����</b></a></p>
        </td>
    </tr> 	

<%
	     }  // while���� ��
 %>
    <tr class="total">
        <td colspan = 4 align=center><b>��ü �ֹ� �Ѿ�</b></td>
        <td align=right style="position: relative; left:25px;"><b><fmt:formatNumber value="<%=total%>" type="number"/>��</b></td>
    </tr>
    </tbody>
</table>      
<div class="cartbtn">
	<p>
		<a href="deleteAllCart.jsp">��ٱ��� ����</a>
		<a href="order.jsp">�ֹ��ϱ�</a>
	</p>
</div>      

<%
		}	
   }  catch(Exception e)  {
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
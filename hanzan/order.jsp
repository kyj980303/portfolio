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
<script language="javascript" >
function zipCheck()
{
	window.open("zipCheck.jsp", "win", "width=600, height=200, scrollbars=yes, status=yes");
}
</script>

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
    </header>
<script language="javascript" src="js_package.js"></script>

<center>
<div class="cart">
        <p class="cartt" style="width: 647px; text-align: left; float: left; font-size: 52px; font-family: G���� �꽺 TTF;">�ֹ����ۼ�/����</p>
        <div class="icons">
            <ul class="carticon">
                <li><a href="showCart.jsp"><img src="./img/carticon2.png"></a></li>
                <li><p style="font-size: 16px; font-family: G���� �꽺 TTF; color: #000; margin-top: 20px; margin-left: 14px;">��ٱ���</p></li>
            </ul>
            <ul class="ordericon">
                <li><a href="#"><img src="./img/ordericon2.png"></a></li>
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
      <p style="margin-top:100px; font-size:20px;">��ٱ��ϰ� ������ϴ�.
<%
   }
   else
   {
%>
<%
//  [78��~113�� ����] :
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
         String prdNo = rs2.getString("prdNo");   //  cart���̺��κ��� ��ǰ��ȣ ����
          int ctQty = rs2.getInt("ctQty");                   //  cart���̺��κ��� �ֹ����� ���� 

          String jsql3 = "select prdName, prdPrice from goods where prdNo = ?";
          PreparedStatement pstmt3 = con.prepareStatement(jsql3);
          pstmt3.setString(1, prdNo);
          
         ResultSet rs3 = pstmt3.executeQuery(); 
         rs3.next();

         String prdName =  rs3.getString("prdName");     //  goods ���̺��κ��� ��ǰ�� ����
         int prdPrice =  rs3.getInt("prdPrice");                 //  goods ���̺��κ��� ��ǰ�ܰ� ����
            
          int amount = prdPrice * ctQty;    //  �ֹ��� ���
         total = total + amount;                  //  ��ü �ֹ��Ѿ� ���
%>
	<script>	

	$(document).ready(function(){
		$("#iamportPayment").click(function(){
			payment();
		});
	})

	function payment(data) {
		IMP.init('imp75627170');
		IMP.request_pay({
			pg: "kakaopay.TC0ONETIME",
			pay_method : "card",
			merchant_uid : Math.random(),
			name : "<%=prdName%>", // ��ǰ��
			amount: <%=total%>, // �ݾ�
			buyer_email : "testiamport@naver.com",
			buyer_name : "ȫ�浿",
			buyer_tel : "01011111111"
		}, function (rsp) {
			if(rsp.success) {
				document.newMem.submit();
			} else {
				alert("������ ����Ͽ����ϴ�.");
			}
			});
		}
</script>
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

<%
   // (2)�ֹ��� ���� ��� - ȸ�� ���̺� ���� ���
   String myid = (String)session.getAttribute("sid");  // �α����߾��� �ֹ��� ����(��, ���̵�)�� �޾ƿ�

   String jsql4 = "select memName, memPhone from member where memId = ?";
   PreparedStatement pstmt4 = con.prepareStatement(jsql4);
   pstmt4.setString(1,myid);

   ResultSet rs4 = pstmt4.executeQuery();
   rs4.next();
   String  name = rs4.getString("memName");
   String  tel = rs4.getString("memPhone");
%>

<form name="newMem" method="Post" action="orderOk.jsp">     <!--  ���� �̸��� form���� ������ -->
   <tr class="orderdata">
        <td>
            <p style="font-family: G���� �꽺 TTF;">�ֹ��� ����</p>
        </td>
      <td>
            <p style="font-family: G���� �꽺 TTF;">�ֹ��� <span><%=name%></span></p>
         <p style="font-family: G���� �꽺 TTF;">�޴��� ��ȣ <span><%=tel%></span></p>
   </tr>
   <tr class="recipient">
        <td>
            <p style="font-family: G���� �꽺 TTF;">������ ����</p>
        </td>
      <td>
            <p style="font-family: G���� �꽺 TTF;">�� �� <input type="text" name="receiver" placeholder="������ ������ �Է����ּ���." size=40><p>
            <p style="font-family: G���� �꽺 TTF;">�޴��� ��ȣ <input type="text" name="rcvPhone" class="reciph" placeholder="������ �޴��� ��ȣ�� �Է����ּ���."size=40></p>
            <p style="font-family: G���� �꽺 TTF;">�� �� 
				<input type="text" class ="post" name="zipcode" size="7" readonly placeholder="������ȣ�� �Է����ּ���."> 
			    <input type="button" class ="postbtn" value="������ȣ�˻�" onClick="zipCheck()"><br>     
                <input type="text" class ="radd" name="address1" size="100" readonly placeholder="�ּҸ� �Է����ּ���."><br>
				<input type="text" class ="radd" name="address2" size="100" placeholder="���ּҸ� �Է����ּ���.">
            </p>
        </td>
   </tr>
    
   <tr class="total">
        <td colspan = 4 align=center><b>��ü �ֹ� �Ѿ�</b></td>
        <td align=right><input type="hidden" name="pay" value="<%=total%>"> <b><fmt:formatNumber value="<%=total%>" type="number"/>��</b></td>
    </tr>
    </tbody>
</table>   

<div class="cartbtn2">
    <p>
        <input type="reset" value="�ֹ����" name="reset" >
		<button type = "button" id = "iamportPayment" OnClick="check_val()">�����ϱ�</button>
    </p>
</div>                        
</form>    
<%
    }   //  if-else���� ��
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
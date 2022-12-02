<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="wodtj=device.width, inital-scale=1.0">
    <title>���� ����</title>
    <link rel="stylesheet" href="../hanzan/css/hanzan.css">
    <script src="js/jquery-2.2.4.min.js"></script>
    <script src="js/hanzan.js"></script>
	<script language="javascript" src="js_package.js"></script>

</head>
<body onload="init();">
<script language="JavaScript">

var sell_price;
var qty;

function init () {
	sell_price = document.product.sell_price.value;
	qty = document.product.qty.value;
	document.product.sum.value = sell_price;
	change();
}
function change () {
	obj = document.product.qty;
	sum = document.product.sum;

		if (obj.value < 0) {
			obj.value = 0;
		}
	sum.value = parseInt(obj.value) * sell_price;
	sum.value = comma(uncomma(sum.value));
}  

 function comma(str) {
     str = String(str);
     return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
 }

 function uncomma(str) {
     str = String(str);
     return str.replace(/[^\d]+/g, '');
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
		<img src="../hanzan/img/logo.png"></a></div>
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
	<%
 try{
	String DB_URL="jdbc:mysql://localhost:3306/hanzan";    //  ����DB���� project�ӿ� ����!
    String DB_ID="multi";  
    String DB_PASSWORD="abcd"; 
 	 
	Class.forName("org.gjt.mm.mysql.Driver"); 
 	Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	request.setCharacterEncoding("euc-kr");
	String pNo = request.getParameter("prdNo");   //  ����ȸ�ϰ��� �ϴ� ��ǰ��ȣ�� �Ѱܹ޾ƿ�

    String jsql = "select * from goods where prdNo = ?";   
	PreparedStatement pstmt  = con.prepareStatement(jsql);
	pstmt.setString(1, pNo);

	ResultSet rs = pstmt.executeQuery();
    rs.next();

	String no = rs.getString("prdNo");
    String name = rs.getString("prdName");	
	int price = rs.getInt("prdPrice");
	String description = rs.getString("prdDescription");
%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<form name= "product"  method="post">   
        <ul class="viewDetail">
            <li class="dimg"><a href="javascript:enlarge()"><img src="./img/<%=no%>.png"></a></li>
            <li class="detailTxt">
                <p style="font-family: '����';">��ǰ��ȣ <%=no%></p>
				<p><input type="hidden" name="prdNo" value="<%=no%>"></p>
                <p style="font-family: 'HY�߰���';"><%=name%></p>
                <p style="font-family: '����';"><%=description%></p>
                <p style="font-family: 'HY�߰���';"><fmt:formatNumber value="<%=price%>" type="number"/> ��</p>
                <p>
                    <p style="float:left; position:relative; top:-43px; left:370px;">���� <input type="hidden" name="sell_price" value="<%=price%>"></p>
					<input class="num" type="text" name="qty" size="7" value="1" onblur="javascript:amountCheck();"onchange="change();"style="position:relative; top:-45px; left:370px;">
                    <input type="button" value="-" onClick="amountMinus();" style="width:18;height:16;position:relative; top:-45px; left:330px;">
                    <input type="button" value="+" onClick="amountPlus();" style="width:18;height:16;position:relative; top:-45px; left:330px;">
                </p>
                <select style="position:relative; top:-45px;">
                    <option>���ι�</option>
                    <option>���� ����</option>
                </select>
                <p class="bar" style="position:relative; top:-45px;"></p>
                <p style="position:relative; top:-45px;font-size:20px;">�� ��ǰ�ݾ� <span><input name="sum" size="11" readonly style = "border:none;font-size:26px;width:90px;color:#88a736; margin-left:305px;">��</span></p>
                <p>
                    <img class="directimg" src="./img/directorder.png" onClick="javascript:directOrd()" alt="�ٷ� �����ϱ�"> 
                </p>
                <p>
                    <img src="./img/incart.png" onClick="javascript:inCart()" style="margin-right:20px;" alt="��ٱ��� ���">
                    <img src="./img/wish.png" onClick="javascript:favorit()" alt="���ø���Ʈ"></a>
                </p>
            </li>
        </ul>
	</form>
    
    <div class ="mdetail">
		<img src="./img/detail<%=no%>.png">
        <div class="mdetailtxt">
            <p><%=name%> 10����</p>
            <p>
                <span>�Ƕ�̵� Ƽ���� �ϳ���</span>
                <span>����Ǿ��ֽ��ϴ�.</span>
                <span>������ Ƽ���� �Ϲ� Ƽ����� �޸�,</span>
                <span>������ ���� �� �� �����Ǵ� ������</span>
                <span>���� ���� �� �췯���ϴ�.</span>
            </p>
        </div>
	</div>
	<div class="delicious">
        <p class="delicioustitle">���� Ƽ��<span>�� ���ְ� ���� ���</span></p>
        <ul class="deliciousimg">
            <li>
                <img src="./img/first.png">
                <p>�����غ�</p>
                <p>1�� 1�Ƕ�̵� Ƽ���� �غ��մϴ�.</p>
            </li>
            <li>
                <img src="./img/second.png">
                <p>�����غ�</p>
                <p>������� �߰ſ� ������ ���ñ� �������Դϴ�.<span>90���� ���� 150ml�غ����ּ���.</span></p>
            </li>
            <li>
                <img src="./img/third.png">
                <p>��ٸ� �� ����</p>
                <p>2�а� õõ��,<span>������ ������ ���� ���Ѻ�����.</span></p>
            </li>
        </ul>
    </div>
    <div class="size">
        <img src="./img/size<%=no%>.png">
        <p>��ǰ ���� �ȿ� ���� 99mm ���� 86mm�� Ƽ������ �����Ǿ� �ֽ��ϴ�.</p>
    </div>
    
    <div class="categorybest">
        <p class="ctgtitle">BEST ��ǰ</p>
        <ul class="ctgbest">
            <li>
                <a href="viewDetailProduct3.jsp?prdNo=B2"><img src="./img/bestB1.png"></a>
                <p>���� �׸�Ƽ<span>23,000��</span></p>
            </li>
            <li>
                <a href="viewDetailProduct3.jsp?prdNo=B3"><img src="./img/bestB2.png"></a>
                <p>�޺��ȱ�<span>23,000��</span></p>
            </li>
            <li>
                <a href="viewDetailProduct3.jsp?prdNo=B4"><img src="./img/bestB3.png"></a>
                <p>������ä & ��Ƽ<span>9,500��</span></p>
            </li>
            <li>
                <a href="viewDetailProduct3.jsp?prdNo=B6"><img src="./img/bestB4.png"></a>
                <p>��� �ܹ� Ƽ<span>9,500��</span></p>
            </li>
        </ul>
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
	<%
    } catch(Exception e) {
      out.println(e);
}
%>
</body>
</html>





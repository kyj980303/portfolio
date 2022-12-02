<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>���ø���Ʈ�� ���</title>

 <style type="text/css">
     a:link { text-decoration: none; color: black; }           <!-- Ŭ���ϱ����� ������ ������ ������ -->
     a:visited { text-decoration: none; color: black; }     <!-- �湮�ѵ��� ������ ���پ��� ���� -->
     a:hover { text-decoration: underline; color:blue; } <!-- ���콺�� �ö󰥶� ������ �Ʒ����ְ� �Ķ� -->
 </style>

</head>
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
<font style="font-size:10pt;font-family:���� ����">
		��ǰ�� ���ø���Ʈ�� ��� ���ؼ��� �α����� �ʿ��մϴ�! <br><br>	<a href="login.jsp" ><img src="./images/login.gif" border=0></a>
</font>
</center>
<%
}
else    //  �̹� �α��εǾ� �ִ� ���,  ��ٱ��� ���� ó�� �κ�(35��~�� ����)
{
 try
	 {
 	    String DB_URL="jdbc:mysql://localhost:3306/hanzan";    //  ���� DB�� project
        String DB_ID="multi"; 
        String DB_PASSWORD="abcd";
 	 
	    Class.forName("org.gjt.mm.mysql.Driver");  
 	    Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 


        // [���ǰ� ������ ���� �ο� ����] :
        // Ŭ���̾�Ʈ�� ������ �����ϰ� �Ǹ� �����κ��� ���ǹ�ȣ(���������� �ĺ���ȣ)�� �ο�����.
        //  => �ο����� ���ǹ�ȣ�� ���α׷��󿡼� ���������� session.getId()�� �����.
        // �ο����� ���ǹ�ȣ�� �α��� �� ���� ����(������ �����Ǵ� ����) �״�� �����ȴ�.
        // ����, ������ ID�� ������ �������ϰ� �Ǵ��� �� ���ο� ���ǹ�ȣ�� �ο�����.
        // => ����, �̷��� ������ �̿��ϸ�, ��ٱ����� ������ �״�� ǥ�������� �� �� �ִ�. 

        String prdNo = request.getParameter("prdNo"); // ��ǰ��ȣ
		 //  ��ٱ������̺�(cart ���̺�)�� �����ϴ� �� �ʵ尡 ctNo, prdNo, ctQty�ӿ� �ָ�!
		String jsql = "select prdName, prdPrice from goods where prdNo = ?";
		PreparedStatement pstmt = con.prepareStatement(jsql);
		pstmt.setString(1, prdNo);
		    
		ResultSet rs = pstmt.executeQuery(); 
		rs.next();

		String	prdName =  rs.getString("prdName");	  //  goods ���̺��κ��� ��ǰ�� ����
		int prdPrice =  rs.getInt("prdPrice");  


		// (72~76��):  Ư��ȸ���� �α��� �� �ִ� ���ȿ�(Ư�� ���ǹ�ȣ),  ������ ��ǰ�� 
		// ��ٱ��� ���̺��� �̹� ��Ҿ����� �ƴ����� Ȯ���ϱ� ���ؼ� select���� �̿���!

		//  (1) ����� �ϴ� ��ǰ���ڵ尡 �̹� ��ٱ������̺�(cart)�� �����ϴ� ���(76~87�� �κ�) :
		//      => ��ٱ������̺��� ���ο� ��ǰ���ڵ带 �߰�(insert)��Ű�� ���� �ƴ϶�, 
		//           �̹� �����ϴ� ��ǰ���ڵ忡 ��ǰ�������� ����(update)��Ų��.
		//  (2) ����� �ϴ� ��ǰ���ڵ尡 ��ٱ������̺�(cart)�� �������� �ʴ� ���(88~97�� �κ�):
		//      => ��ٱ������̺��� ���ο� ��ǰ���ڵ带 �߰�(insert)��Ų��.

	   	
		String jsql2 = "insert into favorit (prdNo, prdName, prdPrice) values (?,?,?)";
		PreparedStatement pstmt2 = con.prepareStatement(jsql2);
		pstmt2.setString(1,prdNo);
		pstmt2.setString(2,prdName);
		pstmt2.setInt(3,prdPrice);	

		pstmt2.executeUpdate();
	 } 	catch(Exception e)  {
             out.println(e);
    }  // catch�� �ݱ�		

     //  ��ٱ��Ͽ� ��ǰ�� ��� �Ǵ� ���Ž�Ų ��, ��ٱ��� ������ �����ֵ��� showCart.jsp�� ȣ����.   
	    response.sendRedirect("showfavorit.jsp");   //  <jsp:forward page="showCart.jsp"/> �� ������ �ǹ�
}  // 24~104�� if-else���� ��	                                     
%>
</body>
</html>
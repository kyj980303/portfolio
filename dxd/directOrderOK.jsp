<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*, java.text.*" %>
<html>
<head>
<title>�ֹ� ó�� �Ϸ�</title>

 <style type="text/css">
     a:link { text-decoration: none; color: black; }           <!-- Ŭ���ϱ����� ������ ������ ������ -->
     a:visited { text-decoration: none; color: black; }     <!-- �湮�ѵ��� ������ ���پ��� ���� -->
     a:hover { text-decoration: underline; color:gray; } <!-- ���콺�� �ö󰥶� ������ �Ʒ����ְ� �Ķ� -->
 </style>

</head>

<%
//   cart ���̺��� �ƴ϶�, tempcart ���̺��� ����ϰ� (61�� ����),
//   deleteAllCart.jsp?case=1�� �ƴ϶�, deleteTempCart.jsp�� ����Ѵ�(108�� ����)�� ���� �����ϸ�,
//   directOrderOK.jsp�� orderOK.jsp�� ��� �ڵ尡 �����Կ� ������ ��!

try{
 	 String DB_URL="jdbc:mysql://localhost:3306/dxd";    // ���� DB�� project
     String DB_ID="multi"; 
     String DB_PASSWORD="abcd";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	request.setCharacterEncoding("euc-kr");

	String ctNo = session.getId();   //  ���ǹ�ȣ(��ٱ��Ϲ�ȣ) �� ctNo�� ����
    String	myid = (String)session.getAttribute("sid");  //   ���� ID ���� �����ͼ� ���� myid�� ����.
                                                                                            //  �ֹ��������� ���� ���� �ʿ���.
	String oName = request.getParameter("name");
	String oTel = request.getParameter("memTel");
	String oReceiver = request.getParameter("receiver");
	String 	oRcvAddress = request.getParameter("rcvAddress");
	String 	oRcvPhone = request.getParameter("rcvPhone");		
	String oCardNo = request.getParameter("cardNo");
	String oCardPass = request.getParameter("cardPass");
	String 	oBank = request.getParameter("bank");
	String 	oPay = request.getParameter("pay");   		

// ���ο� �ֹ���ȣ(ordNo)�� �ο��ϱ� ����, �ֹ����̺��� �ִ� ������ �ֹ���ȣ�� ������.
// �ֹ��� ���� ������ �ֹ���ȣ�� 1�� �����ϹǷ�, MAX(ordNo)�� ordNo�� �ִ밪, �� 
//  ������ �ֹ���ȣ�� �ǹ���.
	String jsql = "select MAX(ordNo) from orderInfo";
	PreparedStatement pstmt = con.prepareStatement(jsql);

	ResultSet rs = pstmt.executeQuery(); 

	int oNum;
	if(rs.next())                             // �ֹ���ȣ�� orderinfo ���̺��� �����Ѵٸ�,  "���� �ֹ���ȣ" + 1 �� ����
		oNum = rs.getInt(1) + 1;    //  rs.getInt(1)�� �ǹ�:   rs.next()�� ����Ű�� �ִ� ���ڵ��� ù��° �ʵ忡 
		                                             //  �ش��ϴ� �ʵ尪�� �ǹ��� 
		                                             //  �� ���, rs.getInt(1)��  rs.getInt("MAX(ordNo)")�� ������ �ǹ̰� ��.
  												     //  => mysql�󿡼� sql���� �����Ͽ� �� �����ǹ̰� �Ǵ��� �� Ȯ���� �� ��!
	else                     
		oNum = 1;   // �ֹ���ȣ�� �������� �ʴ´ٸ�, �ֹ���ȣ�� 1���� �����ϵ��� ��
	                         // (���� �� �Ѱ��� �ֹ��� �������� ���� ���¶��, �ֹ���ȣ�� �������� ���� ���� ����) 

	String jsql2 = "select prdNo, ctQty from tempcart where ctNo = ?";   //  tempcart ���̺��� ����ϰ� ������ ����!
	PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	pstmt2.setString(1, ctNo);		

	ResultSet rs2 = pstmt2.executeQuery(); 

//  tempcart ���̺��� �ִ� �������� �о�ͼ�,
//  �ֹ���ǰ ���̺�(ordProduct)�� �ֹ���ȣ(ordNo), ��ǰ��ȣ(prdNo), �ֹ�����(ordQty)�� �����Ŵ!
	while(rs2.next())   // �ֹ���ǰ���̺�(orderProduct)�� �ֹ���ȣ(ordNo), ��ǰ��ȣ(prdNo), 
	{			                    // �ֹ�����(ordQty)�� �����ϱ� ���� tempcart ���̺��κ���
	                                //  prdNo�� ctQty�� �����´�.
			String prdNo = rs2.getString("prdNo");	//  tempcart ���̺��κ��� ��ǰ��ȣ ����
    		int ctQty = rs2.getInt("ctQty");	                //  tempcart ���̺��κ��� �ֹ����� ���� 

			String jsql3 = "INSERT INTO orderProduct (ordNo, prdNo, ordQty) VALUES (?,?,?)";
			PreparedStatement pstmt3 = con.prepareStatement(jsql3);
			pstmt3.setString(1, Integer.toString(oNum));
			pstmt3.setString(2, prdNo);
			pstmt3.setInt(3, ctQty);

			pstmt3.executeUpdate();
	 }

//  �ֹ����� ���̺�(ordInfo)�� �����ų �ʵ���� ���� 
	String jsql4 = "INSERT INTO orderInfo (ordNo, memId, ordDate, ordReceiver, ordRcvAddress, ordRcvPhone, ordPay, ordBank, ordCardNo, ordCardPass)  VALUES(?,?,?,?,?,?,?,?,?,?)";

// �ֹ����� ���� ��¥�� ordInfo���̺��� ����
	java.util.Date date = new java.util.Date();   //   Date Ÿ���� ��ü date ����
    String oDate = date.toLocaleString();         //   ���� oDate�� ���� �ð�(��.��.�� ��:��:��)�� ����

	PreparedStatement pstmt4 = con.prepareStatement(jsql4);
	pstmt4.setString(1, Integer.toString(oNum));
	pstmt4.setString(2, myid);
	pstmt4.setString(3, oDate);
	pstmt4.setString(4, oReceiver);
	pstmt4.setString(5, oRcvAddress);
	pstmt4.setString(6, oRcvPhone);
    pstmt4.setString(7, oPay);
	pstmt4.setString(8, oBank);
	pstmt4.setString(9, oCardNo);
	pstmt4.setString(10, oCardPass);

	pstmt4.executeUpdate();

//  �ֹ������� ���õ� ��ü�� �������� ���� orderproduct ���̺��� orderinfo ���̺��� 
//  �����Ų ��, tempcart ���̺� ���⸦ ������.

	 response.sendRedirect("deleteTempCart.jsp");    //  forward �׼��±׸� ����ص� ������

   }  catch(Exception e)  {
        out.println(e);
} 
%>
  
</body>
</html> 
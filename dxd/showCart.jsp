<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>��ٱ��� ���� ��ȸ</title>
</head>

<center>
<br><br>
<font color="blue" size='6'><b>[��ٱ��� ����]</b></font><p>

<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/dxd";  
     String DB_ID="multi"; 
     String DB_PASSWORD="abcd";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	String ctNo = session.getId();   //���� ��ȣ�� ��ٱ��� ��ȣ�μ� �̿��ϱ� ���� ctNo�� ����


	// ��ٱ��Ͽ� ������ ��� ����, mysql�󿡼� select * from cart;�� ����� �Բ� Ȯ��/�� �ذ��鼭
	// cart���̺� �����ִ� ��ǰ���ڵ������� ��ٱ��Ϲ�ȣ(ctNo)�� �Բ� ������ ������ �� ��!
	//  =>  Ȩ�������󿡼� �������� ��ٱ��� ������ ���Ե� ���ڵ����, ������ cart���̺�󿡼��� 
	//         ������ �ǹ��ϰ� �ִ��� ������ ������ �� ��! (�߿�!)
	String jsql = "select * from cart where ctNo = ?";
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, ctNo);

	ResultSet rs = pstmt.executeQuery();

	if(!rs.next())    // ��ȸ ����� �������� ������,  rs.next()�� false�� ������. 
	{                       //  ����,  !rs.next()�� ���� true�� �� 
%>
		��ٱ��ϰ� ������ϴ�.
<%
	}
	else
	{
%>

<table border=1  style="font-size:10pt;font-family:���� ���">
<tr>       
   <td bgcolor="#002C57"  width = 120 height="30" align="center" ><p align="center"><font size="2" color="#ECFAE4"><strong>��ǰ��ȣ</strong></font></td>       
   <td bgcolor="#002C57"  width = 120 height="30" align="center"><p><font  size="2" color="#ECFAE4"><strong>��ǰ��</strong></font></td>       
   <td bgcolor="#002C57"  width = 120 height="30" align="center"><p><font  size="2" color="#ECFAE4"><strong>��ǰ�ܰ�(��)</strong></font></td>       
   <td bgcolor="#002C57"  width = 120 height="30" align="center"><p><font  size="2" color="#ECFAE4"><strong>�ֹ�����(��)</strong></font></td>     
   <td bgcolor="#002C57"  width = 120 height="30" align="center" ><p><font size="2" color="#ECFAE4"><strong>�ֹ���(��)</strong></font></td>  
   <td bgcolor="#002C57"  width = 120 height="30" align="center" ><p><font size="2" color="red"><b>[��ǰ����]</b></font></td>
 </tr> 		

<%
//  [74��~109�� ����] :
//  ��ٱ��Ͽ� ��� ��ǰ������ ���������� �����ְ��� �� ��, ������ �׸����
//  ��ǰ��ȣ(prdNo),  ��ǰ��(prdName),  ��ǰ�ܰ�(prdPrice),  �ֹ�����(ctQty), 
//  �ֹ���(prdPrice*ctQty ),  ��ü�ֹ��Ѿ�(total)���� �����ǰ� ������ ������ ��! 
//   => ��ٱ��ϴ�� ���� �� �������� �ش� ���������� ��°���� ���� �� ������ҵ��� Ȯ�� ���!

//  cart ���̺�:  ��ǰ��ȣ(prdNo)�� �ֹ�����(ctQty) ���� ������ �� �� ����.
//  goods ���̺�:  ��ǰ��(prdName)�� ��ǰ�ܰ�(prdPrice) ���� ������ �� �� ����.
//  ����, cart���̺�� goods���̺�κ���, ������ ��ǰ��ȣ(prdNo)�� �ش��ϴ� �� �׸���� ���� 
//  ������ �� �� �ִ�. (mysql�󿡼� cart���̺�� goods���̺� ��� �ʵ���� �����ϴ��� Ȯ�� ���!)
//  =>  <�˰��� ����>:  cart���̺�κ��� ��ǰ��ȣ(prdNo)�� �ֹ�����(ctQty) ���� ������ ����, 
//         ���⼭ ������ ��ǰ��ȣ(prdNo)�� �ٰ��Ͽ� goods���̺�κ���
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
			String prdNo = rs2.getString("prdNo");	//  cart���̺�κ��� ��ǰ��ȣ ����
    		int ctQty = rs2.getInt("ctQty");	                //  cart���̺�κ��� �ֹ����� ���� 

    		String jsql3 = "select prdName, prdPrice from goods where prdNo = ?";
	    	PreparedStatement pstmt3 = con.prepareStatement(jsql3);
		    pstmt3.setString(1, prdNo);
		    
			ResultSet rs3 = pstmt3.executeQuery(); 
			rs3.next();

			String prdName = rs3.getString("prdName");	  //  goods ���̺�κ��� ��ǰ�� ����
			int prdPrice = rs3.getInt("prdPrice");                 //  goods ���̺�κ��� ��ǰ�ܰ� ����
			 
				
    		int amount = prdPrice * ctQty;    //  �ֹ��� ���
			total = total + amount;                  //  ��ü �ֹ��Ѿ� ���
%>
 <tr>       
    <td  bgcolor="#eeeede" height="30" align="center"><font size="2"><%=prdNo%></font></td>     
	<td  bgcolor="#eeeede" height="30"align="center"><font size="2"><%=prdName%></font></td> 
	<td  bgcolor="#eeeede" height="30"align="center" align=right><font size="2"><%=prdPrice%></font></td> 
	<td  bgcolor="#eeeede" height="30"align="center" align=right><font size="2"><%=ctQty%></font></td>
    <td  bgcolor="#eeeede" height="30"align="right"><font size="2"><%=amount%> ��</font></td>  
    <td  bgcolor="#eeeede" height="30"align="center"><a href="deleteCart.jsp?prdNo=<%=prdNo%>"><font size="2" color=blue><b>����</b></a></font></td> 	
  </tr>   
<%
	     }  // while���� ��
 %>
  <tr>
	<td colspan = 4 align=center><font size="2" color="red"><b>��ü �ֹ��Ѿ�</b></font></td>
	<td  bgcolor="#eeeede" height="30" align=right><font size="2" color="red"><b><%=total%> ��</b></font></td>
	<td align=center><font size=2 color=green>(���ù�ǰ ����)</font></td>
  </tr>
 </table>      

<br><br>
<a href="deleteAllCart.jsp" ><font size=2>��ٱ��� ����</font></a> &nbsp&nbsp
<a href="order.jsp" ><font size=2>�ֹ��ϱ�</font></a>

<%
		}	
   }  catch(Exception e)  {
        out.println(e);
} 
%>
 </center>                
</body>  
</html> 
<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>�ֹ��ϱ�</title>
</head>

<script language="javascript" src="js_package.js">
</script>

<body>
<center>
<%
	String myid = (String)session.getAttribute("sid");  
	// �α��� ������ �ο��� "sid" �Ӽ��� �Ӽ����� "Ư��ȸ���� ���̵�"�� ��Ÿ����, 
	// �� �Ӽ����� null���� �ƴ����� �α��� ���θ� Ȯ����. (�α����� �ȵ� ���, �� ���� null���� ����)
	// login_ok.jsp�� �ʹݺ� �ڵ� Ȯ�� ���!  ==> session.setAttribute("sid", id); �κ� Ȯ�ο��!

if (myid == null) 
{
%>
<center>
<br><br><br> 
<font style="font-size:10pt;font-family:���� ���">
		��ǰ �ֹ��� ���ؼ��� �α����� �ʿ��մϴ�! <br><br>	<a href="login.jsp" ><img src="./images/login.gif" border=0></a>
</font>
</center>
<%
}
else
{
 try { // (1)  (34��~151��):  tempcart ���̺� ��ñ����� ��ǰ���ڵ� ������, tempcart ������ �״�� �����ֱ� 

 	 String DB_URL="jdbc:mysql://localhost:3306/dxd";
     String DB_ID="multi"; 
     String DB_PASSWORD="abcd";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	 String ctNo = session.getId();   // ���� ��ȣ�� ��ٱ��� ��ȣ�μ� �̿��ϱ� ���� ctNo�� ����

    //   46~50�� �κ�:   ����, "��ñ����ϱ�" Ŭ�� ��, �ֹ��� �Ϸ����� �ʰ� �߰��� �ֹ��� ��ҽ�ų ��쿣, 
	//   �ֹ��Ϸ��� ��ҽ�Ų ��ǰ������ �״�� tempcart ���̺� �����ְ� �ȴ�. ����, �̷��� �������� 
	//   �����ϱ� ���Ͽ�, "��ñ����ϱ�"�� �����ϱ� ������ ��������� tempcart ���̺��� ����ֵ��� ó����.
	 String jsql5 = "delete from tempcart where ctNo=?";    
	 PreparedStatement pstmt5 = con.prepareStatement(jsql5);
	 pstmt5.setString(1, ctNo);
	
     pstmt5.executeUpdate();
    
     //   54�����, ������ "��ñ����ϱ�"�� ���õ� �ڵ�κ��� ���۵�.
     //  ������������(��)���κ��� "��ñ���"�ϰ��� �ϴ� ��ǰ��ȣ�� �ֹ������� �Ѱܹ޴´�.
	 String pNo = request.getParameter("prdNo");   // ��ǰ��ȣ
	 int Qty = Integer.parseInt(request.getParameter("qty"));   //  �ֹ�����

      // tempcart ���̺� "��ñ���"��  ��ǰ���ڵ带 �����Ŵ
	 String jsql = "insert into tempcart (ctNo, prdNo, ctQty) values (?,?,?)";  
	 PreparedStatement pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1,ctNo);
	 pstmt.setString(2,pNo);
	 pstmt.setInt(3,Qty);	

	 pstmt.executeUpdate();

%>

<br><br>   
<font color="blue" size='6'><b>[��ǰ �ֹ���]</b></font><p>


<!--  (74��~269��):   order.jsp�� 48��~235��� ���� 95%�̻� ������ �ڵ带 ����ϰ� ����  -->
<!--  103�࿡�� cart ���̺��� �ƴ϶�, tempcart ���̺��� ����ϰ� ������ ������ ��!              -->
<table border=1  style="font-size:10pt;font-family:���� ���">
<tr>       
   <td bgcolor="#002C57"  width = 120 height="30" align="center" ><p align="center"><font size="2" color="#ECFAE4"><strong>��ǰ��ȣ</strong></font></td>       
   <td bgcolor="#002C57"  width = 120 height="30" align="center"><p><font  size="2" color="#ECFAE4"><strong>��ǰ��</strong></font></td>       
   <td bgcolor="#002C57"  width = 120 height="30" align="center"><p><font  size="2" color="#ECFAE4"><strong>��ǰ�ܰ�(��)</strong></font></td>       
   <td bgcolor="#002C57"  width = 120 height="30" align="center"><p><font  size="2" color="#ECFAE4"><strong>�ֹ�����(��)</strong></font></td>     
   <td bgcolor="#002C57"  width = 120 height="30" align="center" ><p><font size="2" color="#ECFAE4"><strong>�ֹ���(��)</strong></font></td>  
   <td bgcolor="#002C57"  width = 114 height="30" align="center" ><p><font size="2" color="red"><b>�� ��</b></font></td>
 </tr> 		


<%
//  [103��~151�� ����] :
//  tempcart ���̺�(cart ���̺� �ƴ�!)�� ��� ��ǰ������ ���������� �����ְ��� �� ��, ������ �׸����
//  ��ǰ��ȣ(prdNo),  ��ǰ��(prdName),  ��ǰ�ܰ�(prdPrice),  �ֹ�����(ctQty), 
//  �ֹ���(prdPrice*ctQty ),  ��ü�ֹ��Ѿ�(total)���� �����ǰ� ������ ������ ��! 
//   => "��ñ����ϱ�" ���� �� �������� �ش� ���������� ��°���� ���� �� ������ҵ��� Ȯ�� ���!

//  tempcart ���̺�:  ��ǰ��ȣ(prdNo)�� �ֹ�����(ctQty) ���� ������ �� �� ����.
//  goods ���̺�:  ��ǰ��(prdName)�� ��ǰ�ܰ�(prdPrice) ���� ������ �� �� ����.
//  ����, tempcart���̺�� goods���̺�κ���, ������ ��ǰ��ȣ(prdNo)�� �ش��ϴ� �� �׸���� ���� 
//  ������ �� �� �ִ�. (mysql�󿡼� tempcart���̺�� goods���̺� ��� �ʵ���� �����ϴ��� Ȯ�� ���!)
//  =>  <�˰��� ����>:  tempcart���̺�κ��� ��ǰ��ȣ(prdNo)�� �ֹ�����(ctQty) ���� ������ ����, 
//         ���⼭ ������ ��ǰ��ȣ(prdNo)�� �ٰ��Ͽ� goods���̺�κ���
//         ��ǰ��(prdName)�� ��ǰ�ܰ�(prdPrice) �� ������ ����.
//         �̸� ����, �ֹ���(prdPrice*ctQty )��  ��ü�ֹ��Ѿ�(total)�� ����� ����.
//         �׷� ����, ������ �� �� �ʵ�� �� ���� ��������� ���������� ����� �ش�. 


		String jsql2 = "select prdNo, ctQty from tempcart where ctNo = ?";   //  tempcart ���̺��� ����Կ� ����!
		PreparedStatement pstmt2 = con.prepareStatement(jsql2);
		pstmt2.setString(1, ctNo);		

		ResultSet rs2 = pstmt2.executeQuery(); 
		
		int total=0;   //  130�� ����
         
	//	while(rs2.next()) 
  	//	{			                   

		rs2.next();    //  ��ñ����ϱ��� ���, ��ñ����� ��ǰ���ڵ常 �������ָ� ��(while���� ���ʿ���!)

		String prdNo = rs2.getString("prdNo");	    //  tempcart ���̺�κ��� ��ǰ��ȣ ����
   		int ctQty = rs2.getInt("ctQty");	                    //  tempcart ���̺�κ��� �ֹ����� ���� 

   		String jsql3 = "select prdName, prdPrice from goods where prdNo = ?";
    	PreparedStatement pstmt3 = con.prepareStatement(jsql3);
	    pstmt3.setString(1, prdNo);

	    ResultSet rs3 = pstmt3.executeQuery(); 
		rs3.next();

		String	prdName =  rs3.getString("prdName");	  //  goods ���̺�κ��� ��ǰ�� ����
		int prdPrice =  rs3.getInt("prdPrice");                 //  goods ���̺�κ��� ��ǰ�ܰ� ����
				
   		int amount = prdPrice *ctQty;     //  �ֹ��� ���
		total = total + amount;                  //  ��ü �ֹ��Ѿ� ���
%>


 <tr>       
    <td  bgcolor="#eeeede" height="30" align="center"><font size="2"><%=prdNo%></font></td>     
	<td  bgcolor="#eeeede" height="30"align="center"><font size="2"><%=prdName%></font></td> 
	<td  bgcolor="#eeeede" height="30"align="center" align=right><font size="2"><%=prdPrice%></font></td> 
	<td  bgcolor="#eeeede" height="30"align="center" align=right><font size="2"><%=ctQty%></font></td>
    <td  bgcolor="#eeeede" height="30"align="right"><font size="2"><%=amount%> ��</font></td>  
    <td  bgcolor="#eeeede" height="30"align="center">��� ����</td> 	
  </tr>   
<%
	   //      }  // while���� ��
 %>
 
  <tr>
	<td colspan = 4 align=center><font size="2" color="red"><b>��ü �ֹ��Ѿ�</b></font></td>
	<td  bgcolor="#eeeede" height="30" align=right><font size="2" color="red"><b><%=total%> ��</b></font></td>
	<td align=center><font size=2 color=green>(���ù�ǰ ����)</font></td>
  </tr>
 </table>   


<%
	// (2)�ֹ��� ���� ��� - ȸ�� ���̺� ���� ���
	//String myid = (String)session.getAttribute("sid");  // �α����߾��� �ֹ��� ����(��, ���̵�)�� �޾ƿ�

	String jsql4 = "select memName, memTel from member where memId = ?";
	PreparedStatement pstmt4 = con.prepareStatement(jsql4);
	pstmt4.setString(1,myid);

	ResultSet rs4 = pstmt4.executeQuery();
	rs4.next();
	String  name = rs4.getString("memName");
	String  tel = rs4.getString("memTel");
%>


<form name="form" method="Post" action="directOrderOK.jsp">  
<table border=1   style="font-size:10pt;font-family:���� ���">
	<tr>
		<td rowspan = 2 width="155" align="center" bgcolor="#002C57">
			<font  size="2" color="#ECFAE4">
			<strong>�ֹ��� ����</strong></font>
		</td>
		<td   align="center" width=110 bgcolor="#002C57">
			<font  size="2" color="#ECFAE4">
			<strong>�� ��
		</td>
		<td width=470>
		    <%=name%>
		</td>
	</tr>
	<tr>
		<td   align="center" width=110 bgcolor="#002C57">
			<font  size="2" color="#ECFAE4">
			<strong>�� ȭ</strong></font></td>
		<td width=470><input type="text" name="memTel" size=40 value=<%=tel%>></td>
	</tr>
</table>


<table border=1  style="font-size:10pt;font-family:���� ���">
	<tr>
		<td rowspan = 3 width="155"align="center" bgcolor="#002C57">
			<font  size="2" color="#ECFAE4">
			<strong>������ ����</strong></font></td>
		<td   align="center" width=110 bgcolor="#002C57">
			<font  size="2" color="#ECFAE4">
			<strong>�� ��</strong></font></td>
		<td width=470><input type="text" name="receiver" size=40></td>
	</tr>
	<tr>
		<td   align="center" width=110 bgcolor="#002C57">
			<font  size="2" color="#ECFAE4">
			<strong>�� ��</strong></font></td>
		<td width=470><input type="text" name="rcvAddress" size=40></td>
	</tr>
	<tr>
		<td   align="center" width=110 bgcolor="#002C57">
			<font  size="2" color="#ECFAE4">
			<strong>�� ȭ</strong></font></td>
		<td width=470><input type="text" name="rcvPhone" size=40></td>
	</tr>
</table>


<table border=1  style="font-size:10pt;font-family:���� ���">
	<tr>
		<td rowspan = 2   align="center" width="155" bgcolor="#002C57">
			<font  size="2" color="#ECFAE4">
			<strong>���� ���</strong></font></td>
		<td   align="center" width=110 bgcolor="#002C57">
			<font  size="2" color="#ECFAE4">
			<strong>�ſ�ī�� ��ȣ</td>
		<td width=120><input type="text" name="cardNo"></td>
		<td   align="center" width=112 bgcolor="#002C57">
			<font  size="2" color="#ECFAE4">
			<strong>��й�ȣ</strong></font></td>
		<td width=120><input type="password" name="cardPass"></td>
	</tr>
	<tr>
		<td   align="center" width=110 bgcolor="#002C57">
			<font size="2" color="#ECFAE4">
			<strong>������ �Ա�</strong></font></td>
		<td  colspan=3 width=474>
		<select name="bank">
			<option value="0" selected>���� �� ����</option>
            <option value="�츮����">�츮���� ( 324-01-123400 / (��)�������Ƽ���θ�)</option>
            <option value="��������">�������� ( 011-02-300481 / (��)�������Ƽ���θ�)</option>
            <option value="��ȯ����">��ȯ���� ( 327-56-333002 / (��)�������Ƽ���θ�)</option>
            <option value="��������">�������� ( 987-25-202099 / (��)�������Ƽ���θ�)</option>
            <option value="�ϳ�����">�ϳ����� ( 698-00-222176 / (��)�������Ƽ���θ�)</option>
		</select>
		<font size=1 color=blue>(ī�� or �������Ա� �� ����!)</font>
		</td></td></tr>
</table>


<table border=1   style="font-size:13pt;font-family:���� ���">
	<tr>
		<td colspan = 2   align="center" width="275" bgcolor="#002C57">
			<font  color="red">
			<strong>��ü �ֹ� �Ѿ�(��)</strong></font></td>
   <!-- �� hidden ó���� �ؾ߸� �ϴ��� orderOK.jsp�� �м��ϸ鼭 ������ ������ �� ��!    -->
		<td width=470 align=right><input type="hidden" name="pay" value="<%=total%>" ><font  color="red"><%=total%></font>&nbsp(��)</td>
	</tr>
</table>
<br>

<table>
	<tr>  <!-- onClick �̺�Ʈ�� ���ǰ� �ְ�, input�±��� type �Ӽ����� "button"�ӿ� ������ ��! -->
	         <!--  "js_package.js"�� ���ǵ� �ڹٽ�ũ��Ʈ check_val() �Լ��� Ȯ�� ���! -->
		<td><input type = button value = "�ֹ�Ȯ��"  OnClick="check_val()"></td>
		<td><input type="reset" value="�ֹ����" name="reset" ></td>
	</tr>
</table>                 

</form>    
<%
   }  catch(Exception e)  {
        out.println(e);
 } 

}   // if-else���� ��
%>
</center>         
</body>
</html> 
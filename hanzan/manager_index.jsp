<%@ page contentType="text/html;charset=euc-kr" %>

<html>
<head>
<title>������ �α��� ���</title>
</head>

 <body>
 <center>

<%
     //   ������ �α��� ���¸� �����ϱ� ���Ͽ�, sid�� ����Ǿ��� ������ ID���� 
     //   session ��ü�κ��� �����ͼ� ���� id�� �����Ŵ (manager_loginOK.jsp�� 38��κ� Ȯ�ο��!)
	String id = (String)session.getAttribute("sid");    

	java.util.Date date = new java.util.Date();  //    Date Ÿ���� ��ü date ����
   String curDate = date.toLocaleString();     //   ���� curDate��  ����ð�(��.��.�� ��:��:��)�� ����

 %>
     <br><br><br>
     <font size=6 color=red><b> [ ������ ��Ƽ���θ�:  ������ ��� ] </b></font><p><br><br><br><br>
	  <font size=3>
      <table>
	  <tr>
 			<td>���Ӱ����� ID:</td>
	  	    <td>&nbsp;&nbsp;&nbsp;<%=id%></td>
	  </tr>
      <tr>
 			<td>���� �ð�: </td>
	  	    <td>&nbsp;&nbsp;&nbsp;<%=curDate %></td>
	  </tr>
	  </table><p>	  
	  </font>
	  <br><br><br>

<a href="member.html"><font color="blue" size='5'><b>[ȸ�� ����]</b></font></a><br><br><br><br>
<a href="goods.html"><font color="blue" size='5'><b>[��ǰ ����]</b></font></a><br><br><br><br>
<a href="function.jsp"><font color="blue" size='5'><b>[�ֹ� ����]</b></font>
<br><br><br><br><br>

<a href="logout.jsp" target=_parent  style="font-size:10pt;font-family:���� ���">[������ �α׾ƿ�]</a>
<br><br><br><br><br>

</center>
</body>
</html>
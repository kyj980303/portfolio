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
 <div class="admin"style="width: 100%; height: 890px; background-color:#7994b2; margin:0px; padding:0px;">
     <br><br><br>
     <font size=6 color=white><b><br><br> dxd���θ�:  ������ ���</b></font><p><br><br><br><br>
	  <font size=3>
	  
      <table>
	  <tr>
 			<td><p style="color:white; width: 140px; font-size: 20px;">���Ӱ����� ID:</td>
	  	    <td><p style="color:white; width: 140px; font-size: 20px;"><%=id%></td>
	  </tr>
      <tr>
 			<td><p style="color:white; font-size: 20px;">���� �ð�: </td>
	  	    <td><p style="color:white; font-size: 20px;"><%=curDate %></td>
	  </tr>
	  </table><p>	  
	  </font>
	  <br><br><br><br><br><br>

<a href="member.html"style="margin-right:20px; text-decoration:none"><font color="white" size='5'><b>ȸ�� ����</b></font></a>
<a href="goods.html" style="margin-right:20px; text-decoration:none"><font color="white" size='5'><b>��ǰ ����</b></font></a>
<a href="#" style="text-decoration:none"><font color="white" size='5'><b>�ֹ� ����</b></font>
<br><br><br><br><br>

<a href="logout.jsp" target=_parent  style="font-size:16pt;font-family:���� ���; color:black; text-decoration:none"><p style="width:350px; height:30px; background-color: #fff; padding:15px;">������ �α׾ƿ�</p></a>
<br><br><br><br><br>
</div>

</center>
</body>
</html>
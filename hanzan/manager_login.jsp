<%@ page contentType="text/html;charset=euc-kr" %>
<html>
<head>
	<title>�α���</title>
</head>

<script language="javascript" src="js_package.js">
</script>


<body onLoad="login_focus()">   <!-- �α��� �������� �ε��Ǹ� ID �Էºκп� Ŀ�� Ȱ��ȭ��Ŵ -->
<center>
<br><br><br><br><br><br><br><br>
<form name="login" method="post" action="manager_loginOK.jsp" target=_parent>  
     <table border=0 cellpadding=5 style="font-size:10pt;font-family:���� ���">
	     <tr>
		    <td colspan=3 align=center> 
				<font size=6><b><������ �α���></b></font>
				<br><br><br>
			</td>
	     </tr>
         <tr>
            <td><font size=2>������ ID :  </font></td>
			<td><input type="text" name="id"  style="width:120;height=20"></td>
			<td rowspan=2>
				<a href="javascript:login_check()" style="font-size:10pt;font-family:���� ���">
				<img src="./images/login.gif" border=0></a>
			</td>
         </tr>
         <tr>
            <td><font size=2>�н����� : </font></td>
            <td><input type="password" name="pass"  style="width:120;height=20"  onkeydown="onEnterSubmit()"></td>    <!-- js_package.js�� onEnterSubmit()�Լ��κ� ������� -->
	     </tr>
      </table><p>       
		 
  </form>

 </center>                
</body>  
</html> 
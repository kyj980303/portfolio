<%@ page contentType="text/html;charset=euc-kr" %>
<html>
<head>
	<title>로그인</title>
</head>

<script language="javascript" src="js_package.js">
</script>


<body onLoad="login_focus()">   <!-- 로그인 페이지가 로딩되면 ID 입력부분에 커서 활성화시킴 -->
<center>
<br><br><br><br><br><br><br><br>
<form name="login" method="post" action="manager_loginOK.jsp" target=_parent>  
     <table border=0 cellpadding=5 style="font-size:10pt;font-family:맑은 고딕">
	     <tr>
		    <td colspan=3 align=center> 
				<font size=6><b><관리자 로그인></b></font>
				<br><br><br>
			</td>
	     </tr>
         <tr>
            <td><font size=2>관리자 ID :  </font></td>
			<td><input type="text" name="id"  style="width:120;height=20"></td>
			<td rowspan=2>
				<a href="javascript:login_check()" style="font-size:10pt;font-family:맑은 고딕">
				<img src="./images/login.gif" border=0></a>
			</td>
         </tr>
         <tr>
            <td><font size=2>패스워드 : </font></td>
            <td><input type="password" name="pass"  style="width:120;height=20"  onkeydown="onEnterSubmit()"></td>    <!-- js_package.js의 onEnterSubmit()함수부분 참조요망 -->
	     </tr>
      </table><p>       
		 
  </form>

 </center>                
</body>  
</html> 
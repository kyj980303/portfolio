<%@ page contentType="text/html;charset=euc-kr" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="wodtj=device.width, inital-scale=1.0">
    <title>DXD login</title>
    <link rel="stylesheet" href="../dxd/css/dxd.css">
    <script src="js/jquery-3.5.1.min.js"></script>
    <script src="js/dxd.js"></script>
	<script language="javascript" src="js_package.js"></script>
</head>
<body onLoad="login_focus()">  <!-- 로그인 페이지가 로딩되면 ID 입력부분에 커서 활성화시킴 -->
	<center>
	<div class="log">
		<form name="login" method="post" action="loginOK.jsp" target=_parent>  
			<table border= "0" cellpadding= "5">
				<tr>
					<td><h1>login</h1></td>
				</tr>
				<tr>
					<td><input type="text" name="id" class="logid" placeholder="아이디"></td>
					<td rowspan=2><a href="javascript:login_check()">
				</tr>
				<tr>
					<td><input type="password" name="pass" class="logpw" placeholder="패스워드" onkeydown="onEnterSubmit()"></td> 
				</tr>
				<tr>
					<td><input type="submit" class="loginbtn" value="로그인"></td>
				</tr>
				<tr>
					<td>
						<a href="insertMember.jsp"><p class="f">회원가입</p></a>
						<a href="findId.jsp"><p>아이디 찾기</p></a>
						<a href="findPw.jsp"><p>비밀번호 찾기</p></a>
					</td>
				</tr>
			</table>	
		</form>    
	</div>    
</center>
</body>  
</html> 
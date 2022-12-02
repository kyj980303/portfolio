<%@ page contentType="text/html;charset=euc-kr" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="wodtj=device.width, inital-scale=1.0">
	<title>패스워드 찾기</title>
    <link rel="stylesheet" href="../dxd/css/dxd.css">
    <script src="js/jquery-3.5.1.min.js"></script>
    <script src="js/dxd.js"></script>
	<script language="javascript" src="js_package.js"></script>
</head>
<body>
    <div class="findpw">
        <form method = "post" action="findPwResult.jsp">
            <center>
            <table border=0 cellpadding=5>
                <h1>FIND PASSWORD</h1>
                <tr>
                    <td><input type="text" name="name" class="findname" placeholder="이름"></td>
                    <td rowspan=2><a href="javascript:login_check()">
                </tr>
                <tr>
                    <td><input type="text" name="id"  class="findid" placeholder="아이디" onkeydown="onEnterSubmit()"></td> 
                </tr>
            </table> 
                <a href="findPwResult.jsp"><input type="submit" value="확인"></a>
                <a href="login.jsp"><input type="button" value="취소"></a>
            </center>
        </form>
    </div>
</body>
</html>


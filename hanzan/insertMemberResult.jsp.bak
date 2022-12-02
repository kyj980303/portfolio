<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="wodtj=device.width, inital-scale=1.0">
    <title>hanzan sign up</title>
    <link rel="stylesheet" href="../hanzan/css/hanzan.css">
    <script src="js/jquery-3.5.1.min.js"></script>
    <script src="js/hanzan.js"></script>
	<script language="javascript" src="js_package.js"></script>
</head> 
<body>

<%
	request.setCharacterEncoding("euc-kr");

	String id = request.getParameter("id");   
	String password = request.getParameter("password");
	String	name = request.getParameter("name");

	String	birthYear = request.getParameter("birthYear");
	String	birthMonth = request.getParameter("birthMonth");
	String	birthDay = request.getParameter("birthDay");
	String	birth = birthYear + "-" +birthMonth + "-" + birthDay;

	String	solar = request.getParameter("solar");
	String	address1 = request.getParameter("address1");	
	String	address2 = request.getParameter("address2");

	String	hp1 = request.getParameter("hp1");
	String	hp2 = request.getParameter("hp2");
	String	hp3 = request.getParameter("hp3");
	String	hp = hp1 + "-"+ hp2 + "-" + hp3;

try {
 	 String DB_URL="jdbc:mysql://localhost:3306/hanzan";  
     String DB_ID="multi";  
     String DB_PASSWORD="abcd"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver"); 
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	 String jsql = "INSERT INTO member (memId, memPasswd, memName, ";
	 jsql = jsql + "memBirth, memSolar, memAddress1, memAddress2, ";
	 jsql = jsql + "memPhone) VALUES (?,?,?,?,?,?,?,?)";	

	 PreparedStatement pstmt  = con.prepareStatement(jsql);
	 pstmt.setString(1,id);
	 pstmt.setString(2,password);
	 pstmt.setString(3,name);
	 pstmt.setString(4,birth);
	 pstmt.setString(5,solar);
	 pstmt.setString(6,address1);	 
	 pstmt.setString(7,address2);
	 pstmt.setString(8,hp);

	 pstmt.executeUpdate();
  } catch(Exception e) { 
		out.println(e);
}
%>

<center>
<div class="signcheck">
            <h3>한잔 회원가입등록이 완료되었습니다.</h3>
            <table class="signt">
            <tr>
                <td width=100>ID</td>
                <td width=200><%=id%></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><%=password%></td>
            </tr>
            <tr>
                <td>성명</td>
                <td><%=name%></td>
            </tr>
            <tr>
                <td>생년월일</td>
                <td>
                    <%=birth%>
                    (<%=solar%>)
                </td>
            </tr>
            <tr>
                <td>주소</td>
                <td><%=address1%><%=address2%></td>
            </tr>
            <tr>
                <td>휴대폰번호</td>
                <td><%=hp%></td>
            </tr>
            </table>
            <p><a href="login.jsp">로그인</a></p>       
        </div>
</center>
</body>
</html>
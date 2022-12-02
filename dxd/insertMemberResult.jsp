<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="wodtj=device.width, inital-scale=1.0">
    <title>DXD sign up</title>
    <link rel="stylesheet" href="../dxd/css/dxd.css">
    <script src="js/jquery-3.5.1.min.js"></script>
    <script src="js/dxd.js"></script>
	<script language="javascript" src="js_package.js"></script>
</head> 
<body>

<%
	request.setCharacterEncoding("euc-kr");

	String id = request.getParameter("id");   
	String password = request.getParameter("password");
	String	name = request.getParameter("name");

	String	joomin1 = request.getParameter("joomin1");
	String	joomin2 = request.getParameter("joomin2");
	String joomin = joomin1 + "-" + joomin2;

	String	birthYear = request.getParameter("birthYear");
	String	birthMonth = request.getParameter("birthMonth");
	String	birthDay = request.getParameter("birthDay");
	String	birth = birthYear + "-" +birthMonth + "-" + birthDay;

	String	solar = request.getParameter("solar");
	String	telephone = request.getParameter("telephone");
	String	address = request.getParameter("address");

	String	hp1 = request.getParameter("hp1");
	String	hp2 = request.getParameter("hp2");
	String	hp3 = request.getParameter("hp3");
	String	hp = hp1 + "-"+ hp2 + "-" + hp3;

	String	sex = request.getParameter("sex");
			
	String[ ] hobby=request.getParameterValues("hobby");
	String hobbyList = " ";
	if(hobby != null) 
	{
		for(int i=0;i<hobby.length;i++) 	
		{
			hobbyList +=hobby[i];
			hobbyList +="  ";   // 문자열을 공백으로 초기화
		}
	}
	else
		hobbyList = "취미없음";

	String job=request.getParameter("job");

try {
 	 String DB_URL="jdbc:mysql://localhost:3306/dxd";  
     String DB_ID="multi";  
     String DB_PASSWORD="abcd"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver"); 
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	 String jsql = "INSERT INTO member (memId, memPasswd, memName, ";
	 jsql = jsql + "memJoomin, memBirth, memSolar, memTel, memAddress, ";
	 jsql = jsql + "memPhone, memSex, memHobby, memJob) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";	

	 PreparedStatement pstmt  = con.prepareStatement(jsql);
	 pstmt.setString(1,id);
	 pstmt.setString(2,password);
	 pstmt.setString(3,name);
	 pstmt.setString(4,joomin);
	 pstmt.setString(5,birth);
	 pstmt.setString(6,solar);
	 pstmt.setString(7,telephone);
	 pstmt.setString(8,address);
	 pstmt.setString(9,hp);
	 pstmt.setString(10,sex);
	 pstmt.setString(11,hobbyList);
	 pstmt.setString(12,job);

	 pstmt.executeUpdate();
  } catch(Exception e) { 
		out.println(e);
}
%>

<center>
<div class="signcheck">
            <h3> 축하합니다.  다음과 같이 회원 가입되었습니다! </h3>
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
                <td>주민등록번호</td>
                <td><%=joomin%></td>
            </tr>
            <tr>
                <td>생년월일</td>
                <td>
                    <%=birth%>
                    (<%=solar%>)
                </td>
            </tr>
            <tr>
                <td>전화번호</td>
                <td><%=telephone%></td>
            </tr>
            <tr>
                <td>주소</td>
                <td><%=address%></td>
            </tr>
            <tr>
                <td>휴대폰번호</td>
                <td><%=hp%></td>
            </tr>
            <tr>
                <td>성별</td>
                <td><%=sex%></td>
            </tr>
            <tr>
                <td>취미</td>
                <td><%=hobbyList%></td>
            </tr>
            <tr>
                <td>직업
                <td><%=job%></td>
            </tr>
            </table>
            <p><a href="login.jsp">로그인</a></p>       
        </div>
</center>
</body>
</html>
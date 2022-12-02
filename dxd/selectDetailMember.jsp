<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html><head><title>회원 상세 정보 조회   </title></head>
<body>

<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/dxd";  
     String DB_ID="multi";  
     String DB_PASSWORD="abcd"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver"); 
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

  	 String key = request.getParameter("id");  //  상세정보를 나타낼 회원 아이디를 전달받아 옮
	 String jsql = "select * from member where memId = ?";   
     PreparedStatement  pstmt  = con.prepareStatement(jsql);
	 pstmt.setString(1, key);

	 ResultSet rs = pstmt.executeQuery();  //SQL문 실행	
	 rs.next();

	 String id = rs.getString("memId");  //  다음 각 함수들의 인수들은 테이블의 각 필드명들임
	 String passwd =  rs.getString("memPasswd");	
	 String  name = rs.getString("memName");
 	 String  joomin = rs.getString("memJoomin");
	 Date birth = rs.getDate("memBirth");
	 String solar =  rs.getString("memSolar");
	 String tel =  rs.getString("memTel");
	 String address =  rs.getString("memAddress");
	 String phone =  rs.getString("memPhone");
	 String sex =  rs.getString("memSex");
	 String hobby =  rs.getString("memHobby");
 	 String job =  rs.getString("memjob");
%>

<center>
<font color="blue" size='6'><b>[회원 상세정보 조회]    </b></font><p>
<table border="2" cellpadding="10"  style="font-size:10pt;font-family:맑은 고딕">
		<tr><td width=100>ID</td><td width=200><%=id%></td></tr>
		<tr><td>비밀번호</td><td><%=passwd%></td></tr>
		<tr><td>성명</td><td><%=name%></td></tr>
		<tr><td>주민번호</td><td><%=joomin%></td></tr>
		<tr><td>생년월일</td><td><%=birth%> (<%=solar%>)</td></tr>
		<tr><td>전화번호</td><td><%=tel%></td></tr>
		<tr><td>주소</td><td><%=address%></td></tr>
		<tr><td>휴대폰번호</td><td><%=phone%></td></tr>
		<tr><td>성별</td><td><%=sex%></td></tr>
		<tr><td>취미</td><td><%=hobby%></td></tr>
		<tr><td>직업</td><td><%=job%></td></tr>
    </table><p>

<a href="updateMember.jsp?id=<%=id%>" style="font-size:10pt;font-family:맑은 고딕">수정</a>&nbsp;&nbsp;
<a href="deleteMember.jsp?id=<%=id%>" style="font-size:10pt;font-family:맑은 고딕">삭제</a>
</center>

<%
    } catch (Exception e) {
    	out.println(e);
}
%>
</body>
</html>
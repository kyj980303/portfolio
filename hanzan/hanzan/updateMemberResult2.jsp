<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
	<head><title>회원 정보 수정 완료</title></head>
	<body>

<%
	 request.setCharacterEncoding("euc-kr");

	String id = request.getParameter("id");
	String	passwd = request.getParameter("passwd");
	String	name = request.getParameter("name");

	String	joomin1 = request.getParameter("joomin1");
	String	joomin2 = request.getParameter("joomin2");
	String joomin = joomin1 + "-" + joomin2;

	String birthYear = request.getParameter("birthYear");
	String birthMonth = request.getParameter("birthMonth");
	String birthDay = request.getParameter("birthDay");
	String birth = birthYear + "-" + birthMonth + "-" + birthDay;

	String	solar = request.getParameter("solar");
	String	tel = request.getParameter("telephone");
	String address = request.getParameter("address");

	String	hp1 = request.getParameter("hp1");
	String	hp2 = request.getParameter("hp2");
	String	hp3 = request.getParameter("hp3");
	String phone = hp1+"-"+hp2+"-"+hp3;	
	
	String	sex = request.getParameter("sex");

	String[ ] hobby = request.getParameterValues("hobby");
	String hobbyList = " ";

	if(hobby != null)
	{
		for(int i=0; i<hobby.length; i++)
		{
			hobbyList += hobby[i];
			hobbyList += "  ";
		}
	}
	else
		hobbyList = "취미없음";

	String job = request.getParameter("job");

try {
 	 String DB_URL="jdbc:mysql://localhost:3306/project";
     String DB_ID="multi";  
     String DB_PASSWORD="abcd";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	 String jsql = "update member set memPasswd=?, memName=?, ";
	 jsql = jsql + "memJoomin=?, memBirth=?, memSolar=?, ";
	 jsql = jsql + "memTel=?, memAddress=?, memPhone=?, ";
	 jsql = jsql + "memSex=?, memHobby=?, memJob=? where memId=? ";	
	 PreparedStatement pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1,passwd);
	 pstmt.setString(2,name);
	 pstmt.setString(3,joomin);
	 pstmt.setString(4,birth);
	 pstmt.setString(5,solar);
	 pstmt.setString(6,tel);
	 pstmt.setString(7,address);
	 pstmt.setString(8,phone);
	 pstmt.setString(9,sex);
	 pstmt.setString(10,hobbyList);
	 pstmt.setString(11,job);
	 pstmt.setString(12,id);

	 pstmt.executeUpdate();  //  위에서 작성한 SQL문(update문)을 실행시킴
	                                            //   이 행을 완료한 직후, 실제로 DB상에 레코드정보가 수정됨


     //  이 이후 부분 내용은 DB상에 수정시킨 해당 레코드정보를 조회한 후, 
	 //  해당 내용을 웹브라우저로 출력해주는 코드에 해당됨
	 String jsql2 = "select * from member where memId=?";
	 PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	 pstmt2.setString(1,id);

	 ResultSet rs = pstmt2.executeQuery();
	 rs.next();  //  next()함수를 처음 수행하면, 첫번째 레코드(즉, 수정시킨 레코드)를 가리키게 됨
%>
<center>
<br><br><br>
<font color="blue" size='6'><b>[수정된 회원 정보 내역]</b></font><p>
	<table border=1 cellpadding=5   style="font-size:10pt;font-family:맑은 고딕">
		<tr>
			<td width=100>ID</td>
			<td width=300><%=rs.getString("memId")%></td>
		</tr>
		<tr>
                <td>비밀번호</td>
                <td><%=rs.getString("memPasswd")%></td>
            </tr>
            <tr>
                <td>성명</td>
                <td><%=rs.getString("memName")%></td>
            </tr>
            <tr>
                <td>생년월일</td>
                <td>
                    <%=rs.getDate("memBirth")%> (<%=rs.getString("memSolar")%>)
                </td>
            </tr>
            <tr>
                <td>주소</td>
                <td><%=rs.getString("memAddress1")%><%=rs.getString("memAddress2")%></td>
            </tr>
            <tr>
                <td>휴대폰번호</td>
                <td><%=rs.getString("memPhone")%></td>
            </tr>
		
	</table>
<%
    } catch (Exception e) {
    	out.println(e);
}
%>
<p>
 <br>
</center>
</body>
</html>
<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="wodtj=device.width, inital-scale=1.0">
    <title>DXD ȸ�� ���� ����</title>
    <link rel="stylesheet" href="../dxd/css/dxd.css">
    <script src="js/jquery-3.5.1.min.js"></script>
    <script src="js/dxd.js"></script>
	<script language="javascript" src="js_package.js"></script>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");

	String joomin1 = request.getParameter("joomin1");
	String joomin2 = request.getParameter("joomin2");
	String joomin = joomin1 + "-" + joomin2;

	String birthYear = request.getParameter("birthYear");
	String birthMonth = request.getParameter("birthMonth");
	String birthDay = request.getParameter("birthDay");
	String birth = birthYear + "-" + birthMonth + "-" + birthDay;

	String solar = request.getParameter("solar");
	String tel = request.getParameter("telephone");
	String address = request.getParameter("address");

	String hp1 = request.getParameter("hp1");
	String hp2 = request.getParameter("hp2");
	String hp3 = request.getParameter("hp3");
	String phone = hp1+"-"+hp2+"-"+hp3;	
	
	String sex = request.getParameter("sex");

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
		hobbyList = "��̾���";

	 String job = request.getParameter("job");

try {
 	 String DB_URL="jdbc:mysql://localhost:3306/dxd";
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

	 pstmt.executeUpdate();  //  ������ �ۼ��� SQL��(update��)�� �����Ŵ
	                                            //   �� ���� �Ϸ��� ����, ������ DB�� ���ڵ������� ������


     //  �� ���� �κ� ������ DB�� ������Ų �ش� ���ڵ������� ��ȸ�� ��, 
	 //  �ش� ������ ���������� ������ִ� �ڵ忡 �ش��
	 String jsql2 = "select * from member where memId=?";
	 PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	 pstmt2.setString(1,id);

	 ResultSet rs = pstmt2.executeQuery();
	 rs.next();  //  next()�Լ��� ó�� �����ϸ�, ù��° ���ڵ�(��, ������Ų ���ڵ�)�� ����Ű�� ��
%>
<center>
        <div class="updatemember">
        <p>������ ȸ�� ���� ����</p>
            <table class="signt">
		<tr>
			<td width=100>ID</td>
			<td width=300><%=rs.getString("memId")%></td>
		</tr>
		<tr>
			<td>��й�ȣ</td>
			<td><%=rs.getString("memPasswd")%></td>
		</tr>
		<tr>
			<td>����</td>
			<td><%=rs.getString("memName")%></td>
		</tr>
		<tr>
			<td>�ֹι�ȣ</td>
			<td><%=rs.getString("memJoomin")%></td>
		</tr>
		<tr>
			<td>����</td>
			<td><%=rs.getDate("memBirth")%> (<%=rs.getString("memSolar")%>)</td>
		</tr>
		<tr>
			<td>��ȭ��ȣ</td>
			<td><%=rs.getString("memTel")%></td>
		</tr>
		<tr>
			<td>�ּ�</td>
			<td><%=rs.getString("memAddress")%></td>
		</tr>
		<tr>
			<td>�޴���</td>
			<td><%=rs.getString("memPhone")%></td>
		</tr>
		<tr>
			<td>����</td>
			<td><%=rs.getString("memSex")%></td>
		</tr>
		<tr>
			<td>���</td>
			<td><%=rs.getString("memHobby")%></td>
		</tr>
		<tr>
			<td>����</td>
			<td><%=rs.getString("memJob")%></td>
		</tr>
	</table>
	<p><a href="login.jsp"><input type="submit" value="�α����ϱ�" class="loginp"></a></p>
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
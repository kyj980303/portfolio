<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head><title>ȸ�� ���� ���� </title></head>
<body>

<%	 
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/hanzan";  
     String DB_ID="multi";  
     String DB_PASSWORD="abcd";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver"); 
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
	
	 String key = request.getParameter("id");   
	 String jsql = "select * from member where memId = ?";
	 PreparedStatement pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1,key);

	 ResultSet rs = pstmt.executeQuery();
	 rs.next();
			
	 String id = rs.getString("memId");
   	 String passwd = rs.getString("memPasswd");
	 String name = rs.getString("memName");
	 Date birth = rs.getDate("memBirth");
	 String solar = rs.getString("memSolar");
	 String address1 = rs.getString("memAddress1");
	 String address2 = rs.getString("memAddress2");
	 String phone = rs.getString("memPhone");
%>

<center>
<font color="blue" size='6'><b>[ȸ�� ���� ����] </b></font><p>
	<form method=post action="updateMemberResult.jsp">
	<table border=1 cellpadding=5   style="font-size:10pt;font-family:���� ���">
		<tr>
			<td width=100>ID</td>
			<td><input type=hidden name="id" value="<%=id%>"><%=id%></td>
		</tr>
		<tr>
			<td>��й�ȣ</td>
			<td><input type=text name="passwd" value="<%=passwd%>"></td>
		</tr>
		<tr>
			<td>����</td>
			<td><input type=text name="name" value="<%=name%>"></td>
		</tr>
		<tr>
			<td>����</td>
			<td>
<%
	    	String[ ]  birthArr = birth.toString().split("-");  
//  split()�Լ��� String Ÿ�Կ����� ��밡���ϹǷ�, toString()�޼ҵ带 ����Ͽ� birth��
//  Ÿ���� DateŸ�Կ��� StringŸ������ ��(type) ��ȯ ��, split()�Լ��� ������� ��,��,���� �и���.
//  ��, birthArr[0]���� "��",  birthArr[1]���� "��", birthArr[2]���� "��"�� ���� �и��Ǿ� �����
%>		
		    <input type=text name="birthYear" value="<%=birthArr[0]%>" size="4">��
		    <input type=text name="birthMonth" value="<%=birthArr[1]%>" size="2">��
		    <input type=text name="birthDay" value="<%=birthArr[2]%>" size="2">��
<%
	if (solar.equals("���"))
	{
%>
				<input type=radio name=solar value="���" checked>���
				<input type=radio name=solar value="����">����
<%
	}
	else
	{
%>
				<input type=radio name=solar value="���">���
				<input type=radio name=solar value="����" checked>����
<%
	}
%>
			</td>
		</tr>
		 <tr>
                        <td>�ּ� </td> <!--  �˻��ؼ� ������ �ּҸ� �������ϰ� �ϱ� ���� readonly ó����Ŵ -->
                        <td>
                            <input type="text" value="�����ȣ�� �˻����ּ���." name="zipcode" style="width: 210px" size="7" readonly> 
                            <input type="button" value="�����ȣ�˻�" style="width:120px;height:35px;padding-right:15px;" onClick="zipCheck()"><br> 
                            <input type="text" name="address1" value="<%=address1%>" style="width: 340px" size="100" style="width:300px;height:35px;" readonly><br>
                            <input type="text" name="address2" value="<%=address2%>" style="width: 340px" size="100" style="width:300px;height:35px;">&nbsp<font size =2>���ּҸ� �Է����ּ���.</font>
                        </td>
                    </tr>
		<tr>
			<td>�޴�����ȣ</td>
			<td>
<%
	    	String[ ] hpArr  = phone.split("-");  
       //  String hpArr[ ]  = phone.split("-"); �� ����
       // ������(-)�� �߽����� �޴�����ȣ ���ڸ�, �߰��ڸ�, ���ڸ��� ���� �и� ��
       // hpArr[0], hpArr[1], hpArr[2]�� ���� �����Ŵ

			String[ ]  hpSelected = new String[6];  
    	// "selected" ���ڿ��� �����ϱ� ���� �뵵�� �迭 ����

			if(hpArr[0].equals("010"))
			{
				hpSelected[0] = "selected";
			}  
			else if(hpArr[0].equals("011"))
			{
				hpSelected[1] = "selected";
			}
			else if(hpArr[0].equals("016"))
			{
				hpSelected[2] = "selected";
			}
			else if(hpArr[0].equals("017"))
			{
				hpSelected[3] = "selected";
			}
			else if(hpArr[0].equals("018"))
			{
				hpSelected[4] = "selected";
			}
			else if(hpArr[0].equals("019"))
			{
				hpSelected[5] = "selected";
			}

%>
			<select name="hp1">      
				<option value="010" <%=hpSelected[0]%>>010
				<option value="011" <%=hpSelected[1]%>>011
				<option value="016" <%=hpSelected[2]%>>016
				<option value="017" <%=hpSelected[3]%>>017
				<option value="018" <%=hpSelected[4]%>>018
				<option value="019" <%=hpSelected[5]%>>019
			</select>		
		    <input type=text name="hp2" value="<%=hpArr[1]%>" size="4">-
		    <input type=text name="hp3" value="<%=hpArr[2]%>" size="4">
			</td>	
		</tr>
	</table>
	<p><input type=submit value=�����Ϸ�>
	</form>
<%
    } catch (Exception e) {
      out.println(e);	
}
%>
</center>
</body>
</html>
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
<%	 
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/dxd";  
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
	 String joomin = rs.getString("memJoomin");
	 Date birth = rs.getDate("memBirth");
	 String solar = rs.getString("memSolar");
	 String tel = rs.getString("memTel");
	 String address = rs.getString("memAddress");
	 String phone = rs.getString("memPhone");
	 String sex = rs.getString("memSex");
	 String hobby = rs.getString("memHobby");
	 String job = rs.getString("memJob");
%>

<center>
<div class="updatemember">
    <p>ȸ�� ���� ����</p>
	<form method="post" action="updateMemberResult.jsp">
	<table class="signt">
		<tr>
			<td width="100">ID</td>
			<td><input type="hidden" name="id" value="<%=id%>"><%=id%></td>
		</tr>
		<tr>
			<td>��й�ȣ</td>
			<td><input type="text" name="passwd" value="<%=passwd%>"></td>
		</tr>
		<tr>
			<td>����</td>
			<td><input type="text" name="name" value="<%=name%>"></td>
		</tr>
		<tr>
			<td>�ֹι�ȣ</td>
			<td>
<%
	    	String[ ]  joominArr = joomin.split("-");   
  // String  joominArr[ ] = joomin.split("-");�� ����
  // split()�Լ� ���� �μ��� �������� ���ڿ����� ���� �����Ͽ� �迭�� ��ҵ鿡 
  // ������� �����Ŵ.  ��, ������(-)�� �߽����� �ֹι�ȣ �� 6�ڸ��� �� 7�ڸ��� 
  // ������ ���ڿ���� �и� ��, joominArr[0]�� joominArr[1]�� ���� �����Ŵ
%>		
		    <input type="text" name="joomin1" value="<%=joominArr[0]%>" size="6"> -
			<input type="text" name="joomin2" value="<%=joominArr[1]%>" size="7">
			</td>
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
		    <input type="text" name="birthYear" value="<%=birthArr[0]%>" size="4">��
		    <input type="text" name="birthMonth" value="<%=birthArr[1]%>" size="2">��
		    <input type="text" name="birthDay" value="<%=birthArr[2]%>" size="2">��
<%
	if (solar.equals("���"))
	{
%>
				<input type="radio" name="solar" value="���" style="width:15px;height:15px;border:1px;margin-right:10px;" checked>���
				<input type="radio" name="solar" value="����" style="width:15px;height:15px;border:1px;margin-right:10px;">����
<%
	}
	else
	{
%>
				<input type="radio" name="solar" value="���" style="width:15px;height:15px;border:1px;margin-right:10px;">���
				<input type="radio" name="solar" value="����" style="width:15px;height:15px;border:1px;margin-right:10px;" checked>����
<%
	}
%>
			</td>
		</tr>
		<tr>
			<td>��ȭ��ȣ</td>
			<td><input type="text" name="telephone" value="<%=tel%>"></td>
		</tr>
		<tr>
			<td>�ּ�</td>
			<td><input type="text" name="address" value="<%=address%>" size=40></td>
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
		    - <input type="text" name="hp2" value="<%=hpArr[1]%>" size="4"> -
		    <input type="text" name="hp3" value="<%=hpArr[2]%>" size="4">
			</td>	
		</tr>
		<tr>
			<td>����</td>
			<td>
<%
		if(sex.equals("��"))
		{
%>
				<input type="radio" name="sex" value="��" style="width:15px;height:15px;border:1px;margin-right:10px;" checked>��
				<input type="radio" name="sex" value="��" style="width:15px;height:15px;border:1px;margin-right:10px;">��
<%
		}	
		else
		{
%>
				<input type="radio" name="sex" value="��" style="width:15px;height:15px;border:1px;margin-right:10px;">��
				<input type="radio" name="sex" value="��" style="width:15px;height:15px;border:1px;margin-right:10px;" checked>��
<%
	}
%>				
			</td>
		</tr>
		<tr>
			<td>���</td>
			<td>
<%
	    	String[ ]  hobbyArr = hobby.split(" ");   
     // String hobbyArr[ ] = hobby.split(" "); �� ����
     // ���鹮��('' '')�� �߽����� �� ����������� ������ ���ڿ���� �и� ��, 
     // hobbyArr�迭�� ������� ���� �����Ŵ

			String[ ]  checked = new String[4];   
			 // "checked" ���ڿ��� �����ϱ� ���� �뵵�� �迭 ����

			for(int i=0; i<hobbyArr.length;i++) {
				if(hobbyArr[i].equals("����"))
				{
					checked[0] = "checked";
				}
				else if(hobbyArr[i].equals("����"))
				{
					checked[1] = "checked";
				}
				else if(hobbyArr[i].equals("��ȭ"))
				{
					checked[2] = "checked";
				}
				else if(hobbyArr[i].equals("����"))
				{
					checked[3] = "checked";
				}
			}
%>
			<input type="checkbox" name="hobby" value="����" style="width:15px;height:15px;border:1px;" <%=checked[0]%>> ����
			<input type="checkbox" name="hobby" value="����" style="width:15px;height:15px;border:1px;" <%=checked[1]%>> ����
			<input type="checkbox" name="hobby" value="��ȭ" style="width:15px;height:15px;border:1px;" <%=checked[2]%>> ��ȭ
			<input type="checkbox" name="hobby" value="����" style="width:15px;height:15px;border:1px;" <%=checked[3]%>> ����
			</td>
		</tr>
		<tr>
			<td>����</td>
			<td>
<%
			String[ ]  selected = new String[6];  
            // "selected" ���ڿ��� �����ϱ� ���� �뵵�� �迭 ����

			if(job.equals("�������̳�"))
			{
				selected[0] = "selected";
			}
			else if(job.equals("���α׷���"))
			{
				selected[1] = "selected";
			}
			else if(job.equals("ȸ���"))
			{
				selected[2] = "selected";
			}
			else if(job.equals("�л�"))
			{
				selected[3] = "selected";
			}
			else if(job.equals("��ȭ����"))
			{
				selected[4] = "selected";
			}
			else if(job.equals("��������"))
			{
				selected[5] = "selected";
			}
%>			
			<select name="job">
				<option value="�������̳�" <%=selected[0]%>>�������̳�
				<option value="���α׷���" <%=selected[1]%>>���α׷���
				<option value="ȸ���" <%=selected[2]%>>ȸ���
				<option value="�л�" <%=selected[3]%>>�л�
				<option value="��ȭ����" <%=selected[4]%>>��ȭ����
				<option value="��������" <%=selected[5]%>>��������
			</select>	
			</td>
		</tr>
	</table>
	<p><input type="submit" value="�����Ϸ�"style="padding-top:5px;"></p>
	</form>
<%
    } catch (Exception e) {
      out.println(e);	
}
%>
 </div>
</center>
</body>
</html>
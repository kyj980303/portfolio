<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>��ǰ ���̺� ���� ��ȸ</title>

 <style type="text/css">
     a:link { text-decoration: none; color: black; }           <!-- Ŭ���ϱ����� ������ ������ ������ -->
     a:visited { text-decoration: none; color: black; }     <!-- �湮�ѵ��� ������ ���پ��� ���� -->
     a:hover { text-decoration: underline; color:blue; } <!-- ���콺�� �ö󰥶� ������ �Ʒ����ְ� �Ķ� -->
 </style>
</head>

<body>
<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/dxd";    //  ����DB���� project�ӿ� ����!
     String DB_ID="multi";  
     String DB_PASSWORD="abcd"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 
	
	request.setCharacterEncoding("euc-kr");
	//  category��(�׷캰) ��ǰ��ȸ�� ���ؼ�,  index.html  or  index.jsp�κ��� 
	//  ��ȸ�ϰ����ϴ� Ư�� ctgType���� �Ѱ� �޾ƿ�
	String prdNo = request.getParameter("prdNo");  

	String jsql = "select * from goods where prdNo = ?";   
	PreparedStatement pstmt = con.prepareStatement(jsql);
	pstmt.setString(1, prdNo);

	ResultSet rs = pstmt.executeQuery();
%>
  <center>
    <br><br>

<%
	String category_name;

    if (prdNo.equals("s1"))
		category_name = "�޴���/����Ʈ��";
	else if (ctgType.equals("s2"))
		category_name = "��Ʈ��/����ũž";
	else if (ctgType.equals("s3"))
		category_name = "��ī/�ֹ氡��";
	else 
		category_name = "TV/�����";
%>

	<font color="blue" size='5'><b>[<%=category_name%>]</b></font><p><br>
    <hr>
	<table border=0  style="font-size:10pt;font-family:���� ���">
	<tr>
		<td align=center width=100 height=30><font size=2><b>��ǰ�̹���</b></font></td>
		<td align=center width=120 height=30><font size=2><b>��ǰ��</b></font></td>
		<td align=center width=350 height=30><font size=2><b>��ǰ����</b></font></td>
		<td align=center width=80 height=30><font size=2><b>����ȸ��</b></font></td>
		<td align=center width=80 height=30><font size=2><b>��ǰ����</b></font></td>
	</tr>
	<tr>
	<td colspan=5> <hr></td>
	</tr>
<%
		while(rs.next()) {
			String no = rs.getString("prdNo");
			String name =  rs.getString("prdName");	
			String  description =  rs.getString("prdDescription");
			String  company = rs.getString("prdCompany");
			int price =  rs.getInt("prdPrice");
%>
   <tr>      
	  <td align="center"><a href="viewDetailProduct.jsp?prdNo=<%=no%>">
	  <img src="images\<%=no%>.jpg" width="100" height="100" border=0></a></td>
	  <td align=center><a href="viewDetailProduct.jsp?prdNo=<%=no%>"><%=name%></a></td>
      <td align=left><a href="viewDetailProduct.jsp?prdNo=<%=no%>"><%=description%></a></td>
	  <td align=center><%=company%></td>
	  <td align=center><%=price%> ��</td>
 </tr>
 <%
		}   //  while���� ��
%>
    </table>
	<hr>
<%
    } catch (Exception e) {
        	out.println(e);
}
%>
</center>
</body>
</html>

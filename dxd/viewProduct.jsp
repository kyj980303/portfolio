<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>상품 테이블 내용 조회</title>

 <style type="text/css">
     a:link { text-decoration: none; color: black; }           <!-- 클릭하기전의 설정은 선없고 검정색 -->
     a:visited { text-decoration: none; color: black; }     <!-- 방문한뒤의 설정은 밑줄없고 검정 -->
     a:hover { text-decoration: underline; color:blue; } <!-- 마우스가 올라갈때 설정은 아랫줄있고 파랑 -->
 </style>
</head>

<body>
<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/dxd";    //  접속DB명은 project임에 유의!
     String DB_ID="multi";  
     String DB_PASSWORD="abcd"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 
	
	request.setCharacterEncoding("euc-kr");
	//  category별(그룹별) 상품조회를 위해서,  index.html  or  index.jsp로부터 
	//  조회하고자하는 특정 ctgType값을 넘겨 받아옴
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
		category_name = "휴대폰/스마트폰";
	else if (ctgType.equals("s2"))
		category_name = "노트북/데스크탑";
	else if (ctgType.equals("s3"))
		category_name = "디카/주방가전";
	else 
		category_name = "TV/모니터";
%>

	<font color="blue" size='5'><b>[<%=category_name%>]</b></font><p><br>
    <hr>
	<table border=0  style="font-size:10pt;font-family:맑은 고딕">
	<tr>
		<td align=center width=100 height=30><font size=2><b>상품이미지</b></font></td>
		<td align=center width=120 height=30><font size=2><b>상품명</b></font></td>
		<td align=center width=350 height=30><font size=2><b>상품설명</b></font></td>
		<td align=center width=80 height=30><font size=2><b>제조회사</b></font></td>
		<td align=center width=80 height=30><font size=2><b>상품가격</b></font></td>
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
	  <td align=center><%=price%> 원</td>
 </tr>
 <%
		}   //  while문의 끝
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

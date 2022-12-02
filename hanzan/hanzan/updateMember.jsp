<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head><title>회원 정보 수정 </title></head>
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
<font color="blue" size='6'><b>[회원 정보 수정] </b></font><p>
	<form method=post action="updateMemberResult.jsp">
	<table border=1 cellpadding=5   style="font-size:10pt;font-family:맑은 고딕">
		<tr>
			<td width=100>ID</td>
			<td><input type=hidden name="id" value="<%=id%>"><%=id%></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type=text name="passwd" value="<%=passwd%>"></td>
		</tr>
		<tr>
			<td>성명</td>
			<td><input type=text name="name" value="<%=name%>"></td>
		</tr>
		<tr>
			<td>생일</td>
			<td>
<%
	    	String[ ]  birthArr = birth.toString().split("-");  
//  split()함수는 String 타입에서만 사용가능하므로, toString()메소드를 사용하여 birth의
//  타입을 Date타입에서 String타입으로 형(type) 변환 후, split()함수를 적용시켜 년,월,일을 분리함.
//  즉, birthArr[0]에는 "년",  birthArr[1]에는 "월", birthArr[2]에는 "일"이 각각 분리되어 저장됨
%>		
		    <input type=text name="birthYear" value="<%=birthArr[0]%>" size="4">년
		    <input type=text name="birthMonth" value="<%=birthArr[1]%>" size="2">월
		    <input type=text name="birthDay" value="<%=birthArr[2]%>" size="2">일
<%
	if (solar.equals("양력"))
	{
%>
				<input type=radio name=solar value="양력" checked>양력
				<input type=radio name=solar value="음력">음력
<%
	}
	else
	{
%>
				<input type=radio name=solar value="양력">양력
				<input type=radio name=solar value="음력" checked>음력
<%
	}
%>
			</td>
		</tr>
		 <tr>
                        <td>주소 </td> <!--  검색해서 선택한 주소를 수정못하게 하기 위해 readonly 처리시킴 -->
                        <td>
                            <input type="text" value="우편번호를 검색해주세요." name="zipcode" style="width: 210px" size="7" readonly> 
                            <input type="button" value="우편번호검색" style="width:120px;height:35px;padding-right:15px;" onClick="zipCheck()"><br> 
                            <input type="text" name="address1" value="<%=address1%>" style="width: 340px" size="100" style="width:300px;height:35px;" readonly><br>
                            <input type="text" name="address2" value="<%=address2%>" style="width: 340px" size="100" style="width:300px;height:35px;">&nbsp<font size =2>상세주소를 입력해주세요.</font>
                        </td>
                    </tr>
		<tr>
			<td>휴대폰번호</td>
			<td>
<%
	    	String[ ] hpArr  = phone.split("-");  
       //  String hpArr[ ]  = phone.split("-"); 와 동일
       // 하이픈(-)을 중심으로 휴대폰번호 앞자리, 중간자리, 뒷자리를 각각 분리 후
       // hpArr[0], hpArr[1], hpArr[2]에 각각 저장시킴

			String[ ]  hpSelected = new String[6];  
    	// "selected" 문자열을 저장하기 위한 용도의 배열 생성

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
	<p><input type=submit value=수정완료>
	</form>
<%
    } catch (Exception e) {
      out.println(e);	
}
%>
</center>
</body>
</html>
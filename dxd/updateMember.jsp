<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="wodtj=device.width, inital-scale=1.0">
    <title>DXD 회원 정보 수정</title>
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
    <p>회원 정보 수정</p>
	<form method="post" action="updateMemberResult.jsp">
	<table class="signt">
		<tr>
			<td width="100">ID</td>
			<td><input type="hidden" name="id" value="<%=id%>"><%=id%></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="text" name="passwd" value="<%=passwd%>"></td>
		</tr>
		<tr>
			<td>성명</td>
			<td><input type="text" name="name" value="<%=name%>"></td>
		</tr>
		<tr>
			<td>주민번호</td>
			<td>
<%
	    	String[ ]  joominArr = joomin.split("-");   
  // String  joominArr[ ] = joomin.split("-");와 동일
  // split()함수 안의 인수를 기준으로 문자열들을 각각 분할하여 배열의 요소들에 
  // 순서대로 저장시킴.  즉, 하이픈(-)을 중심으로 주민번호 앞 6자리와 뒤 7자리를 
  // 별도의 문자열들로 분리 후, joominArr[0]와 joominArr[1]에 각각 저장시킴
%>		
		    <input type="text" name="joomin1" value="<%=joominArr[0]%>" size="6"> -
			<input type="text" name="joomin2" value="<%=joominArr[1]%>" size="7">
			</td>
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
		    <input type="text" name="birthYear" value="<%=birthArr[0]%>" size="4">년
		    <input type="text" name="birthMonth" value="<%=birthArr[1]%>" size="2">월
		    <input type="text" name="birthDay" value="<%=birthArr[2]%>" size="2">일
<%
	if (solar.equals("양력"))
	{
%>
				<input type="radio" name="solar" value="양력" style="width:15px;height:15px;border:1px;margin-right:10px;" checked>양력
				<input type="radio" name="solar" value="음력" style="width:15px;height:15px;border:1px;margin-right:10px;">음력
<%
	}
	else
	{
%>
				<input type="radio" name="solar" value="양력" style="width:15px;height:15px;border:1px;margin-right:10px;">양력
				<input type="radio" name="solar" value="음력" style="width:15px;height:15px;border:1px;margin-right:10px;" checked>음력
<%
	}
%>
			</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="text" name="telephone" value="<%=tel%>"></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" name="address" value="<%=address%>" size=40></td>
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
		    - <input type="text" name="hp2" value="<%=hpArr[1]%>" size="4"> -
		    <input type="text" name="hp3" value="<%=hpArr[2]%>" size="4">
			</td>	
		</tr>
		<tr>
			<td>성별</td>
			<td>
<%
		if(sex.equals("남"))
		{
%>
				<input type="radio" name="sex" value="남" style="width:15px;height:15px;border:1px;margin-right:10px;" checked>남
				<input type="radio" name="sex" value="여" style="width:15px;height:15px;border:1px;margin-right:10px;">여
<%
		}	
		else
		{
%>
				<input type="radio" name="sex" value="남" style="width:15px;height:15px;border:1px;margin-right:10px;">남
				<input type="radio" name="sex" value="여" style="width:15px;height:15px;border:1px;margin-right:10px;" checked>여
<%
	}
%>				
			</td>
		</tr>
		<tr>
			<td>취미</td>
			<td>
<%
	    	String[ ]  hobbyArr = hobby.split(" ");   
     // String hobbyArr[ ] = hobby.split(" "); 와 동일
     // 공백문자('' '')를 중심으로 각 취미종류들을 별도의 문자열들로 분리 후, 
     // hobbyArr배열에 순서대로 각각 저장시킴

			String[ ]  checked = new String[4];   
			 // "checked" 문자열을 저장하기 위한 용도의 배열 생성

			for(int i=0; i<hobbyArr.length;i++) {
				if(hobbyArr[i].equals("독서"))
				{
					checked[0] = "checked";
				}
				else if(hobbyArr[i].equals("음악"))
				{
					checked[1] = "checked";
				}
				else if(hobbyArr[i].equals("영화"))
				{
					checked[2] = "checked";
				}
				else if(hobbyArr[i].equals("게임"))
				{
					checked[3] = "checked";
				}
			}
%>
			<input type="checkbox" name="hobby" value="독서" style="width:15px;height:15px;border:1px;" <%=checked[0]%>> 독서
			<input type="checkbox" name="hobby" value="음악" style="width:15px;height:15px;border:1px;" <%=checked[1]%>> 음악
			<input type="checkbox" name="hobby" value="영화" style="width:15px;height:15px;border:1px;" <%=checked[2]%>> 영화
			<input type="checkbox" name="hobby" value="게임" style="width:15px;height:15px;border:1px;" <%=checked[3]%>> 게임
			</td>
		</tr>
		<tr>
			<td>직업</td>
			<td>
<%
			String[ ]  selected = new String[6];  
            // "selected" 문자열을 저장하기 위한 용도의 배열 생성

			if(job.equals("웹디자이너"))
			{
				selected[0] = "selected";
			}
			else if(job.equals("프로그래머"))
			{
				selected[1] = "selected";
			}
			else if(job.equals("회사원"))
			{
				selected[2] = "selected";
			}
			else if(job.equals("학생"))
			{
				selected[3] = "selected";
			}
			else if(job.equals("영화감독"))
			{
				selected[4] = "selected";
			}
			else if(job.equals("웹마스터"))
			{
				selected[5] = "selected";
			}
%>			
			<select name="job">
				<option value="웹디자이너" <%=selected[0]%>>웹디자이너
				<option value="프로그래머" <%=selected[1]%>>프로그래머
				<option value="회사원" <%=selected[2]%>>회사원
				<option value="학생" <%=selected[3]%>>학생
				<option value="영화감독" <%=selected[4]%>>영화감독
				<option value="웹마스터" <%=selected[5]%>>웹마스터
			</select>	
			</td>
		</tr>
	</table>
	<p><input type="submit" value="수정완료"style="padding-top:5px;"></p>
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
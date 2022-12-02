<%@ page contentType="text/html;charset=euc-kr" %>

<html>
<head>
<title>관리자 로그인 결과</title>
</head>

 <body>
 <center>

<%
     //   관리자 로그인 상태를 유지하기 위하여, sid에 저장되었던 접속한 ID값을 
     //   session 객체로부터 가져와서 변수 id에 저장시킴 (manager_loginOK.jsp의 38행부분 확인요망!)
	String id = (String)session.getAttribute("sid");    

	java.util.Date date = new java.util.Date();  //    Date 타입의 객체 date 생성
   String curDate = date.toLocaleString();     //   변수 curDate에  현재시각(년.월.일 시:분:초)을 저장

 %>
 <div class="admin"style="width: 100%; height: 890px; background-color:#7994b2; margin:0px; padding:0px;">
     <br><br><br>
     <font size=6 color=white><b><br><br> dxd쇼핑몰:  관리자 모드</b></font><p><br><br><br><br>
	  <font size=3>
	  
      <table>
	  <tr>
 			<td><p style="color:white; width: 140px; font-size: 20px;">접속관리자 ID:</td>
	  	    <td><p style="color:white; width: 140px; font-size: 20px;"><%=id%></td>
	  </tr>
      <tr>
 			<td><p style="color:white; font-size: 20px;">접속 시각: </td>
	  	    <td><p style="color:white; font-size: 20px;"><%=curDate %></td>
	  </tr>
	  </table><p>	  
	  </font>
	  <br><br><br><br><br><br>

<a href="member.html"style="margin-right:20px; text-decoration:none"><font color="white" size='5'><b>회원 관리</b></font></a>
<a href="goods.html" style="margin-right:20px; text-decoration:none"><font color="white" size='5'><b>상품 관리</b></font></a>
<a href="#" style="text-decoration:none"><font color="white" size='5'><b>주문 관리</b></font>
<br><br><br><br><br>

<a href="logout.jsp" target=_parent  style="font-size:16pt;font-family:맑은 고딕; color:black; text-decoration:none"><p style="width:350px; height:30px; background-color: #fff; padding:15px;">관리자 로그아웃</p></a>
<br><br><br><br><br>
</div>

</center>
</body>
</html>
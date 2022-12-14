<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>

<html>
<head>
<title>로그인 결과</title>
</head>

 <body>
 <center>

<%
 	 String DB_URL="jdbc:mysql://localhost:3306/dxd";   //  DB명이 project임
     String DB_ID="multi"; 
     String DB_PASSWORD="abcd";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

    String id = request.getParameter("id");  //  로그인폼(manager_login.jsp)에서 입력한 ID를 넘겨받음
    String pass = request.getParameter("pass");  //  로그인폼(manager_login.jsp)에서 입력한 PW를 넘겨받음

     //  로그인폼(manager_login.jsp)에서 입력한 ID를 포함한 레코드를 manager 테이블에서 조회함
    String jsql = "select * from manager where managerId = ? ";
    PreparedStatement pstmt = con.prepareStatement(jsql);
    pstmt.setString(1, id);

    ResultSet rs = pstmt.executeQuery(); 

    if( rs.next() )   //  (1) 입력한 ID를 가지는 레코드가 manager 테이블에 존재하는 경우
    {
          if (pass.equals(rs.getString("managerPasswd")))
      	//  (1.1) 입력한 ID를 가지는 레코드가 존재하면서, 
	    //	        입력한 비밀번호가 manager 테이블상의 비밀번호와도 일치하는 경우
          {
              session.setAttribute("sid", id);
 	      // 로그인 성공시, 접속한 ID를 "sid" 속성의 속성값으로 설정함.
          // 추후 로그인 된 상태에서 접속 ID와 관련된 정보를 필요로 할때,
	      // (String)session.getAttribute("sid")를 이용하여 접속 ID 정보를 가져올 수 있다.
     	  // 단순히, 로그인 여부 판별은 이 속성값이 null인지 아닌지로 로그인 여부를 확인함. 
	      //  (로그인이 안된 경우, 이 값은 null값을 가짐)

              response.sendRedirect("manager_index.jsp");  	//  <jsp:forward page="manager_index.jsp"/> 와 동일함

		   }  else {   // (1.2) 입력한 ID를 가지는 레코드가 manager테이블에 존재하지만, 비밀번호가 불일치한 경우
%>
		<script>
	  		alert('패스워드가 일치하지 않습니다.');
			history.go(-1);
		</script>         
<%       
          }  // 두번째 if-else 문의 끝        
    } else {   //  (2)  입력한 ID를 가지는 레코드가 manager 테이블에 존재하지 않는 경우
 %>
      <script>
	  	alert('아이디가 존재하지 않습니다.');
		history.go(-1);
	  </script>

<%
   }  // 첫번째 if-else문의 끝
%>
</center>
</body>
</html>
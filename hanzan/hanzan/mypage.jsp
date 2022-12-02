<%@ page contentType="text/html;" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="wodtj=device.width, inital-scale=1.0">
    <title>hanzan main</title>
    <link rel="stylesheet" href="../hanzan/css/hanzan.css">
    <script src="js/jquery-2.2.4.min.js"></script>
    <script src="js/hanzan.js"></script>
</head>
<body>
    <%
     //   로그인 상태를 유지하기 위하여, sid에 저장되었던 접속한 ID값을 
     //   session 객체로부터 가져와서 변수 id에 저장시킴 (loginOK.jsp의 43행부분 확인요망!)
   String id = (String)session.getAttribute("sid"); 
   // String id = session.getAttribute("sid").toString(); 와  동일함
                                                                                         
%>
    <header>
        <div class="logo">
		<%if(id == "" || id == null){%>
         <a href="index.html">
      <%} else {%>
         <a href="index.jsp">
      <%}%>
		<img src="../hanzan/img/logo.png"></a></div>
        <ul class="nav">
            <li class="main-menu"><a href="teastory.jsp">차 이야기</a></li>
            <li class="main-menu">
                <a href="#">차 가게</a>
                <ul class="sub-menu1 hide">
                    <li><a href="subn.jsp">녹차/발효차/홍차</a></li>
                    <li><a href="subm.jsp">허브티(무카페인)</a></li>
                    <li><a href="subb.jsp">블랜디드티</a></li>
                </ul><!--sub-menu-->
            </li>
            <li class="main-menu">
				<a href="#">다과</a>
                <ul class="sub-menu3 hide">
                    <li><a href="desert.jsp">한과</a></li>
                    <li><a href="desert2.jsp">화과자</a></li>
                </ul><!--sub-menu-->
			</li>
            <li class="main-menu">
                <a href="#">다구</a>
                <ul class="sub-menu2 hide">
                    <li><a href="teazan.jsp">찻잔</a></li>
                    <li><a href="teapot.jsp">티팟</a></li>
                </ul><!--sub-menu-->
            </li>
            <li class="main-menu"><a href="haru.jsp">하루한잔</a></li>
			<li class="main-menu"><%if(id == "" || id == null){%>
                           <a href="login.html"> LOGIN
                        <%} else {%>
                           <a href="logout.jsp"> LOGOUT 
                        <%}%></a></li>
            <li class="main-menu"><a href="mypage.jsp"><img src="../hanzan/img/mypage.png"></a></li>
            <li class="main-menu"><a href="showCart.jsp"><img src="../hanzan/img/cart.png"></a></li>
        </ul>
    </header>
    
    <div class="mypagemain">
        <p>마이페이지</p>
    </div>
    <div class="mypage">
        <ul class="mypagenav">
            <li>내 정보수정</li>
            <li>위시리스트</li>
            <li>주문내역</li>
        </ul>
    </div>
<%	 
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/hanzan";  
     String DB_ID="multi";  
     String DB_PASSWORD="abcd";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver"); 
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
	  
	 String jsql = "select * from member where memId = ?";
	 PreparedStatement pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1,id);

	 ResultSet rs = pstmt.executeQuery();
	 rs.next();
			
	 String myid = rs.getString("memId");
   	 String passwd = rs.getString("memPasswd");
	 String name = rs.getString("memName");
	 Date birth = rs.getDate("memBirth");
	 String solar = rs.getString("memSolar");
	 String address1 = rs.getString("memAddress1");
	 String address2 = rs.getString("memAddress2");
	 String phone = rs.getString("memPhone");
%>
	<script>
		function zipCheck()
{
	window.open("zipCheck.jsp", "win", "width=600, height=200, scrollbars=yes, status=yes");
}
	</script>
    <div class="myupdate hide">
        <div class="sign2">
            <div class="signup2">
            <center> 
			<p style="font-size:24px; margin-left:20px">내 정보수정</p>
                <form name="newMem" method="post" action="updateMemberResult.jsp">
                <table class="signbox" cellpadding=5 style = "margin-top:20px; "> 
                    <tr>
                        <td>아이디</td>
                        <td class="idbtn"><input type="hidden" name="id" value="<%=myid%>"><%=myid%></td>	
                    </tr>
                    <tr>
                        <td>패스워드</td>
                        <td><input type=text name="passwd" value="<%=passwd%>"></td>
                    </tr>
                    <tr>
                        <td>성명</td>
                        <td><input type=text name="name" value="<%=name%>"></td>
                    </tr>
                    <tr>
                        <td>생년월일 </td>
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
									<input type=radio name=solar value="양력" style="width:10px;height:10px;border:1px;" checked>양력
									<input type=radio name=solar value="음력" style="width:10px;height:10px;border:1px;">음력
							<%
								}
								else
								{
							%>
									<input type=radio name=solar value="양력" style="width:10px;height:10px;border:1px;">양력
									<input type=radio name=solar value="음력" style="width:10px;height:10px;border:1px;" checked>음력
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
                        <td>휴대폰번호 </td>
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
                            <select name="hp1" style="width:100px;height:50px;border:1px;font-size:20px;padding-left:20px;">
                                <option value="010" <%=hpSelected[0]%> style="font-size:20px;"selected>010
                                <option value="011" <%=hpSelected[1]%> style="font-size:20px;">011
                                <option value="016" <%=hpSelected[2]%> style="font-size:20px;">016
                                <option value="017" <%=hpSelected[3]%> style="font-size:20px;">017
                                <option value="018" <%=hpSelected[4]%> style="font-size:20px;">018
                                <option value="019" <%=hpSelected[5]%> style="font-size:20px;">019
                            </select> -
                            <input type="text" name="hp2" value="<%=hpArr[1]%>" size="4"> -
                            <input type="text" name="hp3" value="<%=hpArr[2]%>" size="4">
                        </td>
                    </tr>
                </table>
                <p>    
                    <a href = "mypage.jsp"><input type="button" value="취    소" style="width:358px; margin-left:18px;margin-right: 15px;"></a>                        
                </p>
                <p>
                    <input type="submit" value="회원정보 수정" class="singnbtn" style="width:358px;">  
                </p>
                </form>
				<%
					} catch (Exception e) {
					 out.println(e);	
					}
				%>
            </center>
            </div>
        </div>
    </div> <!--myupdate-->
 
  
<div class="wishlist hide">
<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/hanzan";    // 접속 DB는 project
     String DB_ID="multi"; 
     String DB_PASSWORD="abcd";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 


	String jsql = "select * from favorit";
	PreparedStatement pstmt = con.prepareStatement(jsql);

	ResultSet rs = pstmt.executeQuery();

	while(rs.next()) 
  		{			          

	String no = rs.getString("prdNo");
	String name = rs.getString("prdName");	
	int price = rs.getInt("prdPrice");
%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
        <ul class="wish">
            <li>
                <img src="./img/c<%=no%>.png">
                <p><%=name%><span><fmt:formatNumber value="<%=price%>" type="number"/>원</span></p>
                <p><a href="viewDetailProduct.jsp?prdNo=<%=no%>">상세보기</a></p>
                <p><a href="deleteFavorit.jsp?prdNo=<%=no%>">상품삭제</a></p>
            </li>
			<%
	     }  // while문의 끝
 %>
        </ul>
    </div><!--wishlist--> 

<%
		
   }  catch(Exception e)  {
        out.println(e);
} 
%>

    <div class="orderlist hide">
	<%
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/hanzan";    // 접속 DB는 project
     String DB_ID="multi"; 
     String DB_PASSWORD="abcd";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 
	

	 // 장바구니에 물건을 담기 전후, mysql상에서 select * from cart;의 결과를 함께 확인/비교 해가면서
	 // cart테이블에 남아있는 상품레코드정보와 장바구니번호(ctNo)를 함께 이해해 보도록 할 것!
	 //  =>  홈페이지상에서 보여지는 장바구니 내역에 포함된 레코드들이, 실제로 cart테이블상에서는 
	 //         무엇을 의미하고 있는지 곰곰히 생각해 볼 것! (중요!)
	 String jsql = "select * from orderProduct";
	 PreparedStatement pstmt = con.prepareStatement(jsql);

	 ResultSet rs = pstmt.executeQuery();

	 if(!rs.next())    // 조회 결과가 존재하지 않으면,  rs.next()는 false를 리턴함. 
	 {                       //  따라서,  !rs.next()의 값은 true가 됨 
%>
		<p style="margin-top:250px; font-size:20px; height:300px;  text-align: center;">결제된 상품이 없습니다.
<%
	}
	else
	{
%>
		
	
<%
	String jsql2 = "select * from orderProduct";
		PreparedStatement pstmt2 = con.prepareStatement(jsql2);	

		ResultSet rs2 = pstmt2.executeQuery(); 

		int total=0;

		while(rs2.next()) 
  		{			                   
			String prdNo = rs2.getString("prdNo");	//  cart테이블로부터 상품번호 추출
    		int ordQty = rs2.getInt("ordQty");	                //  cart테이블로부터 주문수량 추출 

    		String jsql3 = "select prdName, prdPrice from goods where prdNo = ?";
	    	PreparedStatement pstmt3 = con.prepareStatement(jsql3);
		    pstmt3.setString(1, prdNo);
		    
			ResultSet rs3 = pstmt3.executeQuery(); 
			rs3.next();

			String	prdName =  rs3.getString("prdName");	  //  goods 테이블로부터 상품명 추출
			int prdPrice =  rs3.getInt("prdPrice");                 //  goods 테이블로부터 상품단가 추출
				
    		int amount = prdPrice * ordQty;    //  주문액 계산
			total = total + amount;                  //  전체 주문총액 계산
%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
        <table class="carttable2">
            <tbody>
            <tr>       
                <td class="goods"><img src="./img/c<%=prdNo%>.png"></td>
                <td class="data">
					<p>상품번호 <%=prdNo%></p>
					<p><%=prdName%></p>
					<p>수량 <%=ordQty%></p>
					<p>상품가격 <fmt:formatNumber value="<%=amount%>" type="number"/></p>
                </td> 
            </tr> 
			<%
				}  // while문의 끝
			%>
            </tbody>
        </table>
		<%
			}	
				 }  catch(Exception e)  {
					out.println(e);
				} 
		%>
    </div><!--orderlist-->

    <div class="mypagecheck">
        <img src="./img/mypagecheck.png">
    </div>

    <footer>
        <ul class="icon">
            <li><a href = "https://www.instagram.com/"><img src="../hanzan/img/insta.png"></a></li>
            <li><a href = "https://www.facebook.com/"><img src="../hanzan/img/facebook.png"></a></li>
        </ul>
        <p><span><a href="adminlogin.jsp">관리자 로그인</a></span>
            Address : Gangnam, Seoul, Korea / tel : 010-1212-3232 / E-mail : hanzan@naver.com
            <span>Copyright : hanzan.All rights reserved.</span>
        </p>
    </footer>
</body>
</html>
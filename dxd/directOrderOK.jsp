<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*, java.text.*" %>
<html>
<head>
<title>주문 처리 완료</title>

 <style type="text/css">
     a:link { text-decoration: none; color: black; }           <!-- 클릭하기전의 설정은 선없고 검정색 -->
     a:visited { text-decoration: none; color: black; }     <!-- 방문한뒤의 설정은 밑줄없고 검정 -->
     a:hover { text-decoration: underline; color:gray; } <!-- 마우스가 올라갈때 설정은 아랫줄있고 파랑 -->
 </style>

</head>

<%
//   cart 테이블이 아니라, tempcart 테이블을 사용하고 (61행 참조),
//   deleteAllCart.jsp?case=1가 아니라, deleteTempCart.jsp를 사용한다(108행 참조)는 점을 제외하면,
//   directOrderOK.jsp는 orderOK.jsp와 모든 코드가 동일함에 유의할 것!

try{
 	 String DB_URL="jdbc:mysql://localhost:3306/dxd";    // 접속 DB는 project
     String DB_ID="multi"; 
     String DB_PASSWORD="abcd";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	request.setCharacterEncoding("euc-kr");

	String ctNo = session.getId();   //  세션번호(장바구니번호) 를 ctNo에 저장
    String	myid = (String)session.getAttribute("sid");  //   접속 ID 값을 가져와서 변수 myid에 저장.
                                                                                            //  주문자정보를 위해 추후 필요함.
	String oName = request.getParameter("name");
	String oTel = request.getParameter("memTel");
	String oReceiver = request.getParameter("receiver");
	String 	oRcvAddress = request.getParameter("rcvAddress");
	String 	oRcvPhone = request.getParameter("rcvPhone");		
	String oCardNo = request.getParameter("cardNo");
	String oCardPass = request.getParameter("cardPass");
	String 	oBank = request.getParameter("bank");
	String 	oPay = request.getParameter("pay");   		

// 새로운 주문번호(ordNo)를 부여하기 위해, 주문테이블에 있는 마지막 주문번호를 가져옴.
// 주문이 들어올 때마다 주문번호는 1씩 증가하므로, MAX(ordNo)은 ordNo의 최대값, 즉 
//  마지막 주문번호를 의미함.
	String jsql = "select MAX(ordNo) from orderInfo";
	PreparedStatement pstmt = con.prepareStatement(jsql);

	ResultSet rs = pstmt.executeQuery(); 

	int oNum;
	if(rs.next())                             // 주문번호가 orderinfo 테이블에 존재한다면,  "이전 주문번호" + 1 을 수행
		oNum = rs.getInt(1) + 1;    //  rs.getInt(1)의 의미:   rs.next()가 가리키고 있는 레코드의 첫번째 필드에 
		                                             //  해당하는 필드값을 의미함 
		                                             //  이 경우, rs.getInt(1)는  rs.getInt("MAX(ordNo)")와 동일한 의미가 됨.
  												     //  => mysql상에서 sql문을 실행하여 왜 동일의미가 되는지 꼭 확인해 볼 것!
	else                     
		oNum = 1;   // 주문번호가 존재하지 않는다면, 주문번호를 1부터 시작하도록 함
	                         // (아직 단 한건의 주문도 접수받지 않은 상태라면, 주문번호가 존재하지 않을 수도 있음) 

	String jsql2 = "select prdNo, ctQty from tempcart where ctNo = ?";   //  tempcart 테이블을 사용하고 있음에 유의!
	PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	pstmt2.setString(1, ctNo);		

	ResultSet rs2 = pstmt2.executeQuery(); 

//  tempcart 테이블에 있는 내역들을 읽어와서,
//  주문상품 테이블(ordProduct)에 주문번호(ordNo), 상품번호(prdNo), 주문수량(ordQty)을 저장시킴!
	while(rs2.next())   // 주문상품테이블(orderProduct)에 주문번호(ordNo), 상품번호(prdNo), 
	{			                    // 주문수량(ordQty)을 저장하기 위해 tempcart 테이블로부터
	                                //  prdNo과 ctQty를 가져온다.
			String prdNo = rs2.getString("prdNo");	//  tempcart 테이블로부터 상품번호 추출
    		int ctQty = rs2.getInt("ctQty");	                //  tempcart 테이블로부터 주문수량 추출 

			String jsql3 = "INSERT INTO orderProduct (ordNo, prdNo, ordQty) VALUES (?,?,?)";
			PreparedStatement pstmt3 = con.prepareStatement(jsql3);
			pstmt3.setString(1, Integer.toString(oNum));
			pstmt3.setString(2, prdNo);
			pstmt3.setInt(3, ctQty);

			pstmt3.executeUpdate();
	 }

//  주문정보 테이블(ordInfo)에 저장시킬 필드들을 저장 
	String jsql4 = "INSERT INTO orderInfo (ordNo, memId, ordDate, ordReceiver, ordRcvAddress, ordRcvPhone, ordPay, ordBank, ordCardNo, ordCardPass)  VALUES(?,?,?,?,?,?,?,?,?,?)";

// 주문일을 오늘 날짜로 ordInfo테이블에 저장
	java.util.Date date = new java.util.Date();   //   Date 타입의 객체 date 생성
    String oDate = date.toLocaleString();         //   변수 oDate에 현재 시각(년.월.일 시:분:초)을 저장

	PreparedStatement pstmt4 = con.prepareStatement(jsql4);
	pstmt4.setString(1, Integer.toString(oNum));
	pstmt4.setString(2, myid);
	pstmt4.setString(3, oDate);
	pstmt4.setString(4, oReceiver);
	pstmt4.setString(5, oRcvAddress);
	pstmt4.setString(6, oRcvPhone);
    pstmt4.setString(7, oPay);
	pstmt4.setString(8, oBank);
	pstmt4.setString(9, oCardNo);
	pstmt4.setString(10, oCardPass);

	pstmt4.executeUpdate();

//  주문정보와 관련된 일체의 정보들을 각각 orderproduct 테이블과 orderinfo 테이블에 
//  저장시킨 후, tempcart 테이블 비우기를 수행함.

	 response.sendRedirect("deleteTempCart.jsp");    //  forward 액션태그를 사용해도 동일함

   }  catch(Exception e)  {
        out.println(e);
} 
%>
  
</body>
</html> 
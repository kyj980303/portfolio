<%@ page contentType="text/html;charset=euc-kr" %>
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
		<button class="btn_nav mobile hide"><img src="./img/menuicon.png"></button>
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
		<div class="nav2 hide">
            <nav id="navWrap">
                <div class="nav_inner">
                    <div class="logo2"><img src="./img/logo.png"></div>
                    <div class="close"><img src="./img/x.png"></div>
                    <ul class="gnb">
                        <li> <!--브랜드스토리 클릭했을때 열리게-->
                            <a href="teastory.jsp">차 이야기
                        </li>
                        <li> <!--브랜드스토리 클릭했을때 열리게-->
                            <a href="#">차 가게<img src="./img/arrowdown.png"></a>
                            <div class="sub_wrap hide">
                                <div class="left">
                                    <ul>
                                        <li><a href="subn.jsp">녹차/발효차/홍차</a></li>
                                        <li><a href="subm.jsp">허브티(무카페인)</a></li>
                                        <li><a href="subb.jsp">블랜디드티</a></li>
                                    </ul>
                                </div><!--left-->
                            </div><!--sub_wrap mobile:sub pc:absolute-->
                        </li>
                        <li> <!--브랜드스토리 클릭했을때 열리게-->
                            <a href="#">다과<img src="./img/arrowdown.png"></a>
                            <div class="sub_wrap hide">
                                <div class="left">
                                    <ul>
                                        <li><a href="desert.jsp">한과</a></li>
                                        <li><a href="desert2.jsp">화과자</a></li>
                                    </ul>
                                </div><!--left-->
                            </div><!--sub_wrap mobile:sub pc:absolute-->
                        </li>
                        <li> <!--브랜드스토리 클릭했을때 열리게-->
                            <a href="#">다구<img src="./img/arrowdown.png"></a>
                            <div class="sub_wrap hide">
                                <div class="left">
                                    <ul>
                                        <li><a href="teazan.jsp">찻잔</a></li>
                                        <li><a href="teapot.jsp">티팟</a></li>
                                    </ul>
                                </div><!--left-->
                            </div><!--sub_wrap mobile:sub pc:absolute-->
                        </li>
                        <li> <!--브랜드스토리 클릭했을때 열리게-->
                            <a href="haru.jsp">하루한잔</a>
                        </li>
                        <li class="main-menu"><%if(id == "" || id == null){%>
                           <a href="login.html"> LOGIN
                        <%} else {%>
                           <a href="logout.jsp"> LOGOUT 
                        <%}%><img src="../hanzan/img/loginikon.png"></a></li>
                        <li><a href="login.jsp">마이페이지<img src="../hanzan/img/mypageikon2.png"></a></li>
                        <li><a href="showCart.jsp">장바구니<img src="../hanzan/img/cartikon2.png"></a></li>
                    </ul>
                </div><!--nav_inner mobile:흰색영역 pc:가운데정렬-->
            </nav><!--navWrap mobile:검은영역 pc:전체영역-->
        </div> 
    </header>

<script language="javascript" >

function checkID()		// ID를 입력받은 후에 팝업창을 띄워주면서 
{  										//   checkId.jsp (중복검사 수행)를 호출해 주는 자바스크립트 함수
	var id = newMem.id.value;		//  form의 이름이 newMem인 것에 주목할 것!

    if (id  == "")				//   11~16행:  ID를 입력없이 ID 중복체크 버튼을 클릭할 경우의 처리
    {
		alert("ID를 입력해 주세요!"); 
		newMem.id.focus(); 
		return; 
    }

	window.open("checkId.jsp?id="+id,"win", "width=255, height=145, scrollbars=no, resizable=no");
}                                        // 용례)  =>  window.open("URL", "창이름", "창의 특성");




function checkValue()             // 회원가입폼에서 미입력한 항목이 있을 경우, 경고메시지를 보여주는 함수
{                                           
	if(newMem.id.value == "")     // if(document.newMem.id.value == "")라고 사용해도 동일함
    {
		alert("ID를 입력해 주세요!");  //  문자열이 포함된 경고창을 실행시킴
		newMem.id.focus();					//  작업의 포커스(커서)를 ID를 입력하는 텍스트필드로 이동시킴  
		return;                         //  함수의 실행을 종료함 ( "return false; " 라고 사용해도 동일함)
    }

    if(newMem.password.value == "") 
    {
		alert("비밀번호를 입력해 주세요!");
		newMem.password.focus();
		return;
    }

    if(newMem.name.value == "") 
    {
		alert("성명을 입력해 주세요!");
		newMem.name.focus();
		return;
    }

    if(newMem.joomin1.value == "") 
    {
		alert("주민등록번호 앞자리를 입력해 주세요!");
		newMem.joomin1.focus();
		return;
    }

    if(newMem.joomin2.value == "") 
    {
		alert("주민등록번호 뒷자리를 입력해 주세요!");
		newMem.joomin2.focus();
		return;
    }

    if(newMem.birthYear.value == "") 
    {
		alert("태어난 연도를 입력해 주세요!");
		newMem.birthYear.focus();
		return;
    }

    if(newMem.birthMonth.value == "") 
    {
		alert("태어난 달을 입력해 주세요!");
		newMem.birthMonth.focus();
		return;
    }

    if(newMem.birthDay.value == "") 
    {
		alert("태어난 날짜를 입력해 주세요!");
		newMem.birthDay.focus();
		return;
    }

    if(newMem.telephone.value == "") 
    {
		alert("전화번호를 입력해 주세요!");
		newMem.telephone.focus();
		return;
    }

    if(newMem.address1.value == "") 
    {
		alert("집주소를 입력해 주세요! - (우편번호검색 버튼 클릭)");
		newMem.address1.focus();
		return;
    }

    if(newMem.address2.value == "") 
    {
		alert("상세주소를 입력해 주세요!");
		newMem.address2.focus();
		return;
    }

	if(newMem.hp1.value == "") 
    {
		alert("휴대폰 앞자리 국번을 입력해 주세요!");
		newMem.hp1.focus();
		return;
    }

    if(newMem.hp2.value == "") 
    {
		alert("휴대폰 중간자리 번호를 입력해 주세요!");
		newMem.hp2.focus();
		return;
    }

    if(newMem.hp3.value == "") 
    {
		alert("휴대폰 끝자리 번호를 입력해 주세요!");
		newMem.hp3.focus();
		return;
    }

    newMem.submit();   // 입력한 값들을 모두 서버로 전송함 (전송버튼 클릭하는 것과 같은 효과)
}



function idFocus()        // 폼이 로딩되면  ID를 입력하는 위치에 바로 커서를 위치시켜놓는
{										// 자바스크립트 함수  (body 태그안의 onLoad 이벤트 핸들러에 주목할 것!)
	newMem.id.focus();
	return;
}


function zipCheck()
{
	window.open("zipCheck.jsp", "win", "width=600, height=200, scrollbars=yes, status=yes");
}

</script> 


<body onLoad="idFocus()">  	<!--  body태그가 실행 되면 idFocus()함수가 자동으로 호출됨 -->                    
<div class="sign" style = "height: 940px;">
        <p style="margin-left:40px;margin-top:100px;">회원가입</p>
        <div class="signup">
            <center>                                                                  
            <form name="newMem" method="post" action="insertMemberResult.jsp">
                <table class="signbox" cellpadding=5>
		<tr>
            <td>아이디</td>
            <td class="idbtn"><input type="text" name="id"><a href="javascript:checkID()"><img src="./img/idbtn.png"></a></td>	
        </tr>
        <tr>
            <td>패스워드</td>
            <td><input type="password" name="password" size="21"></td>
        </tr>
        <tr>
            <td>성명</td>
            <td><input type="text" name="name"></td>
        </tr>
		<tr>
			<td>생년월일 </td>
			<td>
				<input type="text" name="birthYear" size="4">년
                <input type="text" name="birthMonth" size="2">월
                <input type="text" name="birthDay" size="2">일
                <input type="radio" name="solar" value="양력" style="width:10px;height:10px;border:1px;"checked>양력
                <input type="radio" name="solar" value="음력" style="width:10px;height:10px;border:1px;">음력
			</td>
		</tr>
		<tr>
			<td>주소 </td> <!--  검색해서 선택한 주소를 수정못하게 하기 위해 readonly 처리시킴 -->
			<td>
				<input type="text" name="zipcode" size="7" readonly> 
			    <input type="button" value="우편번호검색" style="width:120px;height:35px;padding-right:15px;" onClick="zipCheck()"><br>     
                <input type="text" name="address1" size="100" style="width:300px;height:35px;" readonly><br>
				<input type="text" name="address2" size="100" style="width:300px;height:35px;">&nbsp<font size =2>상세주소를 입력해주세요.</font>
			</td>
		</tr>
		<tr>
			<td>휴대폰번호 </td>
			<td>
				<select name="hp1" style="width:100px;height:50px;border:1px;font-size:20px;padding-left:20px;">
					<option value="010" style="font-size:20px;"selected>010
					<option value="011" style="font-size:20px;">011
					<option value="016" style="font-size:20px;">016
					<option value="017" style="font-size:20px;">017
					<option value="018" style="font-size:20px;">018
					<option value="019" style="font-size:20px;">019
				</select> -
				<input type="text" name="hp2" size="4"> -
				<input type="text" name="hp3" size="4">
			</td>
		</tr>
	</table>
	<p>                            
		<input type="submit" value="회원가입" class="singnbtn" style="width: 685px; margin-left:15px;" onClick="checkValue()">  
    </p>
    <p>
        <a href = "index.html"><input type="button" style="width: 685px; margin-left:15px;" value="취    소"></a>
    </p>
</form>
</center>
</div>
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
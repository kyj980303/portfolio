<%@ page contentType="text/html;charset=euc-kr" %>

<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="wodtj=device.width, inital-scale=1.0">
    <title>DXD sign up</title>
    <link rel="stylesheet" href="../dxd/css/dxd.css">
    <script src="js/jquery-3.5.1.min.js"></script>
    <script src="js/dxd.js"></script>
	<script language="javascript" src="js_package.js"></script>
</head>   
<body onLoad="idFocus()">                    
    <div class="sign">
        <p>SIGN UP</p>
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
                        <td>주민등록번호 </td>
                        <td>
                            <input type="text" name="joomin1" size="6"> -
                            <input type="text" name="joomin2" size="7">
                        </td>
                    </tr>
                    <tr>
                        <td>생년월일 </td>
                        <td>
                            <input type="text" name="birthYear" size="4">년
                            <input type="text" name="birthMonth" size="2">월
                            <input type="text" name="birthDay" size="2">일
                            <input type="radio" name="solar" value="양력" style="width:30px;height:30px;border:1px;"checked>양력
                            <input type="radio" name="solar" value="음력" style="width:30px;height:30px;border:1px;">음력
                        </td>
                    </tr>
                    <tr>
                        <td>전화번호 </td>
                        <td><input type="text" name="telephone"></td>
                    </tr>
                    <tr>
                        <td>주소 </td>
                        <td><input type="text" name="address"></td>
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
                    <tr>
                        <td>성별</td>
                        <td>
                            <input type="radio" name="sex" value="남" style="width:30px;height:30px;border:1px;" checked>남
                            <input type="radio" name="sex" value="여" style="width:30px;height:30px;border:1px;">여
                        </td>
                    </tr>
                    <tr>
                        <td>취미</td>
                        <td>
                            <input type="checkbox" name="hobby" value="독서" style="width:30px;height:30px;border:1px;">독서
                            <input type="checkbox" name="hobby" value="음악" style="width:30px;height:30px;border:1px;">음악
                            <input type="checkbox" name="hobby" value="영화" style="width:30px;height:30px;border:1px;">영화
                            <input type="checkbox" name="hobby" value="게임" style="width:30px;height:30px;border:1px;">게임
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">직업</td>
                        <td>
                            <select name="job"style="width:200px;height:50px;border:1px;font-size:20px;padding-left: 20px;">
                                <option value="웹디자이너" selected>웹디자이너
                                <option value="프로그래머">프로그래머
                                <option value="회사원">회사원
                                <option value="학생">학생
                                <option value="영화감독">영화감독
                                <option value="웹마스터">웹마스터
                            </select>
                        </td>
                    </tr>
                </table>
                <p>                            
                    <input type="button" value="회원가입" onClick="checkValue()">  
                    <a href = "login.jsp"><input type="button" value="취    소"></a>
                </p>
            </form>
            </center>
        </div>
    </div>
</body>
</html>
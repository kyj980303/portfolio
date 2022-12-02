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
     //   �α��� ���¸� �����ϱ� ���Ͽ�, sid�� ����Ǿ��� ������ ID���� 
     //   session ��ü�κ��� �����ͼ� ���� id�� �����Ŵ (loginOK.jsp�� 43��κ� Ȯ�ο��!)
   String id = (String)session.getAttribute("sid"); 
   // String id = session.getAttribute("sid").toString(); ��  ������
                                                                                         
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
            <li class="main-menu"><a href="teastory.jsp">�� �̾߱�</a></li>
            <li class="main-menu">
                <a href="#">�� ����</a>
                <ul class="sub-menu1 hide">
                    <li><a href="subn.jsp">����/��ȿ��/ȫ��</a></li>
                    <li><a href="subm.jsp">���Ƽ(��ī����)</a></li>
                    <li><a href="subb.jsp">�����Ƽ</a></li>
                </ul><!--sub-menu-->
            </li>
            <li class="main-menu">
				<a href="#">�ٰ�</a>
                <ul class="sub-menu3 hide">
                    <li><a href="desert.jsp">�Ѱ�</a></li>
                    <li><a href="desert2.jsp">ȭ����</a></li>
                </ul><!--sub-menu-->
			</li>
            <li class="main-menu">
                <a href="#">�ٱ�</a>
                <ul class="sub-menu2 hide">
                    <li><a href="teazan.jsp">����</a></li>
                    <li><a href="teapot.jsp">Ƽ��</a></li>
                </ul><!--sub-menu-->
            </li>
            <li class="main-menu"><a href="haru.jsp">�Ϸ�����</a></li>
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
                        <li> <!--�귣�彺�丮 Ŭ�������� ������-->
                            <a href="teastory.jsp">�� �̾߱�
                        </li>
                        <li> <!--�귣�彺�丮 Ŭ�������� ������-->
                            <a href="#">�� ����<img src="./img/arrowdown.png"></a>
                            <div class="sub_wrap hide">
                                <div class="left">
                                    <ul>
                                        <li><a href="subn.jsp">����/��ȿ��/ȫ��</a></li>
                                        <li><a href="subm.jsp">���Ƽ(��ī����)</a></li>
                                        <li><a href="subb.jsp">�����Ƽ</a></li>
                                    </ul>
                                </div><!--left-->
                            </div><!--sub_wrap mobile:sub pc:absolute-->
                        </li>
                        <li> <!--�귣�彺�丮 Ŭ�������� ������-->
                            <a href="#">�ٰ�<img src="./img/arrowdown.png"></a>
                            <div class="sub_wrap hide">
                                <div class="left">
                                    <ul>
                                        <li><a href="desert.jsp">�Ѱ�</a></li>
                                        <li><a href="desert2.jsp">ȭ����</a></li>
                                    </ul>
                                </div><!--left-->
                            </div><!--sub_wrap mobile:sub pc:absolute-->
                        </li>
                        <li> <!--�귣�彺�丮 Ŭ�������� ������-->
                            <a href="#">�ٱ�<img src="./img/arrowdown.png"></a>
                            <div class="sub_wrap hide">
                                <div class="left">
                                    <ul>
                                        <li><a href="teazan.jsp">����</a></li>
                                        <li><a href="teapot.jsp">Ƽ��</a></li>
                                    </ul>
                                </div><!--left-->
                            </div><!--sub_wrap mobile:sub pc:absolute-->
                        </li>
                        <li> <!--�귣�彺�丮 Ŭ�������� ������-->
                            <a href="haru.jsp">�Ϸ�����</a>
                        </li>
                        <li class="main-menu"><%if(id == "" || id == null){%>
                           <a href="login.html"> LOGIN
                        <%} else {%>
                           <a href="logout.jsp"> LOGOUT 
                        <%}%><img src="../hanzan/img/loginikon.png"></a></li>
                        <li><a href="login.jsp">����������<img src="../hanzan/img/mypageikon2.png"></a></li>
                        <li><a href="showCart.jsp">��ٱ���<img src="../hanzan/img/cartikon2.png"></a></li>
                    </ul>
                </div><!--nav_inner mobile:������� pc:�������-->
            </nav><!--navWrap mobile:�������� pc:��ü����-->
        </div> 
    </header>

<script language="javascript" >

function checkID()		// ID�� �Է¹��� �Ŀ� �˾�â�� ����ָ鼭 
{  										//   checkId.jsp (�ߺ��˻� ����)�� ȣ���� �ִ� �ڹٽ�ũ��Ʈ �Լ�
	var id = newMem.id.value;		//  form�� �̸��� newMem�� �Ϳ� �ָ��� ��!

    if (id  == "")				//   11~16��:  ID�� �Է¾��� ID �ߺ�üũ ��ư�� Ŭ���� ����� ó��
    {
		alert("ID�� �Է��� �ּ���!"); 
		newMem.id.focus(); 
		return; 
    }

	window.open("checkId.jsp?id="+id,"win", "width=255, height=145, scrollbars=no, resizable=no");
}                                        // ���)  =>  window.open("URL", "â�̸�", "â�� Ư��");




function checkValue()             // ȸ������������ ���Է��� �׸��� ���� ���, ���޽����� �����ִ� �Լ�
{                                           
	if(newMem.id.value == "")     // if(document.newMem.id.value == "")��� ����ص� ������
    {
		alert("ID�� �Է��� �ּ���!");  //  ���ڿ��� ���Ե� ���â�� �����Ŵ
		newMem.id.focus();					//  �۾��� ��Ŀ��(Ŀ��)�� ID�� �Է��ϴ� �ؽ�Ʈ�ʵ�� �̵���Ŵ  
		return;                         //  �Լ��� ������ ������ ( "return false; " ��� ����ص� ������)
    }

    if(newMem.password.value == "") 
    {
		alert("��й�ȣ�� �Է��� �ּ���!");
		newMem.password.focus();
		return;
    }

    if(newMem.name.value == "") 
    {
		alert("������ �Է��� �ּ���!");
		newMem.name.focus();
		return;
    }

    if(newMem.joomin1.value == "") 
    {
		alert("�ֹε�Ϲ�ȣ ���ڸ��� �Է��� �ּ���!");
		newMem.joomin1.focus();
		return;
    }

    if(newMem.joomin2.value == "") 
    {
		alert("�ֹε�Ϲ�ȣ ���ڸ��� �Է��� �ּ���!");
		newMem.joomin2.focus();
		return;
    }

    if(newMem.birthYear.value == "") 
    {
		alert("�¾ ������ �Է��� �ּ���!");
		newMem.birthYear.focus();
		return;
    }

    if(newMem.birthMonth.value == "") 
    {
		alert("�¾ ���� �Է��� �ּ���!");
		newMem.birthMonth.focus();
		return;
    }

    if(newMem.birthDay.value == "") 
    {
		alert("�¾ ��¥�� �Է��� �ּ���!");
		newMem.birthDay.focus();
		return;
    }

    if(newMem.telephone.value == "") 
    {
		alert("��ȭ��ȣ�� �Է��� �ּ���!");
		newMem.telephone.focus();
		return;
    }

    if(newMem.address1.value == "") 
    {
		alert("���ּҸ� �Է��� �ּ���! - (�����ȣ�˻� ��ư Ŭ��)");
		newMem.address1.focus();
		return;
    }

    if(newMem.address2.value == "") 
    {
		alert("���ּҸ� �Է��� �ּ���!");
		newMem.address2.focus();
		return;
    }

	if(newMem.hp1.value == "") 
    {
		alert("�޴��� ���ڸ� ������ �Է��� �ּ���!");
		newMem.hp1.focus();
		return;
    }

    if(newMem.hp2.value == "") 
    {
		alert("�޴��� �߰��ڸ� ��ȣ�� �Է��� �ּ���!");
		newMem.hp2.focus();
		return;
    }

    if(newMem.hp3.value == "") 
    {
		alert("�޴��� ���ڸ� ��ȣ�� �Է��� �ּ���!");
		newMem.hp3.focus();
		return;
    }

    newMem.submit();   // �Է��� ������ ��� ������ ������ (���۹�ư Ŭ���ϴ� �Ͱ� ���� ȿ��)
}



function idFocus()        // ���� �ε��Ǹ�  ID�� �Է��ϴ� ��ġ�� �ٷ� Ŀ���� ��ġ���ѳ���
{										// �ڹٽ�ũ��Ʈ �Լ�  (body �±׾��� onLoad �̺�Ʈ �ڵ鷯�� �ָ��� ��!)
	newMem.id.focus();
	return;
}


function zipCheck()
{
	window.open("zipCheck.jsp", "win", "width=600, height=200, scrollbars=yes, status=yes");
}

</script> 


<body onLoad="idFocus()">  	<!--  body�±װ� ���� �Ǹ� idFocus()�Լ��� �ڵ����� ȣ��� -->                    
<div class="sign" style = "height: 940px;">
        <p style="margin-left:40px;margin-top:100px;">ȸ������</p>
        <div class="signup">
            <center>                                                                  
            <form name="newMem" method="post" action="insertMemberResult.jsp">
                <table class="signbox" cellpadding=5>
		<tr>
            <td>���̵�</td>
            <td class="idbtn"><input type="text" name="id"><a href="javascript:checkID()"><img src="./img/idbtn.png"></a></td>	
        </tr>
        <tr>
            <td>�н�����</td>
            <td><input type="password" name="password" size="21"></td>
        </tr>
        <tr>
            <td>����</td>
            <td><input type="text" name="name"></td>
        </tr>
		<tr>
			<td>������� </td>
			<td>
				<input type="text" name="birthYear" size="4">��
                <input type="text" name="birthMonth" size="2">��
                <input type="text" name="birthDay" size="2">��
                <input type="radio" name="solar" value="���" style="width:10px;height:10px;border:1px;"checked>���
                <input type="radio" name="solar" value="����" style="width:10px;height:10px;border:1px;">����
			</td>
		</tr>
		<tr>
			<td>�ּ� </td> <!--  �˻��ؼ� ������ �ּҸ� �������ϰ� �ϱ� ���� readonly ó����Ŵ -->
			<td>
				<input type="text" name="zipcode" size="7" readonly> 
			    <input type="button" value="�����ȣ�˻�" style="width:120px;height:35px;padding-right:15px;" onClick="zipCheck()"><br>     
                <input type="text" name="address1" size="100" style="width:300px;height:35px;" readonly><br>
				<input type="text" name="address2" size="100" style="width:300px;height:35px;">&nbsp<font size =2>���ּҸ� �Է����ּ���.</font>
			</td>
		</tr>
		<tr>
			<td>�޴�����ȣ </td>
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
		<input type="submit" value="ȸ������" class="singnbtn" style="width: 685px; margin-left:15px;" onClick="checkValue()">  
    </p>
    <p>
        <a href = "index.html"><input type="button" style="width: 685px; margin-left:15px;" value="��    ��"></a>
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
        <p><span><a href="adminlogin.jsp">������ �α���</a></span>
            Address : Gangnam, Seoul, Korea / tel : 010-1212-3232 / E-mail : hanzan@naver.com
            <span>Copyright : hanzan.All rights reserved.</span>
        </p>
    </footer>
</body>
</html>
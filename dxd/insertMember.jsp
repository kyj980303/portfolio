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
                        <td>�ֹε�Ϲ�ȣ </td>
                        <td>
                            <input type="text" name="joomin1" size="6"> -
                            <input type="text" name="joomin2" size="7">
                        </td>
                    </tr>
                    <tr>
                        <td>������� </td>
                        <td>
                            <input type="text" name="birthYear" size="4">��
                            <input type="text" name="birthMonth" size="2">��
                            <input type="text" name="birthDay" size="2">��
                            <input type="radio" name="solar" value="���" style="width:30px;height:30px;border:1px;"checked>���
                            <input type="radio" name="solar" value="����" style="width:30px;height:30px;border:1px;">����
                        </td>
                    </tr>
                    <tr>
                        <td>��ȭ��ȣ </td>
                        <td><input type="text" name="telephone"></td>
                    </tr>
                    <tr>
                        <td>�ּ� </td>
                        <td><input type="text" name="address"></td>
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
                    <tr>
                        <td>����</td>
                        <td>
                            <input type="radio" name="sex" value="��" style="width:30px;height:30px;border:1px;" checked>��
                            <input type="radio" name="sex" value="��" style="width:30px;height:30px;border:1px;">��
                        </td>
                    </tr>
                    <tr>
                        <td>���</td>
                        <td>
                            <input type="checkbox" name="hobby" value="����" style="width:30px;height:30px;border:1px;">����
                            <input type="checkbox" name="hobby" value="����" style="width:30px;height:30px;border:1px;">����
                            <input type="checkbox" name="hobby" value="��ȭ" style="width:30px;height:30px;border:1px;">��ȭ
                            <input type="checkbox" name="hobby" value="����" style="width:30px;height:30px;border:1px;">����
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">����</td>
                        <td>
                            <select name="job"style="width:200px;height:50px;border:1px;font-size:20px;padding-left: 20px;">
                                <option value="�������̳�" selected>�������̳�
                                <option value="���α׷���">���α׷���
                                <option value="ȸ���">ȸ���
                                <option value="�л�">�л�
                                <option value="��ȭ����">��ȭ����
                                <option value="��������">��������
                            </select>
                        </td>
                    </tr>
                </table>
                <p>                            
                    <input type="button" value="ȸ������" onClick="checkValue()">  
                    <a href = "login.jsp"><input type="button" value="��    ��"></a>
                </p>
            </form>
            </center>
        </div>
    </div>
</body>
</html>
<%@ page contentType="text/html; charset=euc-kr" %>
<%
    session.invalidate();    //  ���Ǽ����� ��ȿȭ��Ŵ
    response.sendRedirect("index.html");     //  <jsp:forward page="index.html"/>�� ������ �ǹ�
%>
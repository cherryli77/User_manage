<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
</head>
<body>
<h1>个人信息</h1>
<table border="1">
    <tr>id： ${user.ucode}</tr><br>
    <tr>用户名：${user.uname}</tr><br>
    <tr>密码：${user.upwd}</tr><br>
    <c:if test="${user.utype==0}">
        <tr style="text-align: center;">身份：普通用户</tr>
    </c:if>
    <c:if test="${user.utype==1}">
        <tr style="text-align: center;">身份：管理员</tr>
    </c:if><br>
    <tr>备注： ${user.umemo}</tr><br>
</table>


</body>
</html>
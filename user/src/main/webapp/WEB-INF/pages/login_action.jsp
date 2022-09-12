<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
</head>
<link href="jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>
<script type="text/javascript" src="jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
    function getUserByCode(ucode){
        window.location.href="${pageContext.request.contextPath}/getUserByCode.do/"+ucode;
    }
    function update(ucode){
        window.location.href='${pageContext.request.contextPath}/update/'+ucode;
    }
    function deleteUser(ucode){
        if (confirm("确定要删除该用户吗？")){
            <%--location.href="${pageContext.request.contextPath}/deleteUserByCode.do/"+ucode;--%>
            $.ajax({
                url:"${pageContext.request.contextPath}/deleteUserByCode.do/"+ucode,
                type:"post",
                success:function (data){
                    if (data=="1"){
                        alert("删除成功")
                        window.location.href='${pageContext.request.contextPath}/getAllUser.do'
                    }else {
                        alert(data)
                    }
                }
            })
        }
    }
</script>
<body>
<h1>信息</h1>
<table border="1">
    <tr>
        <td>id</td>
        <td>用户名</td>
        <td>密码</td>
        <td>类型</td>
        <td>备注</td>
        <td>操作</td>
    </tr><br>
    <c:forEach items="${userList}" var="user">
        <tr>
            <td>${user.ucode}</td>
            <td>${user.uname}</td>
            <td>****</td>
            <c:if test="${user.utype==0}">
                <td style="text-align: center;">普通用户</td>
            </c:if>
            <c:if test="${user.utype==1}">
                <td style="text-align: center;">管理员</td>
            </c:if>
            <td>${user.umemo}</td>
            <td class="text-center">
                <input type="button" value="删除" onclick="deleteUser('${user.ucode}')"/>
                <input type="button" value="修改" onclick="update('${user.ucode}')"/>
                <input type="button" value="添加角色" onclick="window.location.href='${pageContext.request.contextPath}/addUser.do'"/>
                <input type="button" value="查看" onclick="getUserByCode('${user.ucode}')"/>
        </tr><br>
    </c:forEach>
</table>

</body>
</html>
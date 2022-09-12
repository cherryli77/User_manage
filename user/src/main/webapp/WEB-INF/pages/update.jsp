<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
</head>
<link href="/user/jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/user/jquery/jquery-1.11.1-min.js"></script>
<script type="text/javascript" src="/user/jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
    function submitForm(){
        //参数校验
        var loginAct = $("#loginAct").val();
        var loginPwd = $("#loginPwd").val();
        var type = $('input:radio[name="type"]:checked').val();
        if(type=="管理员"){
            var type =1
        }else {
            var type =0
        }
        var memo = $("#memo").val();
        if (loginAct==""){
            alert("请输入用户名！！")
        }
        if (loginPwd==""){
            alert("请输入密码！！！")
        }
        $.ajax({
            url:"${pageContext.request.contextPath}/user/update.do" ,
            type:"post",
            dataType:"json",
            data:{
                ucode:"${user.ucode}",
                uname:loginAct,
                upwd:loginPwd,
                utype:type,
                umemo:memo
            },
            success:function (data){
                if (data=="1"){
                    alert("修改用户成功。")
                    window.location.href = "${pageContext.request.contextPath}/getAllUser.do";
                }else {
                    alert(data);
                }
            }
        })
    }

</script>

<body>
<h1>信息</h1>
<form action="update" method="post">
    <table align="center">
        <tr><td>用户名：</td><td><input type="text" id="loginAct" name="loginAct" value="${user.uname}"></td></tr>
        <tr><td>密码：</td><td><input type="password" id="loginPwd"  name="loginPwd" value="${user.upwd}"></td></tr>
        <tr>
            <td>类型：</td>
            <td>
                <input type="radio" name="type" <c:if test="${user.utype==0}">checked="checked"</c:if> value="普通用户" >普通用户
                <input type="radio" name="type" <c:if test="${user.utype==1}">checked="checked"</c:if> value="管理员">管理员<br>
            </td>
        </tr>
        <tr><td>备注：</td><td><input type="text" id="memo" name="memo" value="${user.umemo}"></td></tr>
        <tr>
            <td><input type="button" value="修改" onclick="submitForm();"></td>
        </tr>
    </table>
</form>
</body>
</html>
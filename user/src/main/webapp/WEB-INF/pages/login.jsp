<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<h1>登录</h1>
	<form action="${pageContext.request.contextPath}/login.do" method="post">
		<input type="text" name="loginAct" placeholder="用户名"><br>
		<input type="password" name="loginPwd" placeholder="密码"><br>
		<input type="submit" value="登录">

	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>

	<head>
		<title>校友登录 - 西北工业大学校友会</title>
		<!-- Custom Theme files -->
		<link href="${pageContext.request.contextPath}/resources/css/login/style.css" rel="stylesheet" type="text/css" media="all" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login/jquery-3.2.1.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script>
			function checkForm() {
				var nametip = checkuserName();
				var passtip = checkPassword();
				return nametip && passtip;
			}

			function checkuserName() {
				var userName = document.getElementById("userName");
				var nameErr = document.getElementById("nameError");
				var patternName = /^\w{3,}$/; //用户名格式正则表达式：用户名要至少三位 

				if(userName.value.length == 0) {
					nameErr.innerHTML = "用户名不能为空";
					nameErr.className = "error";
					return false;
				}
				if(!patternName.test(userName.value)) {
					nameErr.innerHTML = "用户名输入不合规范";
					nameErr.className = "error";
					return false;
				} else {
					$.ajax({
						url: 'user_checkUserName.action',
						// 数据发送方式  
						type: "post",
						// 接受数据格式  
						dataType: "json",
						// 要传递的数据  
						data: {
							userName: $.trim($("#userName").val())
						},
						// 回调函数，接受服务器端返回给客户端的值，即result值  
						success: function(data) { //服务器返回后执行的函数 参数 data保存的就是服务器发送到客户端的数据  
							if(data == "ok") {
								nameErr.innerHTML = "用户名正确";
								nameErr.className = "success";
								return true;
							} else {
								nameErr.innerHTML = "用户名输入错误";
								nameErr.className = "error";
								return false;
							}
						}
					});
				}
			}

			function checkLogin() {
				var userPwd = document.getElementById("userPwd");
				var pwdErr = document.getElementById("pwdError");
				var patternPwd = /^([\w\.\_]|[\u4e00-\u9fa5]){6,24}$/; //密码要在4-8位 
				if(userPwd.value.length == 0) {
					pwdErr.innerHTML = "密码不能为空";
					pwdErr.className = "error";
					return false;
				}
				if(!patternPwd.test(userPwd.value)) {
					pwdErr.innerHTML = "密码输入不合规范";
					pwdErr.className = "error";
					return false;
				} else {
					$.ajax({
						url: 'user_login.action',
						// 数据发送方式  
						type: "post",
						// 接受数据格式  
						dataType: "json",
						// 要传递的数据  
						data: {
							userName: $.trim($("#userName").val()),
							userPwd: $.trim($("#userPwd").val())
						},
						// 回调函数，接受服务器端返回给客户端的值，即result值  
						success: function(data) { //服务器返回后执行的函数 参数 data保存的就是服务器发送到客户端的数据  
							if(data == "ok") {
								window.location.href ='user_index.action'; 
								pwdErr.className = "success";
								return true;
							} else {
								pwdErr.innerHTML = "密码输入错误";
								pwdErr.className = "error";
								return false;
							}
						}
					});
				}
			}
			
		</script>
	</head>

	<style>
		.error {
			color: red;
		}
	</style>

	<body>
		<div class="login">
			<!--<h2>Acced Form</h2>-->
			<div class="login-top">
				<h1>校友登录</h1>
				<form id="userLogin" class="user" onsubmit="return checkForm()" method="post" action="">
					<input id="userName" type="text" name="userName" onblur="checkuserName()" placeholder="请输入用户名">
					<div id="nameError" class="default"></div>
					<input id="userPwd" type="password" name="userPwd" onblur="checkLogin()"  placeholder="请输入密码">
					<div id="pwdError" class="default"></div>
					<div class="forgot">
						<a href="user_forget.action">忘记密码?</a>
						<input type="submit" class="submit" onclick="checkLogin()" value="登录">
					</div>
				</form>
			</div>
			<div class="login-bottom">
				<h3>还没有账号？ &nbsp;<a href="user_insert.action">点击注册</a>  </h3>
			</div>
		</div>
		<div class="copyright">
			<p>Copyright &copy; 2017-12-12.
				<a target="_blank"> </a>
		</div>

	</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>校友会——忘记密码</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.min.js"></script>

		<script type="text/javascript">
			function checkForm() {
				var emailtip = checkEmail();
				var usernames = checkUserNa();
				return emailtip && usernames;
			}

			function checkEmail() {
				var email = document.getElementById("email");
				var emailsErr = document.getElementById("emailErr");
				//验证邮箱的正则表达式
				var patterEmail = /^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;
				if(email.value.length == 0) {
					emailsErr.innerHTML = "邮箱不能为空";
					emailsErr.className = "error";
					return false;
				}
				if(!patterEmail.test(email.value)) {
					emailsErr.innerHTML = "邮箱输入不合规范";
					emailsErr.className = "error";
					return false;
				} else {
					emailsErr.innerHTML = "ok";
					emailsErr.className = "success";
					return true;
				}
			}

			function checkUserNa() {
				var userName = document.getElementById("old-username");
				var nameErr = document.getElementById("old-usernameErr");
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
					nameErr.innerHTML = "ok";
					nameErr.className = "success";
					return true;
				}
			}
		</script>
	</head>
	<style>
		.error{
			color: red;
		}
		.btn-success {
			float: none;
			display: inline-block;
			vertical-align: middle;
		}
	</style>

	<body>
		<div class="panel panel-default">
			<div class="panel-body ">
				<h2 style="color: green;" align="center">校友会————忘记密码</h2><br />
				<h4 style="color: green;" align="center">(密码将会发送至您的邮箱！请注意查收！)</h4><br />

				<form class="form-horizontal" onsubmit="return checkForm()" role="form">
					<fieldset>
						<legend>取回密码</legend>
						<div class="col-md-offset-3">
							<div class="form-group">
								<label class="col-sm-2 control-label">*注册邮箱:</label>
								<div class="col-sm-4">
									<input class="form-control" id="email" name="email" type="email" onblur="checkEmail()" placeholder="请输入邮箱 " />
									<label class="default" id="emailErr"></label>
								</div>
							</div>
							<div class="form-group ">
								<label class="col-sm-2 control-label">*用户名:</label>
								<div class="col-sm-4 ">
									<input class="form-control " id="old-username" name="old-username" type="text" onblur="checkUserNa()" placeholder="请输入用户名 " />
									<label class="default" id="old-usernameErr"></label>
								</div>
							</div>
						</div>
					</fieldset>
					<button type="submit " class="btn btn-success col-md-offset-5 ">确认提交</button>
				</form>
			</div>
		</div>
	</body>

</html>
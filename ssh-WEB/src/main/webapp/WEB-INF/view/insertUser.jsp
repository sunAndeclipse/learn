<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CH">

	<head>
		<meta charset="UTF-8">
		<title>校友会——注册用户</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap/font-awesome.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap/build.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.min.js"></script>
		
		<script type="text/javascript">
			//如果其他方法不满足就阻止表单提交
			function checkForm() {
				var usernames = checkInsertUserName();
				var userPwd = checkInsertUserPwd();
				var agUserPwd = checkAginUserPwd();
				var email = checkInsertEamli();
				var realName = checkInsertRealName();
				var inYear = checkSelectYear();
				return userPwd && usernames && agUserPwd && email && realName && inYear;
			}
			//验证用户名
			function checkInsertUserName(){
				var userName = document.getElementById("insertUserName");
				var nameErr = document.getElementById("insertUserNameErr");
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
				}else{
					nameErr.innerHTML = "ok";
					nameErr.className = "success";
					return true;
				}
			}
			//验证密码
			function checkInsertUserPwd(){
				var userPwd = document.getElementById("insertUserPwd");
				var pwdErr = document.getElementById("insertUserPwdErr");
				//不能含有空格，支持中文、字母、数字、下划线和小数点 
				var patternPwd = /^([\w\.\_]|[\u4e00-\u9fa5]){6,24}$/; 
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
					pwdErr.innerHTML = "OK";
					pwdErr.className = "success";
					return true;
				}
			}
			//验证再次输入密码
			function checkAginUserPwd(){
				var userPwd = document.getElementById("insertUserPwd");
				var agUserPwd = document.getElementById("AginUserPwd");
				var agpwdErr = document.getElementById("AginUserPwdErr");
				if(agUserPwd.value.length == 0) {
					agpwdErr.innerHTML = "请再次输入密码";
					agpwdErr.className = "error";
					return false;
				}
				if(agUserPwd.value != userPwd.value) {
					agpwdErr.innerHTML = "两次密码输入不一致";
					agpwdErr.className = "error";
					return false;
				} else {
					agpwdErr.innerHTML = "OK";
					agpwdErr.className = "success";
					return true;
				}
			}
			//验证email
			function checkInsertEamli(){
				var email = document.getElementById("insertEamli");
				var emailsErr = document.getElementById("insertEamliErr");
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
			//验证真实姓名输入
			function checkInsertRealName(){
				var realName = document.getElementById("insertRealName");
				var realNameErr = document.getElementById("insertRealNameErr");
				if(realName.value.length == 0){
					realNameErr.innerHTML = "请填写信息";
					realNameErr.className = "error";
					return false;
				}else{
					realNameErr.innerHTML = "ok";
					realNameErr.className = "success";
					return true;
				}
			}
			//验证入学年份非空
			function checkSelectYear(){
				var Year = document.getElementById("selectYear");
				var YearErr = document.getElementById("selectYearErr");
				if(Year.value == 0){
					YearErr.innerHTML = "请选择入学年份";
					YearErr.className = "error";
					return false;
				}else{
					YearErr.innerHTML = "ok";
					YearErr.className = "success";
					return true;
				}
			}
			
			function checkCollege(){
				
			}
			
			function checkMajor(){
				
			}
			
			function checkClass(){
				
			}
		
		</script>

	</head>
	<style>
		.error{
			color: red;
		}
		.success{
			color: green;
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
				<h2 style="color: green;" align="center">校友会————社区注册</h2><br />
				<h4 style="color: green;" align="center">完成该注册-你就可以登录校友网啦!</h4><br />

				<form id="insertUser" class="form-horizontal"onsubmit="return checkForm()" role="form">
					<fieldset>
						<legend>账户信息</legend>
						<div class="col-md-offset-3  ">
							<div class="form-group">
								<label class="col-sm-2 control-label">*用户名:</label>
								<div class="col-sm-4">
									<input class="form-control" onblur="checkInsertUserName()" id="insertUserName" name="insertUserName" type="text" placeholder="请输入用户名" />
									<label class="default" id="insertUserNameErr"></label>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">*密码:</label>
								<div class="col-sm-4">
									<input class="form-control" onblur="checkInsertUserPwd()" id="insertUserPwd" name="insertUserPwd" type="password" placeholder="请输入密码(密码至少6位 )" />
									<label class="default" id="insertUserPwdErr"></label>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">*再次输入密码:</label>
								<div class="col-sm-4">
									<input class="form-control" onblur="checkAginUserPwd()" id="AginUserPwd" name="AginUserPwd" type="password" placeholder="再次输入密码" />
									<label class="default" id="AginUserPwdErr"></label>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">*邮箱:</label>
								<div class="col-sm-4">
									<input class="form-control" onblur="checkInsertEamli()" id="insertEamli" name="insertEamli" type="email" placeholder="请输入有效邮箱" />
									<label class="default" id="insertEamliErr"></label>
								</div>
							</div>
						</div>
					</fieldset>
					<fieldset>
						<legend>个人信息</legend>
						<div class="col-md-offset-3  ">
							<!--用户真实姓名-->
							<div class="form-group">
								<label class="col-sm-2 control-label">*真实姓名:</label>
								<div class="col-sm-4">
									<input class="form-control" onblur="checkInsertRealName()" id="insertRealName" name="insertRealName" type="text" placeholder="请填写您的真实姓名" />
									<label class="default" id="insertRealNameErr"></label>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">*性&nbsp;&nbsp;别:</label>&nbsp;&nbsp;&nbsp;
								<div class="radio radio-inline radio-danger">
									<input type="radio" name="radio2" id="radio3" value="option1">
									<label for="radio3"> 男 </label>
								</div>
								<div class="radio radio-inline radio-danger">
									<input type="radio" name="radio2" id="radio4" value="option2" checked>
									<label for="radio4"> 女 </label>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">*入学年份:</label>&nbsp;&nbsp;&nbsp;
								<select class="sele" id="selectYear" onchange="checkSelectYear()">
									<option value="0">==请选择入学年份==</option>
									<option value="1">2010</option>
									<option value="1">2011</option>
									<option value="3">2012</option>
									<option value="4">2013</option>
									<option value="5">2014</option>
									<option value="6">2015</option>
									<option value="7">2016</option>
									<option value="8">2017</option>
								</select>
								<label class="default" id="selectYearErr"></label>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">*学&nbsp;&nbsp;院:</label>&nbsp;&nbsp;&nbsp;
								<select class="select show" id="college">
									<option value="0">==请选择所在学院==</option>
									<option value="1">计算机</option>
									<option value="1">艺术</option>
									<option value="3">自动化</option>
								</select>
								<label class="default" id="collegeErr"></label>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">*专&nbsp;&nbsp;业:</label>&nbsp;&nbsp;&nbsp;
								<select class="select show" id="major">
									<option value="0">==请选择专业==</option>
									<option value="1">计算机</option>
									<option value="1">艺术</option>
									<option value="3">自动化</option>
								</select>
								<label class="default" id="majorErr"></label>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">*班&nbsp;&nbsp;级:</label>&nbsp;&nbsp;&nbsp;
								<select class="select show" id="class">
									<option value="0">==请选择班级==</option>
									<option value="1">1</option>
									<option value="1">2</option>
									<option value="3">3</option>
								</select>
								<label class="default" id="classErr"></label>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">QQ号码:</label>
								<div class="col-sm-4">
									<input class="form-control" id="insertqq" type="text" placeholder="请输入您的QQ号码" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">身份证号码:</label>
								<div class="col-sm-4">
									<input class="form-control" id="insertpeopleNum" type="text" placeholder="请输入您的身份证号码" />
								</div>
							</div>
						</div>
					</fieldset>

					<button type="submit" class="btn  btn-success col-md-offset-5 ">确认提交</button>

				</form>

			</div>
		</div>

	</body>

</html>
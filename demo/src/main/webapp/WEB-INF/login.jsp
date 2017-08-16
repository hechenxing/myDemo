<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
	jQuery(function() {

		//用户名非空验证
		jQuery("#username").blur(
				function() {
					var username = jQuery(this).val();
					if (username == "") {
						jQuery("#usernameSpan").html(
								"<font color='red' >用户名不能为空</font>");
					} else {
						jQuery("#usernameSpan").html("");
					}
				});
		//用户名非空验证
		jQuery("#password").blur(function() {
			var password = jQuery(this).val();
			if (password == "") {
				jQuery("#passwordSpan").html("<font color=red >密码不能为空</font>");
			} else {
				jQuery("#passwordSpan").html("");
			}
		});

		//登录操作
		jQuery("#submit")
				.bind(
						"click",
						function() {
							var username = jQuery("#username").val();
							var password = jQuery("#password").val();
							jQuery
									.ajax({
										url : "${pageContext.request.contextPath}/user/userLoginAjax.action",
										data : {
											"username" : username,
											"password" : password
										},
										type : "post",
										success : function(msg) {
											var code = msg.code;
											if (code == "0") {
												//登录失败
												alert(msg.msg);
											} else {
												window.location.href = "${pageContext.request.contextPath}/page.action?url=success";
											}
										},
										dataType:"json"
									});

						});
	});
</script>
</head>
<body>

	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="jumbotron">
					<h1>Hello, world!</h1>
					<p></p>
					<p>
						<a class="btn btn-primary btn-large" href="#">Learn more</a>
					</p>
				</div>
				<div class="row clearfix">
					<div class="col-md-8 column">
						


					</div>
					<div class="col-md-4 column">
					
					<form role="form"
							action="${pageContext.request.contextPath}/user/userLogin.action"
							method="post">
							<div class="form-group">
								<label for="name">用户名</label> <input type="text"
									class="form-control" id="username" name="username" width="100"
									placeholder="请输入用户名"><span id="usernameSpan"></span>
							</div>
							<div class="form-group">
								<label for="inputfile">密 码</label> <input type="text"
									class="form-control" id="password" name="password" width="100"
									placeholder="请输入密码"><span id="passwordSpan"></span>
							</div>
							<div>
								<font color=red>${msg }</font>
							</div>
							<button type="button" id="submit" class="btn btn-default">登录</button>
						</form>
					
					</div>
				</div>
			</div>
		</div>
		<div class="row clearfix">
			<div class="col-md-12 column"></div>
		</div>
	</div>

</body>
</html>
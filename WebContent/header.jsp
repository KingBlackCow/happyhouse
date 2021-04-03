<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>HappyHouse</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./css/login.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link href="./css/header.css" rel="stylesheet">


<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
<link href="vendor/simple-line-icons/css/simple-line-icons.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">
<!-- Custom styles for this template -->
<link href="css/landing-page.min.css" rel="stylesheet">
</head>
<body>
	<!-- Navigation -->
	<div class="header fixed-top headernav shadow">
		<nav class="navbar navbar-light bg-light static-top">
			<div class="container">
				<a class="navbar-brand logo" href="${root}"> <i
					class="fa fa-home pr-2"></i>Happy House
				</a>
				<div class="btn-zone">
					<c:if test="${userinfo == null}">
						<div class="btn-group">
							<a class="btn btn-sm btn-primary mr-2 navBtn" id="nav-signupBtn"
								href="${root}/main.do?act=mvjoin"> <i class="fa fa-user pr-2"></i>Sign
								Up
							</a>
						</div>
						<div class="btn-group">
							<a class="btn btn-sm btn-primary navBtn" id="nav-loginBtn"
								href="${root}"> <i class="fa fa-lock pr-2"></i>Login
							</a>
						</div>
					</c:if>

					<c:if test="${userinfo != null}">
						<strong>${userinfo.username}</strong>님 환영합니다.

						<div class="btn-group">
							<a class="btn btn-sm btn-primary navBtn" id="nav-logoutBtn"
								href="${root}/main.do?act=logout"> <i
								class="fa fa-unlock pr-2"></i>Logout
							</a>
						</div>
						<div class="btn-group">
							<a class="btn btn-sm btn-primary mr-2 navBtn" id="nav-meminfoBtn"
								href="${root}/main.do?act=mvModify&id=${userinfo.userid}"> <i class="fa fa-user pr-2"></i>회원정보수정
							</a>
						</div>
					</c:if>

				</div>
			</div>
		</nav>
	</div>

</body>
</html>
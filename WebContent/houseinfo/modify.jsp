<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:if test="${userinfo == null}">
	<c:redirect url="/main.do" />
</c:if>
<c:if test="${userinfo != null}">
	<!DOCTYPE html>
	<html lang="ko">
<head>
<title>HappyHouse|회원 정보 수정</title>
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
<link rel="stylesheet" href="./css/happyhouse.css" />
<script type="text/javascript">
	function writeArticle() {
		if (document.getElementById("password").value == "") {
			alert("바뀐비밀번호입력");
			return;
		} else {

			document.getElementById("writeform").action = "${root}/main.do";
			document.getElementById("writeform").submit();
		}
	}

	function cancelModify() {
		history.back();
	}

	function deleteMem() {
		document.getElementById("deleteForm").action = "${root}/main.do";
		document.getElementById("deleteForm").submit();
	}
</script>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<!-- Masthead -->
	<header class="masthead text-white text-center houseImg">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-9 mx-auto">
					<h1 class="mb-5 main-title">HAPPY HOUSE</h1>
					<hr class="main-hr">
				</div>
			</div>
		</div>
		<div class="container" align="center">
			<div class="col-lg-6 modifyBoxBg" align="center">
				<h2 class="mt-4">비밀번호변경</h2>
				<form id="writeform" method="post" action="">
					<input type="hidden" name="act" id="act" value="modify"> <input
						type="hidden" class="form-control" id="userid" name="userid"
						value="${member.userid}">
					<div class="form-group" align="left">
						<label for="password">비밀번호변경: </label> <input type="text"
							class="form-control" id="password" name="password"
							value="${member.userpwd}">


					</div>
					<button type="button" class="btn btn-info"
						onclick="javascript:writeArticle();">수정</button>
					<button type="button" class="btn btn-light"
						onclick="javascript:cancelModify();">취소</button>

				</form>
				<form id="deleteForm" method="post" action="">
					<input type="hidden" name="act" id="act" value="deleteMem"> <input
						type="hidden" class="form-control" id="userid" name="userid"
						value="${member.userid}">
					<button type="button" class="btn btn-secondary"
						onclick="javascript:deleteMem();">탈퇴</button>

				</form>
			</div>
		</div>
	</header>
</body>
	</html>
</c:if>
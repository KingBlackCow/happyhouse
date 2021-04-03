<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>HappyHouse|회원가입</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/happyhouse.css"/>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script type="text/javascript">
$(document).ready(function() {
	$("#searchBtn").click(function() {
		
		if($("#username").val() == "") {
			alert("이름 입력!!!");
			return;
		} else if($("#userid").val() == "") {
			alert("아이디 입력!!!");
			return;
		} else {
			document.getElementById("memberform").action = "${root}/main.do?act=searchPW";
			document.getElementById("memberform").submit();
		}
	});
	 
	$('#zipcode').focusin(function() {
		$('#zipModal').modal();
	});
	
});

function moveJoin() {
	document.location.href = "${root}";
}	
</script>
</head>
<body>
<%@ include file="/header.jsp"%>
	<header class="masthead text-white text-center join_houseImg">
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
<div class="col">
	<div class="col-lg-6 joinBoxBg" align="center">
		<form id="memberform" method="post" action="">
		<h1>비밀번호찾기</h1>
		<input type="hidden" name="act" id="act" value="">
			<div>
				<p>비밀번호는<br><strong>[ ${pw} ]</strong><br>입니다.</p>
			</div>
			<div class="form-group" align="center">
				<button type="button" class="btn btn-secondary" onclick="javascript:moveJoin();">홈으로</button>
			</div>
		</form>
	</div>
</div>
</div>

</header>
</body>
</html>
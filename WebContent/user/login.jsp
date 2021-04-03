<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<c:if test="${cookie.ssafy_id.value ne null}">
	<c:set var="saveid" value="${cookie.ssafy_id.value}" />
	<c:set var="idck" value=" checked=\"checked\"" />
</c:if>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>HappyHouse|로그인</title>
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
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">


<script type="text/javascript">

	function searchPW() {
	
		document.location.href = "${root}/main.do?act=searchPW";
		
	}

	function login() {
		if (document.getElementById("userid").value == "") {
			alert("아이디 입력!!!");
			return;
		} else if (document.getElementById("userpwd").value == "") {
			alert("비밀번호 입력!!!");
			return;
		} else {
			document.getElementById("loginform").action = "${root}/main.do";
			document.getElementById("loginform").submit();
			document.location.href = "${root}/main.do?act=mvjoin";
		}
	}

	function moveJoin() {
		document.location.href = "${root}/main.do?act=mvjoin";
	}

	function findPwd() {
		document.location.href = "${root}/main.do?act=mvsearchPW";
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
			<div class="col-lg-6 loginBoxBg" align="center">
				<h3 class="pt-4 pb-2">로그인</h3>
				<div class="inputForm">
					<form id="loginform" method="post" action="">
						<input type="hidden" name="act" id="act" value="login">
						<div class="form-group" align="left">
							<label for="">아이디</label> <input type="text" class="form-control"
								id="userid" name="userid" placeholder="" value="${saveid}">
						</div>
						<div class="form-group" align="left">
							<label for="">비밀번호</label> <input type="password"
								class="form-control" id="userpwd" name="userpwd" placeholder=""
								onkeydown="javascript:if(event.keyCode == 13) {login();}">
						</div>
						<div class="form-group form-check" align="right">
							<label class="form-check-label"> <input
								class="form-check-input" type="checkbox" id="idsave"
								name="idsave" value="saveok" ${idck}> 아이디저장
							</label>
						</div>
						<div class="form-group" align="center">
							<button type="button" class="btn btn-info"
								onclick="javascript:login();">로그인</button>
							<button type="button" class="btn btn-primary"
								onclick="javascript:moveJoin();">회원가입</button>
							<button type="button" class="btn btn-primary"
								onclick="javascript:findPwd();">비밀번호찾기</button>
						</div>
						<div>
							<c:if test="${userinfo == null}">
								<div class="msg">
									<Strong>${msg}</Strong>
								</div>
							</c:if>
						</div>
					</form>
				</div>
			</div>
		</div>
	</header>
	<%-- <div id="findModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header text-center">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body text-center">
				<form id="zip_codeForm">
						<div align="center">
							<h3>비밀번호 찾기</h3>
						</div>
						<div class="input-group" align="left">
							<input type="text" class="form-control" id="userid" name="userid"
								placeholder="가입한 id"> <input type="text"
								class="form-control" id="username" name="username"
								placeholder="이름"> <span class="input-group-btn">
								<button type="button" class="btn btn-primary"  id="act" value="searchPW" onclick="javascript:searchPW();"></button>
								<button type="button" class="btn btn-primary"
								onclick="javascript:findPwd();">비밀번호찾기</button>
						</span>
					</div>
                </form>
                <div class="pwdZone">
                	<p>비밀번호는<br><strong>[ ${pw} ]</strong><br>입니다.</p>
                </div>
            </div>
        </div>
    </div> 
	</div>--%>
</body>
</html>

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
			
			/* $("#memberform").attr("join", "${root}/main.do?act=join").submit();
			${root}/main.do?act=mvmodify */
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
<!-- Masthead -->
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
			<div class="form-group" align="left">
				
				<label for="name">이름</label>
				<input type="text" class="form-control" id="username" name="username" placeholder="">
			</div>
			<div class="form-group" align="left">
				<label for="">아이디</label>
				<input type="text" class="form-control" id="userid" name="userid" placeholder="">
			</div>
			
			<div class="form-group" align="center">
				<button type="button" class="btn btn-info" id="searchBtn">찾기</button>
				<button type="reset" class="btn btn-light">초기화</button>
				<button type="button" class="btn btn-secondary" onclick="javascript:moveJoin();">뒤로가기</button>
			</div>
			<div>
				<p>비밀번호는<br><strong>[ ${pw} ]</strong><br>입니다.</p>
			</div>
		</form>
	</div>
</div>
</div>
<div id="zipModal" class="modal fade" role="dialog">
<h5 class="modal-title" id="myModalLabel">우편번호검색</h5>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header text-center">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>    
            <div class="modal-body text-center">
            	<form id = "zip_codeForm">
            		<div align="center">
            			<label>도로명 주소검색</label>
            		</div>
					<div class="input-group" align="left">
						<input type="text" class="form-control" id="doro" name="doro" placeholder="검색 할 도로명 입력(예: 대왕판교로, 학하서로)">
						<span class="input-group-btn">
						<input type="submit" class="btn btn-warning" value="검색" id="searchBtn">
						</span>
					</div>
                </form>
                <div style="width:100%; height:200px; overflow:auto">
                	<table class = "table text-center">
                		<thead>
                		<tr>
                			<th style="width:150px;">우편번호</th>
                			<th style="width:600px;">주소</th>
                		</tr>
                		</thead>
                		<tbody id="zip_codeList"></tbody>
                	</table>
                </div>
            </div>
        </div>
    </div>
</div>
</header>
</body>
</html>
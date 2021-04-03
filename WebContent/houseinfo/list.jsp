<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html lang="ko">
<head>
<title>HappyHouse|실거래가 검색</title>
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
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9bf0d7936418891b021d9471ec64035f"></script>
<script src="./js/kakaomap.js"></script>
<script type="text/javascript">
	function movewrite() {
		location.href = "${root}/main.do?act=mvlogin";
	}
	function searchApart() {
		if (document.getElementById("word").value == "") {
			alert("모든 목록 조회!!");
		}
		document.getElementById("searchform").action = "${root}/main.do";
		document.getElementById("searchform").submit();
	}
	function searchall() {
		location.href = "${root}/main.do?act=list&key=&word=";
	}
</script>
</head>
<body>
	<div class="container-fluid list_houseImg" align="center">

		<div class="container">
			<%@ include file="/header.jsp"%>
		</div>
		<div class="col" align="center">
			<div class="col-8 listcontent col-pb-90px" align="center">
				<div class="tlteinfo">
					<h1>아파트 실거래가 검색</h1>
					<h5>동 별, 이름 별 아파트 정보를 찾아볼 수 있습니다.</h5>
				</div>

			</div>
		</div>
	</div>
	<div class="col" align="center">
		<div class="col-8" align="center">
			<form id="searchform" method="get" class="form-inline" action="">
				<input type="hidden" name="act" id="act" value="list">
				<table class="table table-borderless">
					<tr>
						<td align="right"><select class="form-control" name="key"
							id="key">
								<option value="dong" selected="selected">동별실거래가</option>
								<option value="aptName">아파트이름별로실거래가</option>

						</select> <input type="text" class="form-control" placeholder="검색어 입력."
							name="word" id="word">
							<button type="button" class="btn btn-primary"
								onclick="javascript:searchApart();">검색</button>
								<button type="button" class="btn btn-primary"
								onclick="javascript:searchall();">초기화</button>
							</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="container col-3 listml float-left">
		<div class="scrolltable">
			<c:if test="${aparts.size() != 0}">
				<c:forEach var="apart" items="${aparts}" begin="0" end="1000">
					<table class="table">
						<tbody>
							<%--  <tr class="table-info">
	        <td>작성자 : ${apart.userid}</td>
	        <td align="right">작성일 : ${apart.regtime}</td>
	      </tr> --%>
							<tr>
								<th colspan="2"><strong>${apart.no}.${apart.dong}</strong></th>
							</tr>
							<tr>
								<td colspan="2"><i class="far fa-building"></i>
									${apart.aptName}<br> <i class="fas fa-comment-dollar"></i>
									${apart.dealAmount}</td>
							</tr>
							<%--<c:if test="${userinfo.userid == apart.userid}">
	       <tr>
	        <td colspan="2">
			<a href="${root}/main.do?act=mvmodify&articleno=${apart.articleno}">수정</a>
			<a href="${root}/main.do?act=delete&articleno=${apart.articleno}">삭제</a>
			</td>
	      </tr> 
	      </c:if>--%>
						</tbody>
					</table>
				</c:forEach>
			</c:if>
		</div>
	</div>
	<div class="col-8 mr-4 float-right">
		<div class="container mt-4 mb-4" align="center">
			<div id="map" class="listmap"></div>
		</div>
	</div>
	<c:if test="${aparts.size() == 0}">
		<table class="table table-active">
			<tbody>
				<tr class="table-info" align="center">
					<td>작성된 글이 없습니다.</td>
				</tr>
			</tbody>
		</table>
	</c:if>

</body>
</html>

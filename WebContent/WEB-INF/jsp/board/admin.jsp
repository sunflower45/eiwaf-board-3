<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
	if("${sessionScope.memberId}" != "admin"){
		alert("관리자 외에 접근이 불가합니다.");
		location.href="/main.do";
		return false;
	}
	
})
</script>
<title>회원 관리</title>
</head>
<body style="position:absolute;top:50%;left:50%;transform:translate(-50%, -50%)">
<jsp:include page="../main/menu.jsp" ></jsp:include>
<h2 style="margin-left:300px">회원 목록</h2>
<input style="margin-left:30px;margin-bottom:10px" type="button" class="btn btn-success" value="회원등록" onclick="location.href='${path}/member/adminWrite.do'">

<table class='table' style="margin-left:20px;width:800px" >
	<tr class="success" >
		<th>아이디</th>
		<th>이름</th>
		<th>이메일</th>
		<th>회원가입일자</th>
		<th>관리</th>
	</tr>
	<c:forEach var="row" items="${list}">
	<c:if test="${row.memberId != 'admin'}">
	<tr>
		<td ><c:out value="${row.memberId}"></c:out></td>
		<td><c:out value="${row.memberName}"></c:out></td>
		<td><c:out value="${row.memberEmail}"></c:out></td>
		<td><c:out value="${row.memberRegdate}"></c:out></td>
		<td>
			<form name="form1" id="form1" method="post" action="${path}/member/view.do?memberId=${row.memberId}">
			<button type="submit" style="width:55px;height:30px" class="btn btn-default" id="btnUpdate">수정</button>
			</form>
		</td>
	</tr>
	</c:if>
	</c:forEach>
</table>
</body>
</html>
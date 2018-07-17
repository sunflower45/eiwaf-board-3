<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.min.js"></script>

<title>회원 등록</title>
</head>
<body style="position:absolute;top:50%;left:50%;transform:translate(-50%, -50%)">
<jsp:include page="../main/menu.jsp" ></jsp:include>
<h2 style="margin-left:190px">회원 등록</h2>
<form name="form1" method="post" action="${path}/member/insert.do">
<table class="table" style="margin-left:20px;width:500px">
	<tr>
		<td>아이디</td>
		<td><input name="memberId"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="memberPw"></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input name="memberName"></td>
	</tr>
	<tr>
		<td>이메일 주소</td>
		<td><input  name="memberEmail"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="확인">
			<input type="reset" value="취소">
			<input type="button" value="목록" onclick="location.href='${path}/member/admin.do'">
		</td>
	</tr>
</table>
</form>
</body>
</html>
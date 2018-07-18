<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/js/sha1.min.js"></script>

<script type="text/javascript" src="/js/jquery/jquery-1.7.2.min.js" charset="utf-8"></script>
<script type="text/javascript" src="/js/eiwaf/eiwaf-1.0.0.js" charset="utf-8"></script>
<script type="text/javascript" src="/js/util.comn.js" charset="utf-8"></script>
<script type="text/javascript" src="/js/sample.comn.js" charset="utf-8"></script>
<script type="text/javascript" src="/js/sample.menu.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>

$(document).ready(function(){
	$("#btnUpdate").click(function(){
		console.log("btnUpdate");
		if($("#memberPw").val() == "" || $("#memberPw").val() == null){
			alert("비밀번호 입력은 필수 사항입니다.");
			return false;
		}
		if($("#memberName").val() == "" || $("#memberName").val() == null){
			alert("이름 입력은 필수 사항입니다.");
			return false;
		}
		if($("#memberEmail").val() == "" || $("#memberEmail").val() == null){
			alert("이메일 주소 입력은 필수 사항입니다.");
			return false;
		}
		var pattern=/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		if(pattern.test($("#memberEmail").val()) == false ){
			alert("잘못된 이메일 형식입니다.");
			return false;
		}
		document.getElementById("memberPw").value = b64_sha1($("#memberPw").val());

		document.form1.action="/member/userUpdate.do";
		document.form1.submit();
		alert("수정되었습니다.");
	})
});

$(document).ready(function(){
	
	$("#toList").click(function(){
		location.href="${path}/board/list.do";
	})
	
})

$(document).ready(function() {
    $('#memberPw').on('keyup', function() {
        if($(this).val().length > 50) {
            $(this).val($(this).val().substring(0, 50));
        }
    });
});
$(document).ready(function() {
    $('#memberName').on('keyup', function() {
        if($(this).val().length > 10) {
            $(this).val($(this).val().substring(0, 10));
        }
    });
});
$(document).ready(function() {
    $('#memberEmail').on('keyup', function() {
        if($(this).val().length > 100) {
            $(this).val($(this).val().substring(0, 100));
        }
    });
});
</script>
<title>회원 정보 수정</title>
</head >
<body style="position:absolute;top:50%;left:50%;transform:translate(-50%, -50%)">
<jsp:include page="../main/menu.jsp" ></jsp:include>
<h2 style="margin-left:150px">회원 정보 수정</h2>
<form name="form1" method="post">
	<table class="table" style="width:500px">
		<tr>
			<td>아이디</td>
			<td>
				<input type="hidden" id="memberId" name="memberId" value="${dto.memberId}">
				<c:out value="${dto.memberId}"></c:out>
			</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" class='form-control' id="memberPw" name="memberPw"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input name="memberName" class='form-control' id="memberName" value="${dto.memberName }"></td>
		</tr>
		<tr>
			<td>이메일 주소</td>
			<td><input name="memberEmail" class='form-control' id="memberEmail" value="${dto.memberEmail}"></td>
		</tr>
		<tr>
			<td>회원가입일자</td>
			<td>
				<input type="hidden" id="memberRegdate" value="${dto.memberRegdate}">
				<c:out value="${dto.memberRegdate}"></c:out>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit"  id="btnUpdate" class="btn btn-success">수정</button>
				<button type="button" id="toList" class="btn btn-success">목록으로</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>
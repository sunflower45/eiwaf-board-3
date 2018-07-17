<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원정보 찾기</title>
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
var memberId;
$(document).on('click', '#toLogin', function(){
	location.href = "${path}/main.do";
})
$(document).on('click','#findId',function(){
	var pattern=/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	if(pattern.test($("#memberEmail").val())==false){
		alert("이메일 형식이 틀립니다.");
		return false;
	}
	
	var f = document.form1;
	var result = svcf_Ajax("/member/findId.do", f, {
		async : false,
		procType: "R"
	});
	svcf_SyncCallbackFn(result, idFindActionCallback);
	$("#memberName").val("");
	$("#memberEmail").val("");
});
function idFindActionCallback(status, data){
	if(data.memberId == null || data.memberId == ""){
		alert('회원님의 가입 이력이 없습니다.')
	}else {
	alert("회원님의 정보로 등록된 아이디는  "+data.memberId+" 입니다.");
	}
}
$(document).on('click','#findPw',function(){
	var pattern = /[^(a-zA-Z0-9)]/;
	var memberId = $("#memberId").val();
	
	if(pattern.test(memberId)){
		alert("아이디는 영문만 허용합니다.");
		return false;
	} 
	
	var f = document.form2;
	
	var result = svcf_Ajax("/member/findPw.do", f, {
		async:false,
		procType : "R"
	})
	svcf_SyncCallbackFn(result, pwFindActionCallback);
	
	$("#memberName").val("");
	$("#memberId").val("");
});
function pwFindActionCallback(status, data){
	if(data.memberPw){
		alert("인증되었습니다.");
		validation = true;
		location.href = "/member/pwUpdate.do";
	} else {
		alert('해당되는 비밀번호가 없습니다.');
	}
}
$(document).ready(function() {
    $('#memberName1').on('keyup', function() {
        if($(this).val().length > 10) {
            $(this).val($(this).val().substring(0, 10));
        }
    });
});
$(document).ready(function() {
    $('#memberName2').on('keyup', function() {
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
$(document).ready(function() {
    $('#memberId').on('keyup', function() {
        if($(this).val().length > 30) {
            $(this).val($(this).val().substring(0, 30));
        }
    });
});
</script>
</head>
<body style="background-image:url('/img/background2.JPG');background-size:cover;position:absolute;top:50%;left:50%;transform:translate(-50%, -50%)">
<h1 style="margin-left:50px;color:white;">회원정보 찾기</h1>

<form id="form1" name="form1" method="post">
	<table style="width:400px" class="table">
		<tr>
			<td><strong style="color:white;">이름</strong></td>
			<td><input class="form-control" type="text" id="memberName1" name="memberName"></td>
		</tr>
		
		<tr>
			<td><strong style="color:white;">이메일</strong></td>
			<td><input class="form-control"  type="text" id="memberEmail" name="memberEmail"></td>
		</tr>
		<tr>
			<td><input type="button" class="btn btn-default" id="findId" value="아이디 찾기">
			</td>
			<td></td>
		</tr>
	</table>
	
</form>

<form id="form2" name="form2" method="post">
	
<br><br><br>
	<table style="width:400px" class="table">
		<tr>
			<td><strong style="color:white;">이름</strong></td>
			<td><input class="form-control"  type="text" id="memberName2" name="memberName"></td>
		</tr>
		
		<tr>
			<td><strong style="color:white;">아이디</strong></td>
			<td><input class="form-control"  type="text" id="memberId" name="memberId"></td>
		</tr>
		<tr>
			<td><input type="button"  class="btn btn-default" id="findPw" value="비밀번호 인증">
			
			</td>
			<td></td>
		</tr>
	</table>
</form>
<input style="margin-left:150px" type="button"  class="btn btn-default" id="toLogin" value="로그인 화면">
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	if("${sessionScope.memberId}" != "admin"){
		alert("관리자 외에 접근이 불가합니다.");
		location.href="/main.do";
		return false;
	}
	
})
$(document).ready(function() {
    $('#memberId').on('keyup', function() {
        if($(this).val().length > 30) {
            $(this).val($(this).val().substring(0, 30));
        }
    });
});
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
$(document).ready(function(){
	$("#toList").click(function(){
		location.href = "/member/admin.do";
	})
})
$(document).ready(function(){
	$("#btnUpdate").click(function(){
		if($("#memberId").val() == ""){
			alert("비밀번호 입력은 필수 사항입니다.");
			return false;
		}
		if($("#memberPw").val() == ""){
			alert("비밀번호 입력은 필수 사항입니다.");
			return false;
		}
		if($("#memberName").val() == ""){
			alert("이름 입력은 필수 사항입니다.");
			return false;
		}
		if($("#memberEmail").val() == ""){
			alert("이메일 주소 입력은 필수 사항입니다.");
			return false;
		}
		var pattern=/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		if(pattern.test($("#memberEmail").val()) == false ){
			alert("잘못된 이메일 형식입니다.");
			return false;
		}
	  	var f = document.form1;
    	var result = svcf_Ajax("/member/idCheck.do", f, {
    		async : false,
    		procType : "R"
    	});
    	
    	svcf_SyncCallbackFn(result, chkIdCallback);		
    	
		document.form1.action="${path}/member/admin.do";
		document.form1.submit();
	})
})

function chkIdCallback(status, data){
	
	var pattern = /[^(a-zA-Z0-9)]/;
	
	if(data.cnt =="1"){
		alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
		id_validate = false;
		$("#memberId").focus();
	} else {
		if(pattern.test(data.memberId)){
			alert("아이디는 영문만 허용합니다.");
			id_validate = false;
			return false;
		} else{
			id_validate = true;
			alert("사용 가능한 아이디입니다.");
			$("#memberPw").focus();
		}
	}
}
</script>
<title>회원 등록</title>
</head>
<body style="position:absolute;top:50%;left:50%;transform:translate(-50%, -50%)">
<jsp:include page="../main/menu.jsp" ></jsp:include>
<h2 style="margin-left:190px">회원 등록</h2>
<form name="form1" method="post" action="${path}/member/insert.do">
<table class="table" style="margin-left:20px;width:500px">
	<tr>
		<td>아이디</td>
		<td><input name="memberId" id="memberId" class="form-control"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" id="memberPw" name="memberPw" class="form-control"></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input name="memberName" id="memberName" class="form-control"></td>
	</tr>
	<tr>
		<td>이메일 주소</td>
		<td><input  name="memberEmail" id="memberEmail" class="form-control"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" class="btn btn-success" id="btnUpdate" value="확인">
			<input type="reset" class="btn btn-success" value="취소">
			<input type="button" class="btn btn-success" id="toList" value="목록" >
		</td>
	</tr>
</table>
</form>
</body>
</html>
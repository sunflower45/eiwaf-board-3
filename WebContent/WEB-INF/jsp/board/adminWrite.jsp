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
// 관리자 외에 세션이 접근하려고 할 떄 막음
$(document).ready(function(){
	if("${sessionScope.memberId}" != "admin"){
		alert("관리자 외에 접근이 불가합니다.");
		location.href="/main.do";
		return false;
	}
	
})

// ID가 30자 넘을 때 막음
$(document).ready(function() {
    $('#memberId').on('keyup', function() {
        if($(this).val().length > 30) {
            $(this).val($(this).val().substring(0, 30));
        }
    });
    $('#memberPw').on('keyup', function() {
        if($(this).val().length > 50) {
            $(this).val($(this).val().substring(0, 50));
        }
    });  
 	// 이름 10자 이상일때 막음
    $('#memberName').on('keyup', function() {
        if($(this).val().length > 10) {
            $(this).val($(this).val().substring(0, 10));
        }
    });
 	
 	// 이메일 100자 이상일 떄 막음
    $('#memberEmail').on('keyup', function() {
        if($(this).val().length > 100) {
            $(this).val($(this).val().substring(0, 100));
        }
    });
});





// 목록으로 버튼 
$(document).ready(function(){
	$("#toList").click(function(){
		location.href = "/member/admin.do";
	})
})

// submit 버튼 클릭시 (update button)
$(document).ready(function(){
	$("#btnUpdate").click(function(){
		// 비밀번호, 이름, 이메일주소 등 필수 입력사항
		if($("#memberId").val() == ""|| $("#memberId").val() == null){
			alert("비밀번호 입력은 필수 사항입니다.");
			return false;
		}
		if($("#memberPw").val() == ""|| $("#memberPw").val() == null){
			alert("비밀번호 입력은 필수 사항입니다.");
			return false;
		}
		if($("#memberName").val() == ""|| $("#memberName").val() == null){
			alert("이름 입력은 필수 사항입니다.");
			return false;
		}
		if($("#memberEmail").val() == ""|| $("#memberEmail").val() == null){
			alert("이메일 주소 입력은 필수 사항입니다.");
			return false;
		}
		var pattern=/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		if(pattern.test($("#memberEmail").val()) == false ){
			alert("잘못된 이메일 형식입니다.");
			return false;
		}
		
		// 비밀번호 암호화해서 넘어감
		document.getElementById("memberPw").value = b64_sha1($("#memberPw").val());

		// eiwaf_ajax로 회원등록
	  	var f = document.form1;
    	var result = svcf_Ajax("/member/insert.do", f, {
    		async : false,
    		procType : "R"
    	});
    	
    	svcf_SyncCallbackFn(result, chkIdCallback);		
    	
		location.href="${path}/member/admin.do";
	})
})

function chkIdCallback(status, data){
	
	var pattern = /[^(a-zA-Z0-9)]/;
	// 아이디 중복검사
	if(data.cnt =="1"){
		alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
		id_validate = false;
		$("#memberId").focus();
	} else {
		// 아이디 한글 검사
		if(pattern.test(data.memberId)){
			alert("아이디는 영문만 허용합니다.");
			id_validate = false;
			return false;
		} else if (data.memberId==""||data.memberId==null){
			alert("아이디는 공백이 허용되지 않습니다.");
		} else{
			id_validate = true;
			alert("가입이 완료되었습니다.");
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
<form name="form1" method="post" >
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
			<input type="button" class="btn btn-success" id="btnUpdate" value="확인">
			<input type="reset" class="btn btn-success" value="취소">
			<input type="button" class="btn btn-success" id="toList" value="목록" >
		</td>
	</tr>
</table>
</form>
</body>
</html>
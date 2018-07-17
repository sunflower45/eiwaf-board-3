<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/view/layout/taglib-include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입</title>
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

<script type="text/javascript">
var id_validate = true;
var pw_validate = true;
var email_validate = true;
$(document).on('click', '#toLogin', function(){
	location.href = "${path}/main.do";
});
$(document).ready(function () {
	//[1] lblError 레이어 클리어
    $('#memberPw').keyup(function () {
        // $('#lblError').remove(); // 제거
        $('#lblError').text(''); // 클리어
    });
    //[2] 암호 확인 기능 구현
    $('#memberPwCheck').keyup(function () {
    	$('#lblError').text('');
    	if ($('#memberPw').val() != $('#memberPwCheck').val()) {
            $('#lblError').text(''); // 클리어
            $('#lblError').html("<b>암호가 틀립니다.</b>"); // 레이어에 HTML 출력
            pw_validate = false;
        }
        else {
            $('#lblError').text(''); // 클리어
            $('#lblError').html("<b>암호가 맞습니다.</b>"); // 레이어에 텍스트 출력
            pw_validate = true;
            
        }
    });
});
$(document).on('click', '#idCheck', function(){
	  	var f = document.form1;
    	var result = svcf_Ajax("/member/idCheck.do", f, {
    		async : false,
    		procType : "R"
    	});
    	
    	svcf_SyncCallbackFn(result, chkIdCallback);		
	
});
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
$(document).on('click', '#submitBtn', function(){
	if($("#memberId").val() == ''){
		alert('아이디는 필수 입력 사항입니다.');
		return false;
	}
	if($("#memberPw").val() == ''){
		alert('비밀번호는 필수 입력 사항입니다.');
		return false;
	}
	if($("#memberPwCheck").val() == ''){
		alert('비밀번호확인은 필수 입력 사항입니다.');
		return false;
	}
	if($("#memberName").val() == ''){
		alert('이름은 필수 입력 사항입니다.');
		return false;
	}
	if($("#memberEmail").val() == ''){
		alert('이메일은 필수 입력 사항입니다.');
		return false;
	}
	var pattern=/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	if(pattern.test($("#memberEmail").val()) == false ){
		alert("잘못된 이메일 형식입니다.");
		return false;
	}
	if(pw_validate == false){
		alert("비밀번호를 제대로 입력해주세요");
		return false;
	} else if(id_validate == false) {
		alert("아이디를 제대로 입력해주세요");
		return false;
	}else {
		document.getElementById("memberPw").value = b64_sha1($("#memberPw").val());
		var f = document.form1;
		var result = svcf_Ajax("/member/joinUpdate.do", f, {
			
			async : false,
			procType : "R"
		});
		svcf_SyncCallbackFn(result, joinUpdateCallback);
	}
});
function joinUpdateCallback(status, data){
	alert("가입이 완료되었습니다.");
	location.href="/main.do";
}
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
    $('#memberPwCheck').on('keyup', function() {
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
</head>
<body style="background-image:url('/img/background2.JPG');background-size:cover;position:absolute;top:50%;left:50%;transform:translate(-50%, -50%)">
<h1 style="margin-left:10px;color:white;">회원가입 페이지</h1>
  <form id="form1" name="form1"  method="post">
	<table class="table" style="margin-left:10px;width:800px;">
		<tr>
			<td><strong style="color:white">아이디(*)</strong></td>
			<td><input class="form-control" type="text" id="memberId" name="memberId">
			<button id="idCheck"class="btn btn-default" style="margin-top:10px;" type="button">아이디 중복 검사</button>
			</td>
			
		</tr>
		<tr>
			<td><strong style="color:white">비밀번호(*)</strong></td>
			<td><input  class="form-control"  type="password"  id="memberPw" name="memberPw"></td>
		</tr>
		
		<tr>
			<td><strong style="color:white">비밀번호 확인(*) &nbsp;</strong></td>
			<td><input  class="form-control"  type="password" id="memberPwCheck" name="memberPwCheck">
			<div style="margin-top:10px" id="lblError">
				
			</div>
			</td>
			
		</tr>
		<tr>
			<td><strong style="color:white">이름(*)</strong></td>
			<td><input class="form-control"  type="text"  id="memberName" name="memberName"></td>
		</tr>
		<tr>
			<td><strong style="color:white">이메일(*)</strong></td>
			<td><input class="form-control"  type="text" name="memberEmail" id="memberEmail"></td>
			
		</tr>
		
		<tr>
			<td colspan="2" align="center"><button class="btn btn-default" type="button" id="submitBtn" >가입하기</button>&nbsp;&nbsp;&nbsp;
			<input  class="btn btn-default" type="reset" value="다시작성">&nbsp;&nbsp;&nbsp;
			<input class="btn btn-default" id="toLogin" type="button" value="로그인 화면">
			</td>
			
		</tr>
	</table>
	
</form>
</body>
</html>
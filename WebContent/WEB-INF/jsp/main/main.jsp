<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<script type="text/javascript">
$(document).ready(function(){
	$("#btnJoin").click(function(){
		document.form1.action="${path}/member/join.do";
	});
	$("#btnLogin").click(function(){
		var pattern = /[^(a-zA-Z0-9)]/;
		if(pattern.test(document.getElementById('memberId').value)){
			alert("아이디는 영문만 허용합니다.");
			return false;
		}
		else {
			document.getElementById("memberPw").value = b64_sha1($("#memberPw").val());
			document.form1.action="${path}/member/loginCheck.do";
			document.form1.submit();
		}
	});
	$("#btnFind").click(function(){
		document.form1.action="${path}/member/find.do";
	});
	$("#btnLogout").click(function(){
		location.href="${path}/member/logout.do";
	});
	$("#btnBoard").click(function(){
		location.href="${path}/board/list.do";
	});
	$("#btnMemberAdmin").click(function(){
		location.href="${path}/member/admin.do";
	})
});
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
</script>
<title>메인 페이지</title>
</head>
<body style="background-image:url('/img/background.JPG');background-size:cover;position:absolute;top:50%;left:50%;transform:translate(-50%, -50%)">

<c:choose>
<c:when test="${msg == 'success'}"> 
	<h2 class="text-center">Login ${msg}</h2>
	아이디 : ${memberId}<br>
	닉네임 : ${memberName}<br><br>
	<button id="btnLogout" class="btn btn-success">로그아웃</button>
	<button id="btnBoard" class="btn btn-success">게시판</button>
	<c:if test="${memberId == 'admin'}">
		<button id="btnMemberAdmin" class="btn btn-success">회원 관리</button>
	</c:if>
</c:when>
<c:when test="${msg == 'failure'}">
<script>
	alert("아이디나 비밀번호가 틀립니다.");
</script>
<form name="form1" method="post">
<div class="form-horizontal">
<h1 class="text-center">로그인</h1>
  <div class="form-group">
    <h3>ID</h3><input maxlength="100" id="memberId" style="width:700px;float:left" name="memberId" class="form-control" id="memberId" placeholder="ID">
    
  </div>
  <br>
  <div class="form-group">
    <h3>Password</h3><input type="password" style="width:700px"class="form-control" name="memberPw" id="memberPw" placeholder="Password">
    
  </div>
  <br>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button id="btnLogin" style="margin-left:80px" class="btn btn-default">Sign in</button>&nbsp;
      <button id="btnJoin" class="btn btn-default">Join</button>&nbsp;
      <button id="btnFind" class="btn btn-default">Find ID/PW</button>
    </div>
  </div>
 </div>
</form>
</c:when>
<c:otherwise>
<form name="form1" method="post">
<div class="form-horizontal">
<h1 class="text-center">로그인</h1>
  <div class="form-group">
    <h3>ID</h3><input type="text" style="width:700px;float:left" name="memberId" class="form-control" id="memberId" placeholder="ID">
    
  </div>
  <br>
  <div class="form-group">
    <h3>Password</h3><input type="password" style="width:700px"class="form-control" name="memberPw" id="memberPw" placeholder="Password">
    
  </div>
  <br>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button id="btnLogin" style="margin-left:80px" class="btn btn-default">Sign in</button>&nbsp;
      <button id="btnJoin" class="btn btn-default">Join</button>&nbsp;
      <button id="btnFind" class="btn btn-default">Find ID/PW</button>
    </div>
  </div>
 </div>
</form>
</c:otherwise>
</c:choose>


</body>
</html>
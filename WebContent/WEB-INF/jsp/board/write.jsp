<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시글 작성</title>
<script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script>
$(document).ready(function(){
	$("#btnSave").click(function(){
		var title = $("#boardTitle").val();
		var content = $("#boardContent").val();
		var writer = $("#boardWriter").val();
		if(title == ""){
			alert("제목을 입력하세요");
			document.form1.boardTitle.focus();
			return;
		}
		if(content == ""){
			alert("내용을 입력하세요");
			document.form1.boardContent.focus();
			return;
		}
		if("${sessionScope.memberName}" == "" || "${sessionScope.memberName}" == null){
			alert("제대로 로그인하세요.")
			location.href="/main.do";
			return false;
		}
		if($("#file").val() == null ||$("#file").val() == "" ){
			alert("파일 입력은 필수입니다.");
			return false;
		}
		document.form1.submit();
	});
	$("#toList").click(function(){
           location.href = "${path}/board/list.do";
	});
})
	
$(document).ready(function() {
    $('#boardTitle').on('keyup', function() {
        if($(this).val().length > 1000) {
            $(this).val($(this).val().substring(0, 1000));
        }
    });
});
$(document).ready(function() {
    $('#boardContent').on('keyup', function() {
        if($(this).val().length > 2000) {
            $(this).val($(this).val().substring(0, 2000));
        }
    });
});
</script>
</head>
<body style="position:absolute;top:50%;left:50%;transform:translate(-50%, -50%)">
<h2>게시글 작성</h2>
<form name="form1" method="post" enctype="multipart/form-data" action="${path}/board/insert.do">

	<table class="table" style="width:800px">
		<tr>
			<td>제목</td>
			<td><input name="boardTitle" class="form-control" name="boardTitle" id="boardTitle" size="80" placeholder="제목을 입력해 주세요"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="boardContent" class="form-control" name="boardContent" id="boardContent" rows="4" cols="80" placeholder="내용을 입력해 주세요"></textarea></td>
		</tr>
		<tr>
			<td>파일 업로드</td>
			<td>
				<input type="file" class="file" id="file" name="file" placeholder="파일 선택">
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td><c:out value="${sessionScope.memberName}"></c:out>
		</tr>
	</table>
	<div style="width:650px; text-align:center;">
		<button type="button" class="btn btn-success" id="btnSave">확인</button>
		<button type="reset" class="btn btn-success" >취소</button>
		<button type="button" class="btn btn-success" id="toList">목록으로</button>
	</div>
</form>
</body>
</html>
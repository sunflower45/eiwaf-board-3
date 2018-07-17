<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시글 보기</title>
<script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
	
	$(document).ready(function(){
		$("#btnDelete").click(function(){
			if(confirm("삭제하시겠습니까?")){
				document.form1.action="${path}/board/delete.do";
				document.form1.submit();
			}
		});
		
		$("#btnToList").click(function(){
			location.href = "${path}/board/list.do";
		})
		
		
		
		$("#btnUpdete").click(function(){
            alert("수정되었습니다.");
            var title = $("#boardTitle").val();
            var content = $("#boardContent").val();
            var writer = $("#boardWriter").val();
            if(title == ""){
                alert("제목을 입력하세요");
                document.form1.title.focus();
                return;
            }
            if(content == ""){
                alert("내용을 입력하세요");
                document.form1.content.focus();
                return;
            }
            if(writer == ""){
                alert("이름을 입력하세요");
                document.form1.writer.focus();
                return;
            }
            document.form1.action="${path}/board/update.do"
            // 폼에 입력한 데이터를 서버로 전송
            document.form1.submit();
        });
	})
</script>
</head>
<body style="position:absolute;top:50%;left:50%;transform:translate(-50%, -50%)">
<h2>게시글 보기</h2>
<form name="form1" method="post">
<table class="table" style="width:800px">
	<tr>
		<td>작성일자</td>
		<td>${dto.boardRegdate}</td>
	</tr>
	<tr>
		<td>조회수</td>
		<td>${dto.boardViewcnt}</td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input name="boardTitle" class="form-control" id="boardTitle" size="80" value="${dto.boardTitle}" placeholder="제목을 입력해주세요"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea name="boardContent"  class="form-control" id="boardContent" rows="4" cols="80" placeholder="내용을 입력해주세요">${dto.boardContent}</textarea></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><c:out value="${dto.boardWriter}"></c:out><input type="hidden" id="boardWriter" name="boardWriter" value="${dto.boardWriter}"></td>
	</tr>
</table>
	<div>
		<input type="hidden" name="boardBno" value="${dto.boardBno}">
		<button type="button" id="btnUpdete" class="btn btn-success">수정</button>
		<button type="button" id = "btnDelete" class="btn btn-success">삭제</button>
		<button type="button" id="btnToList" class="btn btn-success">목록으로</button>
	</div>
</form>
</body>
</html>
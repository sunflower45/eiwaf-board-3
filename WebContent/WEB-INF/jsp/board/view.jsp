<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>​
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 보기</title>
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

	$(document).ready(function() {
	    $('#replyText').on('keyup', function() {
	        if($(this).val().length > 4000) {
	            $(this).val($(this).val().substring(0, 4000));
	        }
	    });
	});
	$(document).ready(function(){
		listReply("1");
		
		
		$("#btnReply").click(function(){
			if($("#replyText").val() == "" || $("#replyText").val()==null){
				alert("댓글을 작성해주세요.");
				return false;
			}
			replyJson();
		});
		
		$("#btnDelete").click(function(){
			if(confirm("삭제하시겠습니까?")){
				document.commonForm.action="${path}/board/delete.do";
				document.commonForm.submit();
			}
		});
		$("#btnUpdate").click(function(){
			location.href = "${path}/board/modify.do?boardBno=${dto.boardBno}";
				
		});
		
		$("#toList").click(function(){
			location.href = "${path}/board/list.do";
		});
		
		$("a[name='file']").click( function(){ //파일 이름
			location.href="${path}/board/downloadFile.do?fileName=${dto.boardFileName}";
        });
		
		
	})
	
	
	
	function replyJson(){
		
		var f = document.commonForm;
		var result = svcf_Ajax("/reply/insert.do", f, {
			async : false,
			procType : "R"
		});
		svcf_SyncCallbackFn(result, replyJsonCallback);
	}
	
	function replyJsonCallback(status, data){
		alert('댓글이 등록되었습니다.');
		document.getElementById("replyText").value = "";
		listReply("1");
	}
	
	
 	function listReply(num){
 		
		$.ajax({
			method : 'get',
			url : "/reply/list.do?replyBno=${dto.boardBno}&curPage="+num,
			success : function(result) {
				$("#listReply").html(result);	
			},
	        error: function (request,status,error){
	        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
		})
	}
	 
	
    function changeDate(date){
        date = new Date(parseInt(date));
        year = date.getFullYear();
        month = date.getMonth();
        day = date.getDate();
        hour = date.getHours();
        minute = date.getMinutes();
        second = date.getSeconds();
        strDate = year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
        return strDate;
    }
    
</script>

</head>
<body style="position:absolute;top:50%;left:50%;transform:translate(-50%, -50%)">
<jsp:include page="../main/menu.jsp" ></jsp:include>

<h2 >게시글 보기</h2>
<form name="commonForm">
	<input type="hidden" id="replyBno" name="replyBno" value="${dto.boardBno}"/>
	<table style="width:800px;" class="table table-striped">
		<tr>
			<td style="width:200px">작성일자</td>
			<td><c:out value="${dto.boardRegdate}"></c:out>
			</td>
		</tr>
		<tr>
			<td style="width:200px">조회수</td>
			<td><c:out value="${dto.boardViewcnt}"></c:out></td>
		</tr>
		<tr>
			<td style="width:200px">제목</td>
			<td><c:out value="${dto.boardTitle}"></c:out></td>
		</tr>
		<tr>
			<td style="width:200px">내용</td>
			<td><c:out value="${dto.boardContent}"></c:out></td>
		</tr>
		<tr>
			<td style="width:200px">첨부파일</td>
			<td><a href="#this" id="file" name="file">${dto.boardFileName}</a></td>
		</tr>
		<tr>
			<td style="width:200px">이름</td>
			<td><c:out value=" ${dto.boardWriter}"></c:out></td>
		</tr>
	</table>

	<div>
		<input type="hidden" name="boardBno" value="${dto.boardBno}">
		<input type="hidden" name="replyer" value="${sessionScope.memberId}">
		<c:if test="${sessionScope.memberId == dto.boardWriter}">
			<button type="button"  style="margin-left:300px" id="btnUpdate" class="btn btn-success">수정</button>
			<button type="button" id = "btnDelete" class="btn btn-success">삭제</button>
		</c:if>
		<button type="button" id="toList" class="btn btn-success">목록으로</button>
	</div>
<div style="width:650px;text-align:center;">

	<br>
	<c:if test="${sessionScope.memberId != null || sessionScope.memberId == ''}">
		<textarea rows="5" style="margin-left:100px" cols="80" name="replyText" id="replyText" class="form-control" placeholder="댓글을 작성해주세요"></textarea>
		<br>
		<button type="button" id="btnReply" style="margin-left:150px" class="btn btn-success" >댓글 작성</button>
	</c:if>
</div>
</form>

<div id="listReply"></div>
</body>
</html>
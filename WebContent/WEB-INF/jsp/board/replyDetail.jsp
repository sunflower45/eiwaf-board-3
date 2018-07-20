<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
// 댓글 수정
$("#btnReplyUpdate").click(function(){
	replyUpdate();
});

// 댓글 ajax로 수정하기
function replyUpdate(){
	
	var f = document.form1;
	var result = svcf_Ajax("/reply/update.do", f, {
		async:false,
		procType : "R"
	});
	svcf_SyncCallbackFn(result, replyUpdateCallback);
}
function replyUpdateCallback(status, data){
	$("#modifyReply").css("visibility", "hidden");
	listReply("1");
}

// 뎃글 삭제
$("#btnReplyDelete").click(function(){
	if(confirm("삭제하시겠습니까?")){
		$.ajax({
			method : 'delete',
			url : "/reply/delete.do?replyRno=${vo.replyRno}",
			success : function(result){
				alert("삭제되었습니다.");
				$("#modifyReply").css("visibility", "hidden");
				listReply("1");
			},
	        error: function (request,status,error){
	        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
		})
	}
});
$("#btnReplyClose").click(function(){
	$("#modifyReply").css("visibility", "hidden");
});
$(document).ready(function() {
    $('#replyText').on('keyup', function() {
        if($(this).val().length > 4000) {
            $(this).val($(this).val().substring(0, 4000));
        }
    });
});
</script>
</head>
<body>
댓글 번호 : <c:out value="${vo.replyRno }"></c:out><br>
<form name="form1">
<textarea style="width:400px" class="form-control" id="replyText" name="replyText" rows="5" cols="82"><c:out value="${vo.replyText}"></c:out>
</textarea>
<input type="hidden" name="replyRno" id = "replyRno" value="${vo.replyRno}">
<div>
	<c:if test="${sessionScope.memberId == vo.replyer }">
		<button style="margin-top:10px" class="btn btn-success btn-xs" type="button" id="btnReplyUpdate">수정</button>
		<button style="margin-top:10px"  class="btn btn-success btn-xs"type="button" id="btnReplyDelete">삭제</button>

	</c:if>
	<button style="margin-top:10px"  class="btn btn-success btn-xs" type="button" id="btnReplyClose">닫기</button>
</div>
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script>
function showReplyModify(replyRno){
	
	$.ajax({
		method:'get',
		url:"${path}/reply/detail.do?replyRno="+replyRno,
		success : function(result){
			$("#modifyReply").html(result);
			$("#modifyReply").css("visibility", "visible");
			$("#modifyReply").css("margin-left", "200px");
		},
        error: function (request,status,error){
        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

        }
	})
}
</script>
</head>
<body>

	<div id="modifyReply"></div>
	<table class="table" style="margin-top:50px;width:700px">
		<c:forEach var="row" items="${list}">
		<tr>
			<td>
				${row.replyer} ${row.replyRegdate}
				<br>
				${row.replyText}
				
				<c:if test="${sessionScope.memberId==row.replyer}">
					<div style="float:right;vertical-align:middle;">
						<input type="button" id="btnModify" class="btn btn-default" value="수정" onclick="showReplyModify('${row.replyRno}')">
					</div>
				</c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>
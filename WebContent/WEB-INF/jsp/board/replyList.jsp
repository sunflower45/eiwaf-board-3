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

// 댓글 수정 버튼 눌렀을 때
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
				<c:out value="${row.replyer}"></c:out> <c:out value="${row.replyRegdate}"></c:out>
				<br>
				<c:out value="${row.replyText}"></c:out>
				
				<c:if test="${sessionScope.memberId==row.replyer}">
					<div style="float:right;vertical-align:middle;">
						<input type="button" id="btnModify" class="btn btn-default" value="수정" onclick="showReplyModify('${row.replyRno}')">
					</div>
				</c:if>
			</td>
		</tr>
		</c:forEach>
		<tr>
            <td>
                <!-- 현재 페이지 블럭이 1보다 크면 처음으로 이동 -->
                <c:if test="${replyPager.curBlock > 1}">
                    <a href="javascript:listReply('1')">[처음]</a>
                </c:if>
                <!-- 현재 페이지 블럭이 1보다 크면 이전 페이지 블럭으로 이동 -->
                <c:if test="${replyPager.curBlock > 1}">
                    <a href="javascript:listReply('${replyPager.prevPage}')">[이전]</a>
                </c:if>
                <!-- 페이지 블럭 처음부터 마지막 블럭까지 1씩 증가하는 페이지 출력 -->
                <c:forEach var="num" begin="${replyPager.blockBegin}" end="${replyPager.blockEnd}">
                    <c:choose>
                        <c:when test="${num == replyPager.curPage}">
                            ${num}&nbsp;
                        </c:when>
                        <c:otherwise>
                            <a href="javascript:listReply('${num}')">${num}</a>&nbsp;
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <!-- 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 다음페이지로 이동 -->
                <c:if test="${replyPager.curBlock <= replyPager.totBlock}">
                    <a href="javascript:listReply('${replyPager.nextPage}')">[다음]</a>
                </c:if>
                <!-- 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 끝으로 이동 -->
                <c:if test="${replyPager.curBlock <= replyPager.totBlock}">
                    <a href="javascript:listReply('${replyPager.totPage}')">[끝]</a>
                </c:if>
            </td>
        </tr>
	</table>
</body>
</html>
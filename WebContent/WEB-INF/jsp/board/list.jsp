<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 목록</title>
<script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function(){
        $("#btnWrite").click(function(){
            // 페이지 주소 변경(이동)
            location.href = "${path}/board/write.do";
        });
    });
    function list(page){
    	location.href="${path}/board/list.do?curPage="+page+"&searchOption=${map.searchOption}&keyword=${map.keyword}";
    }
    $(document).ready(function() {
        $('#keyword').on('keyup', function() {
            if($(this).val().length > 255) {
                $(this).val($(this).val().substring(0, 255));
            }
        });
    });
</script>
</head>
<body style="position:absolute;top:50%;left:50%;transform:translate(-50%, -50%)">
<jsp:include page="../main/menu.jsp" ></jsp:include>
	<h2 style="margin-left:250px">게시글 목록</h2>
	<form name="form1" method="post" action="${path}/board/list.do">

	<table>
		<tr>
			<td>
			<select class="form-control" style="margin-left:20px;width:100px"name="searchOption">
			<option value="all" <c:out value="${map.searchOption == 'all'?'selected':''}"></c:out> >제목+내용</option>
			<option value="board_writer" <c:out value="${map.searchOption == 'board_writer'?'selected':''}"/> >이름</option>
			<option value="board_content" <c:out value="${map.searchOption == 'board_content'?'selected':''}"></c:out> >내용</option>
            <option value="board_title" <c:out value="${map.searchOption == 'board_title'?'selected':''}"></c:out> >제목</option>
			</select>
			</td>
			<td width="5px"></td>
			<td>
			<input name="keyword" class="form-control" style="width:300px;" value="${map.keyword}">
			</td>
			<td width="5px"></td>
			<td>
			<button type="submit" style="width:100px" class="btn btn-success col-md-1 ">조희</button>
			</td>
			<td width="180px"></td>
			<td>
			<c:if test="${sessionScope.memberId != null}">
			<button type="button" style="width:100px" class="btn btn-success col-md-1" id="btnWrite">글쓰기</button>
			</c:if>
			</td>
		</tr>
	</table>
	</form>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${map.count} 개의 게시물이 있습니다.
	<table  style="margin-left:20px;width:800px" class="table table-hover">
		<tr class="success">
			<th>번호</th>
			<th>제목</th>
			<th>이름</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="row" items="${map.list}">
			<tr>
				<td><c:out value="${row.boardBno}"></c:out></td>
				<td><a href="${path}/board/view.do?boardBno=${row.boardBno}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">${row.boardTitle}
				<c:if test="${row.boardReplyCnt > 0}">
					<span style="color:red;"><c:out value="${row.boardReplyCnt}"></c:out></span>
				</c:if>
				</a>
				</td>
				<td><c:out value="${row.boardWriter}"></c:out></td>
				<td><c:out value="${row.boardRegdate}"></c:out></td>
				<td><c:out value="${row.boardViewcnt}"></c:out></td>
			</tr>
		</c:forEach>
		<tr>
            <td colspan="5">
                <!-- **처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
                <c:if test="${map.boardPager.curBlock > 1}">
                    <a href="javascript:list('1')">[처음]</a>
                </c:if>
                
                <!-- **이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
                <c:if test="${map.boardPager.curBlock > 1}">
                    <a href="javascript:list('${map.boardPager.prevPage}')">[이전]</a>
                </c:if>
                
                <!-- **하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 -->
                <c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
                    <!-- **현재페이지이면 하이퍼링크 제거 -->
                    <c:choose>
                        <c:when test="${num == map.boardPager.curPage}">
                            <span style="color: red">${num}</span>&nbsp;
                        </c:when>
                        <c:otherwise>
                            <a href="javascript:list('${num}')">${num}</a>&nbsp;
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                
                <!-- **다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
                <c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
                    <a href="javascript:list('${map.boardPager.nextPage}')">[다음]</a>
                </c:if>
                
                <!-- **끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
                <c:if test="${map.boardPager.curPage <= map.boardPager.totPage}">
                    <a href="javascript:list('${map.boardPager.totPage}')">[끝]</a>
                </c:if>
            </td>
        </tr>
	</table>
	
	
</body>
</html>
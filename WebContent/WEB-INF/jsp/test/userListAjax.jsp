<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/view/layout/taglib-include.jsp"%>

<ei:jstlAjaxTemplate>

<ei:jstlAjax name="default">
	<table id="tblList" class="tbl_h01" width="100%">
		<colgroup>
			<col width="5%" />
			<col />
			<col />
			<col />
		</colgroup>
		<thead>
		<tr>
			<th><input id="chkAll" type="checkbox" class="ck" onclick="CheckAll();"></th>
			<th>아이디</th>
			<th>이름</th>
			<th>상태</th>
		</tr>
		</thead>
		<tbody>
		<c:choose>
			<c:when test="${!empty list}">
				<c:forEach items="${list}" var="list">
				<tr>
					<td><input type="checkbox" name="chk_box" /></td>
					<td class="left"><a href="#" onclick="DoDetail('${list.user_id}');">${list.user_id}</a></td>
					<td>${list.name}</td>
					<td class="left">${codeMap[list.user_status].value}</td>
				</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="4"><spring:message code="COMN0020"/></td>
				</tr>
			</c:otherwise>
		</c:choose>
		</tbody>
	</table>

	<ei:pagenavigator source="${pageNav}">
		<ei:pagenavigatorHtml type="href">javascript:DoList(#page#);</ei:pagenavigatorHtml>
	</ei:pagenavigator>
</ei:jstlAjax>

</ei:jstlAjaxTemplate>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/view/layout/taglib-include.jsp"%>

<%
	response.setStatus(HttpServletResponse.SC_OK);
%>
<ei:layoutRender name="/view/layout/main-layout.jsp">
<ei:layoutComponent name="eiLayoutTitle">불편을 드려서 죄송합니다.</ei:layoutComponent>
<ei:layoutComponent name="eiLayoutContent">

<table style="width:650px; margin:25px auto;">
	<tr>
		<td style="background-image:url('/images/msg_top.gif');height:65px"></td>
	</tr>
	<tr>
		<td class="serverror_topbg" style="padding:15px 0px 15px 0px">
			<table style="width:600px;">
				<tr>
					<td align="center" width="150px"><img src="/images/msg_img.gif" alt=""/></td>
					<td>
						<span class="msg">불편을 드려서 죄송합니다.</span>
						<div style="margin:0 0 0 10px;">
							페이지 주소가 잘못 입력되었거나 찾을수 없는 페이지 입니다.
						</div>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td class="serverror_botbg" height="55" style="padding-right:15px"></td>
	</tr>
</table>

</ei:layoutComponent>
</ei:layoutRender>
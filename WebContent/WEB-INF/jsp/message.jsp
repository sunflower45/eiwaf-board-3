<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/view/layout/taglib-include.jsp"%>

<ei:requestContext id="requestContext"/>
<%
	Status status = requestContext.getStatus();
	String title = requestContext.getRequestProperty("title");
	String layout = requestContext.getRequestProperty("layout");

	if (StringUtil.isNullOrBlank(title)) {
		title = "고객님께 안내해드립니다.";
	}
	if (StringUtil.isNullOrBlank(layout)) {
		layout = "/view/layout/main-layout.jsp";
	} else {
		layout = "/view/layout/"+ layout +"-layout.jsp";
	}
%>
<ei:layoutRender name="<%= layout %>">
<ei:layoutComponent name="eiLayoutTitle"><%= title %></ei:layoutComponent>
<ei:layoutComponent name="eiLayoutContent">

<script type="text/javascript">
//<![CDATA[
	function eiwaf_DocumentReady(status) {
		
	}
//]]>
</script>

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
						<span class="msg"><%= title %></span>
						<div style="margin:0 0 0 10px;">
							<%= status.getMessage() %>
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
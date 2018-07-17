<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/view/layout/taglib-include.jsp"%>

<ei:requestContext id="requestContext"/>

<ei:layoutRender name="/view/layout/default-layout.jsp">
<ei:layoutComponent name="eiLayoutTitle">요청데이터리소스</ei:layoutComponent>
<ei:layoutComponent name="eiLayoutContent">

<br/>
<font color="red">공통 개발자가 아닐 경우는 net.e4net.eiwaf.web.RequestContext을 이용한다.</font><br/>
<font color="red">JSP에서 단순 메시지 표시를 할 경우 다음과 같이 태그를 사용한다. - &lt;ei:requestContext id="requestContext"/&gt;</font>

<br/><br/>
<b>[요청데이터]</b><br/>
<table border="1" width="100%"> 
	<colgroup>
		<col width="5%" />
		<col width="50%" />
		<col />
	</colgroup>
	<tbody>
		<tr>
			<th>구분</th>
			<th>API</th>
			<th>값</th>
		</tr>
		<tr>
			<td>JSP</td>
			<td>
				&lt;ei:requestContext id="requestContext"/&gt;<br/>
			</td>
			<td>
				requestPath : <%= requestContext.getRequestPath() %><br/>
				requestKey : <%= requestContext.getRequestKey() %><br/>
				equestPattern : <%= requestContext.getRequestPattern() %><br/>
				title : <%= requestContext.getRequestProperty("title") %><br/>
				layout : <%= requestContext.getRequestProperty("layout") %><br/>
				type : <%= requestContext.getRequestProperty("type") %><br/>
			</td>
		</tr>
		<tr>
			<td rowspan="2">JAVA</td>
			<td>RequestContext requestContext</td>
			<td>
				requestPath : ${reqPath1}<br/>
				requestKey : ${reqKey1}<br/>
				equestPattern : ${reqPattern1}<br/>
				title : ${reqReqTitle1}<br/>
				layout : ${reqReqLayout1}<br/>
				type : ${reqReqType1}
			</td>
		</tr>
		<tr>
			<td>
				requestDataService.getRequestData("/main/intro.do");<br/>
				<font color="red">해당 요청데이터리소스가 미리 로딩되어 있지 않으면 예외가 발생한다.</font>
			</td>
			<td>
				requestPath : ${reqPath2}<br/>
				requestKey : ${reqKey2}<br/>
				equestPattern : ${reqPattern2}<br/>
				title : ${reqReqTitle2}<br/>
				layout : ${reqReqLayout2}<br/>
				type : ${reqReqType2}
			</td>
		</tr>
	</tbody>
</table>

</ei:layoutComponent>
</ei:layoutRender>
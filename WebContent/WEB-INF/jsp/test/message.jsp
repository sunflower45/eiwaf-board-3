<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/view/layout/taglib-include.jsp"%>

<ei:layoutRender name="/view/layout/default-layout.jsp">
<ei:layoutComponent name="eiLayoutTitle">메시지리소스</ei:layoutComponent>
<ei:layoutComponent name="eiLayoutContent">

<br/>
<font color="red">공통 개발자가 아닐 경우는 net.e4net.eiwaf.common.Status을 이용한다.</font><br/>
<font color="red">JSP에서 단순 메시지 표시를 할 경우 다음과 같이 태그를 사용한다. - &lt;spring:message code="COMN0020"/&gt;</font>

<br/><br/>
<b>[메시지-스프링 메시지 태그]</b><br/>
<table border="1" width="100%"> 
	<colgroup>
		<col width="50%" />
		<col width="50%" />
	</colgroup>
	<tbody>
		<tr>
			<th>API</th>
			<th>값</th>
		</tr>
		<tr>
			<td>&lt;spring:message code="COMN0001"/&gt;</td>
			<td><spring:message code="COMN0001"/></td>
		</tr>
		<tr>
			<td>&lt;spring:message code="COMN0002"/&gt;</td>
			<td><spring:message code="COMN0002"/></td>
		</tr>
		<tr>
			<td>&lt;spring:message code="COMN0003"/&gt;</td>
			<td><spring:message code="COMN0003"/></td>
		</tr>
		<tr>
			<td>&lt;spring:message code="COMN0004"/&gt;</td>
			<td><spring:message code="COMN0004"/></td>
		</tr>
		<tr>
			<td>&lt;spring:message code="COMN0005"/&gt;</td>
			<td><spring:message code="COMN0005"/></td>
		</tr>
		<tr>
			<td>&lt;spring:message code="COMN0006"/&gt;</td>
			<td><spring:message code="COMN0006"/></td>
		</tr>
		<tr>
			<td>&lt;spring:message code="COMN0012" arguments="10"/&gt;</td>
			<td><spring:message code="COMN0012" arguments="10"/></td>
		</tr>
		<tr>
			<td>&lt;spring:message code="COMN0013" arguments="10"/&gt;</td>
			<td><spring:message code="COMN0013" arguments="10"/></td>
		</tr>
		<tr>
			<td>&lt;spring:message code="COMN0014" arguments="10"/&gt;</td>
			<td><spring:message code="COMN0014" arguments="10"/></td>
		</tr>
		<tr>
			<td>&lt;spring:message code="COMN0015" arguments="10"/&gt;</td>
			<td><spring:message code="COMN0015" arguments="10"/></td>
		</tr>
		<tr>
			<td>&lt;spring:message code="COMN0016" arguments="10"/&gt;</td>
			<td><spring:message code="COMN0016" arguments="10"/></td>
		</tr>
		<tr>
			<td>&lt;spring:message code="존재하지 않는 키" text="존재하지 않는 키에 대한 기본 메시지 설정"/&gt;</td>
			<td><spring:message code="존재하지 않는 키" text="존재하지 않는 키에 대한 기본 메시지 설정"/></td>
		</tr>
	</tbody>
</table>

<br/><br/>
<b>[messageService]</b>
<table border="1" width="100%"> 
	<colgroup>
		<col width="50%" />
		<col width="50%" />
	</colgroup>
	<tbody>
		<tr>
			<th>API</th>
			<th>값</th>
		</tr>
		<tr>
			<td>messageService.getMessage("COMN0001")</td>
			<td>${cOMN0001}</td>
		</tr>
		<tr>
			<td>messageService.getMessage("존재하지 않는 키", "기본메시지입니다.")</td>
			<td>${notfound1}</td>
		</tr>
		<tr>
			<td>messageService.getMessage("COMN0012", new String[] { "1,000" })</td>
			<td>${cOMN0012}</td>
		</tr>
		<tr>
			<td>messageService.getMessage("존재하지 않는 키", new String[] {"아규먼트1", "아규먼트2"}, "기본메시지입니다.")</td>
			<td>${notfound2}</td>
		</tr>
		<tr>
			<td>messageService.getMessage("COMN0006", Locale.ENGLISH)</td>
			<td>${cOMN0006_en}</td>
		</tr>
		<tr>
			<td>messageService.getMessage("COMN9999", Locale.ENGLISH)</td>
			<td>
				${cOMN9999_en}<br/>
				<font color="red">해당 로케일에 존재하지 않는 메시지 키의 경우 defaultLocale의 메시지로 표시한다.</font>
			</td>
		</tr>
		<tr>
			<td>messageService.getMessage("notfoundkey", "defaultmessage", Locale.ENGLISH)</td>
			<td>${notfound1_en}</td>
		</tr>
		<tr>
			<td>messageService.getMessage("XXXX1000", new String[] {"arg1", "arg2", "arg3"}, Locale.ENGLISH)</td>
			<td>${xXXX1000_en}</td>
		</tr>
		<tr>
			<td>messageService.getMessage("notfoundkey", new String[] {"arg1", "arg2", "arg3"}, "defaultmessage" , Locale.ENGLISH)</td>
			<td>${notfound2_en}</td>
		</tr>
	</tbody>
</table>

</ei:layoutComponent>
</ei:layoutRender>
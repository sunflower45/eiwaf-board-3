<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/view/layout/taglib-include.jsp"%>

<ei:layoutRender name="/view/layout/default-layout.jsp">
<ei:layoutComponent name="eiLayoutTitle">JSTL기본태그</ei:layoutComponent>
<ei:layoutComponent name="eiLayoutContent">

<ei:dateFormat value="20081010" />

JavaServer Pages Standard Tag Library<br/>
API : <a href="http://docs.oracle.com/cd/E17802_01/products/products/jsp/jstl/1.1/docs/tlddocs/index.html" taget="_blank">http://docs.oracle.com/cd/E17802_01/products/products/jsp/jstl/1.1/docs/tlddocs/index.html</a><br/>
강의 :<br/>
&nbsp;&nbsp;&nbsp;&nbsp;① Expression Language - <a href="http://www.ibm.com/developerworks/kr/library/j-jstl0211.html" target="_blank">http://www.ibm.com/developerworks/kr/library/j-jstl0211.html</a><br/>
&nbsp;&nbsp;&nbsp;&nbsp;② core 분석 - <a href="http://www.ibm.com/developerworks/kr/library/j-jstl0318/" target="_blank">http://www.ibm.com/developerworks/kr/library/j-jstl0318/</a><br/>
&nbsp;&nbsp;&nbsp;&nbsp;③ 포멧 - <a href="http://www.ibm.com/developerworks/kr/library/j-jstl0415/" target="_blank">http://www.ibm.com/developerworks/kr/library/j-jstl0415/</a><br/>
&nbsp;&nbsp;&nbsp;&nbsp;④ 첨부파일 - <a href="/upload/jstl.tar" target="_blank">jstl 기초</a>
<br/>
<b>기본</b>
<table border="1" width="100%">
	<colgroup>
		<col width="20%" />
		<col />
	</colgroup>
	<tbody>
		<tr>
			<th>API</th>
			<th>샘플</th>
			<th>참조URL</th>
		</tr>	
		<tr>
			<td><a href="http://docs.oracle.com/cd/E17802_01/products/products/jsp/jstl/1.1/docs/tlddocs/c/forEach.html" target="_blank">&lt;c:forEach&gt;</a></td>
			<td>
				<b>기본</b><br/>
				<c:forEach items="${foreach1}" var="list">
					값[${list.key}]
				</c:forEach>
				<br/><br/>
				<b>varStatus</b><br/>
				<c:forEach items="${foreach1}" var="list" varStatus="st">
					인덱스[${st.index}], 카운트[${st.count}], 값[${list.key}]<br/>
				</c:forEach>
				<br/>
				<b>begin, step, end</b><br/>
				<c:forEach items="${foreach1}" var="list" varStatus="st" begin="1" step="2" end="4">
					인덱스[${st.index}], 카운트[${st.count}], 값[${list.key}]<br/>
				</c:forEach>
			</td>
			<td><a href="http://ultteky.egloos.com/10500318" target="_blank">참조</a></td>
		</tr>
		<tr>
			<td><a href="http://docs.oracle.com/cd/E17802_01/products/products/jsp/jstl/1.1/docs/tlddocs/c/if.html" target="_blank">&lt;c:if&gt;</a></td>
			<td>
				<b>널체크</b><br/>
				&lt;c:if test="&#036;{empty if1}"&gt;널 또는 공백&lt;/c:if&gt; - <c:if test="${empty if1}">널 또는 공백</c:if><br/>
				&#036;{empty if1} - 널 확인(${empty if1})<br/>
				&lt;c:out value="&#036;{if1}"  default="널입니다."/&gt; - 값이 널일 경우 디폴트 값 출력(<c:out value="${if1}"  default="널입니다."/>)<br/>
				
				<br/>
				<b>공백체크</b><br/>
				&lt;c:if test="&#036;{if2 == ''}"&gt;공백&lt;/c:if&gt; - <c:if test="${if2 == ''}">공백</c:if><br/>
				&lt;c:if test="&#036;{if2 eq ''}"&gt;공백&lt;/c:if&gt; - <c:if test="${if2 eq ''}">공백</c:if>
			</td>
			<td>
				<a href="http://ultteky.egloos.com/10500316" target="_blank">참조</a><br/>
				<a href="http://ultteky.egloos.com/10500301" target="_blank">EL참조</a>
			</td>
		</tr>
	</tbody>
</table>

</ei:layoutComponent>
</ei:layoutRender>
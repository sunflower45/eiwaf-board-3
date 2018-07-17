<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/view/layout/taglib-include.jsp"%>

<ei:layoutRender name="/view/layout/default-layout.jsp">
<ei:layoutComponent name="eiLayoutTitle">코드리소스</ei:layoutComponent>
<ei:layoutComponent name="eiLayoutContent">

<br/>
<b>[codeService.getCode]</b>
<table border="1" width="100%">
	<colgroup>
		<col width="40%" />
		<col width="10%" />
		<col width="20%" />
		<col width="10%" />
		<col width="20%" />
	</colgroup>
	<tbody>
		<tr>
			<th>API</th>
			<th>key</th>
			<th>value</th>
			<th>alias</th>
			<th>detail</th>
		</tr>	
		<tr>
			<td>Code code1 = <br/>&nbsp;&nbsp;codeService.getCode("TEL");</td>
			<td>${code1.key}</td>
			<td>${code1.value}</td>
			<td>${code1.alias}</td>
			<td>${code1.detail}</td>
		</tr>
		<tr>
			<td>Code code2 = <br/>&nbsp;&nbsp;codeService.getCode("TEL.031");</td>
			<td>${code2.key}</td>
			<td>${code2.value}</td>
			<td>${code2.alias}</td>
			<td>${code2.detail}</td>
		</tr>
		<tr>
			<td>Code code3 = <br/>&nbsp;&nbsp;codeService.getCode("존재하지 않는 키");</td>
			<td>${code3.key}</td>
			<td>${code3.value}</td>
			<td>${code3.alias}</td>
			<td>${code3.detail}</td>
		</tr>
		<tr>
			<td>Code code4 = <br/>&nbsp;&nbsp;codeService.getCode("존재하지 않는 키", true);</td>
			<td>${code4.key}</td>
			<td>${code4.value}</td>
			<td>${code4.alias}</td>
			<td>${code4.detail}</td>
		</tr>
	</tbody>
</table>

<br/><br/>
<b>[codeService.getCodeList]</b>
<table border="1" width="100%">
	<colgroup>
		<col width="40%" />
		<col width="30%" />
		<col width="30%" />
	</colgroup>
	<tbody>
		<tr>
			<th>API</th>
			<th>리스트</th>
			<th>select-box</th>
		</tr>	
		<tr>
			<td>List&lt;Code&gt; codeList1 = <br/>&nbsp;&nbsp;codeService.getCodeList("TEL");</td>
			<td>
				<c:forEach items="${codeList1}" var="list">
					key=${list.key}, value=${list.value}, alias=${list.alias}, detail=${list.detail}<br/>
				</c:forEach>
			</td>
			<td>
				<form:select path="codePVO.key1" items="${codeList1}" itemValue="key" itemLabel="value" title="코드"/>, "경기"를 초기값으로 설정(codePVO.key1 : ${codePVO.key1})
			</td>
		</tr>
		<tr>
			<td>List&lt;Code&gt; codeList2 = <br/>&nbsp;&nbsp;codeService.getCodeList("TEL", "KEY < '033'");</td>
			<td>
				<c:forEach items="${codeList2}" var="list">
					key=${list.key}, value=${list.value}, alias=${list.alias}, detail=${list.detail}<br/>
				</c:forEach>
			</td>
			<td>
				<form:select path="codePVO.key" items="${codeList2}" itemValue="key" itemLabel="value" title="코드"/>
			</td>
		</tr>
		<tr>
			<td>List&lt;Code&gt; codeList3 = <br/>&nbsp;&nbsp;codeService.getCodeList("TEL", "KEY < '033'", SortType.KEY_DESC);</td>
			<td>
				<c:forEach items="${codeList3}" var="list">
					key=${list.key}, value=${list.value}, alias=${list.alias}, detail=${list.detail}<br/>
				</c:forEach>
			</td>
			<td>
				<form:select path="codePVO.key" items="${codeList3}" itemValue="key" itemLabel="value" title="코드"/>
			</td>
		</tr>
		<tr>
			<td>List&lt;Code&gt; codeList4 = <br/>&nbsp;&nbsp;codeService.getCodeList("TEL", SortType.VALUE_DESC);</td>
			<td>
				<c:forEach items="${codeList4}" var="list">
					key=${list.key}, value=${list.value}, alias=${list.alias}, detail=${list.detail}<br/>
				</c:forEach>
			</td>
			<td>
				<form:select path="codePVO.key" items="${codeList4}" itemValue="key" itemLabel="value" title="코드"/>
			</td>
		</tr>
		<tr>
			<td>List&lt;Code&gt; codeList5 = <br/>&nbsp;&nbsp;codeService.getCodeList("존재하지 않는 키");</td>
			<td>
				<c:forEach items="${codeList5}" var="list">
					key=${list.key}, value=${list.value}, alias=${list.alias}, detail=${list.detail}<br/>
				</c:forEach>
			</td>
			<td>
				<form:select path="codePVO.key" items="${codeList5}" itemValue="key" itemLabel="value" title="코드"/>
			</td>
		</tr>
		<tr>
			<td>List&lt;Code&gt; codeList6 = <br/>&nbsp;&nbsp;codeService.getCodeList("존재하지 않는 키", true);</td>
			<td>
				<c:forEach items="${codeList6}" var="list">
					key=${list.key}, value=${list.value}, alias=${list.alias}, detail=${list.detail}<br/>
				</c:forEach>
			</td>
			<td>
				<form:select path="codePVO.key" items="${codeList6}" itemValue="key" itemLabel="value" title="코드"/>
			</td>
		</tr>
		<tr>
			<td>List&lt;Code&gt; codeList6 = <br/>&nbsp;&nbsp;codeService.getCodeList("존재하지 않는 키", true);</td>
			<td>
				<c:forEach items="${codeList6}" var="list">
					key=${list.key}, value=${list.value}, alias=${list.alias}, detail=${list.detail}<br/>
				</c:forEach>
			</td>
			<td>
				<form:select path="codePVO.key" title="코드">
					<option value="all">전체</option>
					<form:options items="${codeList6}" itemValue="key" itemLabel="value"/>
				</form:select>,
				"전체" 필드를 추가해서 초기값을 설정
			</td>
		</tr>
	</tbody>
</table>

<br/><br/>
<b>[codeService.getCodeMap]</b>
<table border="1" width="100%">
	<colgroup>
		<col width="40%" />
		<col width="30%" />
		<col width="30%" />
	</colgroup>
	<tbody>
		<tr>
			<th>API</th>
			<th>맵</th>
			<th>코드를 값으로 매핑<br/>(예:디비의 코드값을 실제 값으로 매핑)</th>
		</tr>	
		<tr>
			<td>Map&lt;String, Code&gt; codeMap1 = <br/>&nbsp;&nbsp;codeService.getCodeMap("CELL");</td>
			<td>
				<c:forEach items="${codeMap1}" var="ett" varStatus="st">
					${st.count} : key=${ett}<br/>
				</c:forEach>
			</td>
			<td>
				<c:forEach items="${codeMapList}" var="list" varStatus="st">
					${st.count} : ${codeMap1[list.key].detail}<br/>
				</c:forEach>
			</td>
		</tr>
		<tr>
			<td>Map&lt;String, Code&gt; codeMap2 = <br/>&nbsp;&nbsp;codeService.getCodeMap("CELL", "VALUE == '010' || VALUE == '011'");</td>
			<td>
				<c:forEach items="${codeMap2}" var="ett" varStatus="st">
					${st.count} : entity=${ett}<br/>
				</c:forEach>
			</td>
			<td>
				<c:forEach items="${codeMapList}" var="list" varStatus="st">
					${st.count} : ${codeMap2[list.key].detail}<br/>
				</c:forEach>
			</td>
		</tr>
		<tr>
			<td>Map&lt;String, Code&gt; codeMap3 = <br/>&nbsp;&nbsp;codeService.getCodeMap("존재하지 않는 키");</td>
			<td>
				<c:forEach items="${codeMap3}" var="ett" varStatus="st">
					${st.count}"/> : entity=${ett}<br/>
				</c:forEach>
			</td>
			<td>
				<c:forEach items="${codeMapList}" var="list" varStatus="st">
					${st.count} : ${codeMap3[list.key].detail}<br/>
				</c:forEach>
			</td>
		</tr>
		<tr>
			<td>Map&lt;String, Code&gt; codeMap4 = <br/>&nbsp;&nbsp;codeService.getCodeMap("존재하지 않는 키", true);</td>
			<td>
				<c:forEach items="${codeMap4}" var="ett" varStatus="st">
					${st.count} : entity=${ett}<br/>
				</c:forEach>
			</td>
			<td>
				<c:forEach items="${codeMapList}" var="list" varStatus="st">
					${st.count} : ${codeMap4[list.key].detail}<br/>
				</c:forEach>
			</td>
		</tr>
	</tbody>
</table>

</ei:layoutComponent>
</ei:layoutRender>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/view/layout/taglib-include.jsp"%>

<ei:layoutRender name="/view/layout/default-layout.jsp">
<ei:layoutComponent name="eiLayoutTitle">속성리소스</ei:layoutComponent>
<ei:layoutComponent name="eiLayoutContent">

<br/>
<b>[속성값]</b>
<table border="1" width="100%">
	<colgroup>
		<col width="50%" />
		<col />
		<col />
	</colgroup>
	<tbody>
		<tr>
			<th>API</th>
			<th>속성 변환값</th>
			<th>속성값</th>
		</tr>	
		<tr>
			<td>int number1 = propertiesService.getInt("TEST_NUMBER1")</td>
			<td>${number1}</td>
			<td>1234</td>
		</tr>
		<tr>
			<td>int number2 = propertiesService.getInt("TEST_NUMBER2")</td>
			<td>${number2}</td>
			<td>1,234</td>
		</tr>
		<tr>
			<td>String string1 = propertiesService.getString("TEST_STRING")</td>
			<td>${string1}</td>
			<td>문자열</td>
		</tr>
		<tr>
			<td>String[] array1 = propertiesService.getStringArray("TEST_ARRAY1")</td>
			<td>
				${array1}
				<c:forEach items="${array1}" var="array">
					, ${array}
				</c:forEach>
			</td>
			<td>1, 2, 3, 4, 5</td>
		</tr>
		<tr>
			<td>String[] array2 = propertiesService.getStringArray("TEST_ARRAY2")</td>
			<td>
				${array2}
				<c:forEach items="${array2}" var="array">
					, ${array}
				</c:forEach>
			</td>
			<td>1 | 2 | 3 | 4 | 5</td>
		</tr>
		<tr>
			<td>
				String array1_1 = propertiesService.getString("TEST_ARRAY1");<br/>
				List&lt;String&gt; list1 = StringUtil.spritList(array1_1, ",");
			</td>
			<td>${list1}</td>
			<td>1, 2, 3, 4, 5</td>
		</tr>
		<tr>
			<td>
				String array2_1 = propertiesService.getString("TEST_ARRAY2");<br/>
				List&lt;String&gt; list2 = StringUtil.spritList(array2_1, "|");
			</td>
			<td>${list2}</td>
			<td>1 | 2 | 3 | 4 | 5</td>
		</tr>
		<tr>
			<td>
				String stringM1 = propertiesService.getString("TEST_MAP1");<br/>
				Map&lt;String, String&gt; map1 = StringUtil.spritMap(stringM1, ",");
			</td>
			<td>${map1}</td>
			<td>KEY1=1, KEY2=2, KEY3=3, KEY4=4, KEY5=5</td>
		</tr>
		<tr>
			<td>
				String stringM2 = propertiesService.getString("TEST_MAP2");<br/>
				Map&lt;String, String&gt; map2 = StringUtil.spritMap(stringM2, ",");
			</td>
			<td>${map2}</td>
			<td>KEY1=1 | KEY2=2 | KEY3=3 | KEY4=4 | KEY5=5</td>
		</tr>
	</tbody>
</table>

</ei:layoutComponent>
</ei:layoutRender>
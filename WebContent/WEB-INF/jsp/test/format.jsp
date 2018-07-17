<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/view/layout/taglib-include.jsp"%>

<ei:layoutRender name="/view/layout/default-layout.jsp">
<ei:layoutComponent name="eiLayoutTitle">포멧태그</ei:layoutComponent>
<ei:layoutComponent name="eiLayoutContent">

<div style="height:5px;"></div>
<h2>&nbsp;◎ dateFormat</h2><br/>
문자열 날짜 데이터를 기본 JSTL 포멧태그 사용 시 Date 형으로 형변화 후 화면에 표시하는 불편함을 개선한 날짜 문자열 포멧 태그<br/>
[JSTL 포멧 이용]<br/>
&lt;fmt:parseDate var="date1" value="20120202" pattern="yyyyMMdd"/&gt;<br/>
&lt;fmt:formatDate value="${date1}" pattern="yyyy-MM-dd"/&gt;<br/>
[dateFormat 이용]<br/>
&lt;ei:dateFormat value="20120202" toPattern="yyyy-MM-dd"/&gt;<br/>

<div style="height:5px;"></div>
<table border="2" width="95%">
<tr>
	<td>							 
<b>[ei:dateFormt의 속성]</b>
<table border="1" width="90%">
	<colgroup>
		<col width="12%" />
		<col width="8%" />
		<col width="8%" />
		<col width="12%" />
		<col width="15%" />
		<col width="" />
	</colgroup>
	<tbody>
		<tr>
			<th>속성</th>
			<th>필수여부</th>
			<th>동적값</th>
			<th>Type</th>
			<th>Default</th>
			<th align="left">설명</th>
		</tr>	
		<tr>
			<td>value</td>
			<td>true</td>
			<td>true</td>
			<td>java.lang.String</td>
			<td></td>
			<td align="left">형식화될 날짜값</td>
		</tr>
		<tr>
			<td>pattern</td>
			<td>false</td>
			<td>true</td>
			<td>java.lang.String</td>
			<td>yyyyMMdd</td>
			<td align="left">입력된 값의 형식 스타일</td>
		</tr>
		<tr>
			<td>toPattern</td>
			<td>false</td>
			<td>true</td>
			<td>java.lang.String</td>
			<td>yyyy.MM.dd</td>
			<td align="left">사용자 지정 형식 스타일</td>
		</tr>
		<tr>
			<td>var</td>
			<td>false</td>
			<td>false</td>
			<td>java.lang.String</td>
			<td></td>
			<td align="left">형식 출력 결과 문자열을 담는 scope에 해당하는 변수명</td>
		</tr>
		<tr>
			<td>scope</td>
			<td>false</td>
			<td>false</td>
			<td>java.lang.String</td>
			<td>PageContext.PAGE_SCOPE</td>
			<td align="left">var의 scope</td>
		</tr>
	</tbody>
</table>
<div style="height:5px;"></div>	
<b>[ei:dateFormt의 예제]</b>
<table border="1" width="90%">
	<colgroup>
		<col width="" />
		<col width="30%" />
	</colgroup>
	<tbody>
		<tr>
			<th>사용예</th>
			<th>결과값</th>
		</tr>	
		<tr>
			<td align="left">&lt;ei:dateFormat value=&quot;20081010&quot;/&gt;</td>
			<td><ei:dateFormat value="20081010"/></td>
		</tr>
		<tr>
			<td align="left">&lt;ei:dateFormat value=&quot;2008-10-10&quot; pattern=&quot;yyyy-MM-dd&quot;/&gt;</td>
			<td><ei:dateFormat value="2008-10-10" pattern="yyyy-MM-dd"/></td>
		</tr>
		<tr>
			<td align="left">&lt;ei:dateFormat value=&quot;2008101002&quot; pattern=&quot;yyyyMMddhh&quot; toPattern=&quot;yyyy-MM-dd hh:mm:ss&quot;/&gt;</td>
			<td><ei:dateFormat value="2008101002" pattern="yyyyMMddhh" toPattern="yyyy-MM-dd hh:mm:ss" /></td>
		</tr>
		<tr>
			<td align="left">&lt;ei:dateFormat value=&quot;2008.10.10&quot; pattern=&quot;yyyy.MM.dd&quot;/&gt;</td>
			<td>
				<ei:dateFormat var="date1" value="2008.10.10" pattern="yyyy.MM.dd" />
				${date1}
			</td>
		</tr>	
	</tbody>
</table>

	</td>
</tr>
</table>

<div style="height:15px;"></div>
<h2>&nbsp;◎ cardFormat  - 카드업무에 관련된 값 형식화하기</h2>
<div style="height:5px;"></div>
<table border="1" width="95%">
<tr>
	<td>							 
<b>[ei:cardFormat의 속성]</b>
<table border="1" width="90%">
	<colgroup>
		<col width="12%" />
		<col width="8%" />
		<col width="8%" />
		<col width="12%" />
		<col width="15%" />
		<col width="" />
	</colgroup>
	<tbody>
		<tr>
			<th>속성</th>
			<th>필수여부</th>
			<th>동적값</th>
			<th>Type</th>
			<th>Default</th>
			<th align="left">설명</th>
		</tr>	
		<tr>
			<td>value</td>
			<td>true</td>
			<td>true</td>
			<td>java.lang.String</td>
			<td></td>
			<td align="left">형식화될 값</td>
		</tr>
		<tr>
			<td>type</td>
			<td>true</td>
			<td>true</td>
			<td>java.lang.String</td>
			<td>basic</td>
			<td align="left">형식화할 값의 구분 type <br />
			    (basic/brand/brand-alias/reduction)
			</td>
		</tr>		
		<tr>
			<td>crypt</td>
			<td>false</td>
			<td>true</td>
			<td>boolean</td>
			<td>false</td>
			<td align="left">해당 값의 암호화 여부 선택 <br />(true/false)</td>
		</tr>
		<tr>
			<td>dash</td>
			<td>false</td>
			<td>true</td>
			<td>boolean</td>
			<td>true</td>
			<td align="left">해당값에 구분자(-)를 넣을지 여부 선택 <br />(true/false)</td>
		</tr>
		<tr>
			<td>var</td>
			<td>false</td>
			<td>false</td>
			<td>java.lang.String</td>
			<td></td>
			<td class="left">형식 출력 결과 문자열을 담는 scope에 해당하는 변수명</td>
		</tr>
		<tr>
			<td>scope</td>
			<td>false</td>
			<td>false</td>
			<td>java.lang.String</td>
			<td>PageContext.PAGE_SCOPE</td>
			<td class="left">var의 scope</td>
		</tr>
	</tbody>
</table>
<div style="height:5px;"></div>	
<b>[ei:cardFormat의 예제]</b>
<table border="1" width="90%">
	<colgroup>
		<col width="10%" />
		<col width="" />
		<col width="30%" />
	</colgroup>
	<tbody>
		<tr>
			<th>구분(type)</th>
			<th>사용예</th>
			<th>결과값</th>
		</tr>
		<tr>
			<td rowspan="6">card</td>
			<td>&lt;ei:cardFormat value=&quot;4000200030004000&quot;/&gt;</td>
			<td><ei:cardFormat value="4000200030004000"/></td>
		</tr>
		<tr>
			<td>&lt;ei:cardFormat value=&quot;4000200030004000&quot; type=&quot;brand&quot;/&gt;</td>
			<td><ei:cardFormat value="4000200030004000" type="brand"/></td>
		</tr>
		<tr>
			<td>&lt;ei:cardFormat value=&quot;4000200030004000&quot; type=&quot;brand-alias&quot;/&gt;</td>
			<td><ei:cardFormat value="4000200030004000" type="brand-alias"/></td>
		</tr>
		<tr>
			<td>&lt;ei:cardFormat value=&quot;4000200030004000&quot; type=&quot;reduction&quot;/&gt;</td>
			<td><ei:cardFormat value="4000200030004000" type="reduction"/></td>
		</tr>
		<tr>
			<td>&lt;ei:cardFormat value=&quot;4000200030004000&quot; crypt=&quot;true&quot;/&gt;</td>
			<td><ei:cardFormat value="4000200030004000" crypt="true"/></td>
		</tr>		
		<tr>
			<td>&lt;ei:cardFormat value=&quot;4000200030004000&quot; crypt=&quot;true&quot; dash=&quot;false&quot;/&gt;</td>
			<td><ei:cardFormat value="4000200030004000" crypt="true" dash="false"/></td>
		</tr>				
	</tbody>
</table>

	</td>
</tr>
</table>




<div style="height:15px;"></div>
<h2>&nbsp;◎ bizFormat  - 업무에 관련된 값 형식화하기</h2>
<div style="height:5px;"></div>
<table border="1" width="95%">
<tr>
	<td>							 
<b>[ei:bizFormat의 속성]</b>
<table border="1" width="90%">
	<colgroup>
		<col width="12%" />
		<col width="8%" />
		<col width="8%" />
		<col width="12%" />
		<col width="15%" />
		<col width="" />
	</colgroup>
	<tbody>
		<tr>
			<th>속성</th>
			<th>필수여부</th>
			<th>동적값</th>
			<th>Type</th>
			<th>Default</th>
			<th align="left">설명</th>
		</tr>	
		<tr>
			<td>value</td>
			<td>true</td>
			<td>true</td>
			<td>java.lang.String</td>
			<td></td>
			<td align="left">형식화될 값</td>
		</tr>
		<tr>
			<td>type</td>
			<td>true</td>
			<td>true</td>
			<td>java.lang.String</td>
			<td></td>
			<td align="left">형식화할 값의 구분 type <br />
			    (jumin/acct/biz/corp/zip)
			</td>
		</tr>		
		<tr>
			<td>crypt</td>
			<td>false</td>
			<td>true</td>
			<td>boolean</td>
			<td>false</td>
			<td align="left">해당 값의 암호화 여부 선택 <br />(true/false)</td>
		</tr>
		<tr>
			<td>dash</td>
			<td>false</td>
			<td>true</td>
			<td>boolean</td>
			<td>true</td>
			<td align="left">해당값에 구분자(-)를 넣을지 여부 선택 <br />(true/false)</td>
		</tr>
		<tr>
			<td>var</td>
			<td>false</td>
			<td>false</td>
			<td>java.lang.String</td>
			<td></td>
			<td class="left">형식 출력 결과 문자열을 담는 scope에 해당하는 변수명</td>
		</tr>
		<tr>
			<td>scope</td>
			<td>false</td>
			<td>false</td>
			<td>java.lang.String</td>
			<td>PageContext.PAGE_SCOPE</td>
			<td class="left">var의 scope</td>
		</tr>
	</tbody>
</table>
<div style="height:5px;"></div>	
<b>[ei:bizFormat의 예제]</b>
<table border="1" width="90%">
	<colgroup>
		<col width="10%" />
		<col width="" />
		<col width="30%" />
	</colgroup>
	<tbody>
		<tr>
			<th>구분(type)</th>
			<th>사용예</th>
			<th>결과값</th>
		</tr>
		<tr>
			<td rowspan="3">jumin</td>
			<td>&lt;ei:bizFormat value=&quot;1234567890123&quot; type=&quot;jumin&quot;/&gt;</td>
			<td><ei:bizFormat value="1234567890123" type="jumin" /></td>
		</tr>			
		<tr>
			<td>&lt;ei:bizFormat value=&quot;1234567890123&quot; type=&quot;jumin&quot; crypt=&quot;true&quot;/&gt;</td>
			<td><ei:bizFormat value="1234567890123" type="jumin" crypt="true"/></td>
		</tr>
		<tr>
			<td>&lt;ei:bizFormat value=&quot;1234567890123&quot; type=&quot;jumin&quot; crypt=&quot;true&quot; dash=&quot;false&quot;/&gt;</td>
			<td><ei:bizFormat value="1234567890123" type="jumin" crypt="true" dash="false"/></td>
		</tr>	
		<tr>
			<td>acct</td>
			<td>&lt;ei:bizFormat value=&quot;1234567890123&quot; type=&quot;acct&quot; /&gt;</td>
			<td><ei:bizFormat value="1234567890" type="acct" /></td>
		</tr>			
		<tr>
			<td rowspan="3">biz</td>
			<td>&lt;ei:bizFormat value=&quot;1234567890&quot; type=&quot;biz&quot; /&gt;</td>
			<td><ei:bizFormat value="1234567890" type="biz" /></td> 
		</tr>			
		<tr>
			<td>&lt;ei:bizFormat value=&quot;1234567890&quot; type=&quot;biz&quot; crypt=&quot;true&quot;/&gt;</td>
			<td><ei:bizFormat value="1234567890" type="biz" crypt="true"/></td>
		</tr>
		<tr>
			<td>&lt;ei:bizFormat value=&quot;1234567890&quot; type=&quot;biz&quot; crypt=&quot;true&quot; dash=&quot;false&quot;/&gt;</td>
			<td><ei:bizFormat value="1234567890" type="biz" crypt="true" dash="false"/></td>
		</tr>		
		<tr>
			<td rowspan="3">corp</td>
			<td>&lt;ei:bizFormat value=&quot;1234567890123&quot; type=&quot;corp&quot;/&gt;</td>
			<td><ei:bizFormat value="1234567890123" type="corp" /></td>
		</tr>			
		<tr>
			<td>&lt;ei:bizFormat value=&quot;1234567890123&quot; type=&quot;corp&quot; crypt=&quot;true&quot;/&gt;</td>
			<td><ei:bizFormat value="1234567890123" type="corp" crypt="true"/></td>
		</tr>
		<tr>
			<td>&lt;ei:bizFormat value=&quot;1234567890123&quot; type=&quot;corp&quot; crypt=&quot;true&quot; dash=&quot;false&quot;/&gt;</td>
			<td><ei:bizFormat value="1234567890123" type="corp" crypt="true" dash="false"/></td>
		</tr>	
		<tr>
			<td>zip</td>
			<td>&lt;ei:bizFormat value=&quot;123456&quot; type=&quot;zip&quot; /&gt;</td>
			<td><ei:bizFormat value="123456" type="zip" /></td>
		</tr>					
	</tbody>
</table>

	</td>
</tr>
</table>

</ei:layoutComponent>
</ei:layoutRender>
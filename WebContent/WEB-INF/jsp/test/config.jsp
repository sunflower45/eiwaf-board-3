<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/view/layout/taglib-include.jsp"%>

<ei:layoutRender name="/view/layout/default-layout.jsp">
<ei:layoutComponent name="eiLayoutTitle">설정리소스</ei:layoutComponent>
<ei:layoutComponent name="eiLayoutContent">

<br/>
<b>[서버구분]</b>
<table border="1" width="100%">
	<colgroup>
		<col width="50%" />
		<col width="50%" />
	</colgroup>
	<tbody>
		<tr>
			<th>서버구분</th>
			<th>여부</th>
		</tr>	
		<tr>
			<td>개발서버 - Develop Server</td>
			<td>${dv}</td>
		</tr>
		<tr>
			<td>운영테스트서버 - Quality Assurance Server</td>
			<td>${qa}</td>
		</tr>
		<tr>
			<td>운영서버 - Real Server</td>
			<td>${rl}</td>
		</tr>
		<tr>
			<td>백업서버 - Disaster Recovery Server</td>
			<td>${dr}</td>
		</tr>
	</tbody>
</table>

<br/><br/>
<b>[설정값]</b>
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
			<td>
				설정서비스 : configService.getString("SVR.IP")<br/>
				속성서비스[SVR.IP.DV"] : propertiesService.getString("SVR.IP.DV")<br/>
				속성서비스["SVR.IP.RL"] : propertiesService.getString("SVR.IP.RL")
			</td>
			<td>
				설정서비스 : ${serverIp}<br/>
				속성서비스["SVR.IP.DV"] : ${serverIpPropDV}<br/>
				속성서비스["SVR.IP.RL"] : ${serverIpPropRL}
			</td>
		</tr>
		<tr>
			<td>
				설정서비스 : configService.getString("SVR.PORT")<br/>
				속성서비스["SVR.PORT.DV"] : propertiesService.getString("SVR.PORT.DV")<br/>
				속성서비스["SVR.PORT.RL" : propertiesService.getString("SVR.PORT.RL")
			</td>
			<td>
				설정서비스 : ${serverPort}<br/>
				속성서비스["SVR.PORT.DV"] : ${serverPortPropDV}<br/>
				속성서비스["SVR.PORT.RL"] : ${serverPortPropRL}
			</td>
		</tr>
	</tbody>
</table>

</ei:layoutComponent>
</ei:layoutRender>
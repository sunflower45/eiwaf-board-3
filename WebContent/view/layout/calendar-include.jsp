<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div style="display:none; border: #87b3d6 1px solid; padding: 2px 2px 2px 2px; background-color: white;" Calendar="true">
	<table style="font-size:12px;" border="0" cellspacing="1" cellpadding="1" width="161px;" bgcolor="#f4f4f4">
		<colgroup>
			<col width="23px;">
			<col width="23px;">
			<col width="23px;">
			<col width="23px;">
			<col width="23px;">
			<col width="23px;">
			<col width="23px;">
		</colgroup>
		<tbody>
			<!-- 년월 -->
			<tr style="text-align: center; background-color: #f4f4f4;">
				<td colspan="7" align="center" style="color: black; font-family: 굴림; padding-top: 4px;">
					<span style="font-family: 굴림; cursor: pointer;" CalendarEvent="preYear">◀ </span>
					<span style="font-family: 굴림; cursor: pointer;" CalendarEvent="preMonth">◀ </span>
					<span style="font-family: 굴림;" CalendarTarget="year"></span>
					<span>년 </span>
					<span style="font-family: 굴림;" CalendarTarget="month"></span>
					<span>월</span>
					<span style="font-family: 굴림; cursor: pointer;" CalendarEvent="nextMonth">▶ </span>
					<span style="font-family: 굴림; cursor: pointer;" CalendarEvent="nextYear">▶ </span>
				</td>
			</tr>
			<!-- 요일 -->
			<tr style="color: #2065da" align="center" bgcolor="#87b3d6">
				<td style="padding-top: 3px"><font color="black">일</font></td>
				<td style="padding-top: 3px"><font color="black">월</font></td>
				<td style="padding-top: 3px"><font color="black">화</font></td>
				<td style="padding-top: 3px"><font color="black">수</font></td>
				<td style="padding-top: 3px"><font color="black">목</font></td>
				<td style="padding-top: 3px"><font color="black">금</font></td>
				<td style="padding-top: 3px"><font color="black">토</font></td>
			</tr>
			<!-- 날짜 -->
			<tr>
				<td colspan="7" align="left" style="padding-right: 4px; background-color: white;">
					<table style="width: 100%;">
						<tbody CalendarTarget="day">
							<tr style="text-align: right; background-color: white;">
								<td style="cursor: pointer;"><span style="color: red; font-family: 굴림;"></span></td>
								<td style="cursor: pointer;"><span style="color: black; font-family: 굴림"></span></td>
								<td style="cursor: pointer;"><span style="color: black; font-family: 굴림"></span></td>
								<td style="cursor: pointer;"><span style="color: black; font-family: 굴림"></span></td>
								<td style="cursor: pointer;"><span style="color: black; font-family: 굴림"></span></td>
								<td style="cursor: pointer;"><span style="color: black; font-family: 굴림"></span></td>
								<td style="cursor: pointer;"><span style="color: black; font-family: 굴림"></span></td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="7" align="right" style="text-align: right; padding-top: 3px;"><span style="font-family: 굴림; cursor: pointer;" CalendarEvent="close">[닫기] </span></td>
			</tr>
		</tbody>
	</table>
</div>
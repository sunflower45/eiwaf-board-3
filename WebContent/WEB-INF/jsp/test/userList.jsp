<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/view/layout/taglib-include.jsp"%>

<ei:layoutRender name="/view/layout/default-layout.jsp">
<ei:layoutComponent name="eiLayoutTitle">메인서브화면</ei:layoutComponent>
<ei:layoutComponent name="eiLayoutContent">

<script type="text/javascript" src="/js/eiwaf/eiwaf.calendar.js"></script>
<%@ include file="/view/layout/calendar-include.jsp" %>
<script type="text/javascript">
//<![CDATA[
	function eiwaf_DocumentReady(status) {
		$("#st_login_dt, #ed_login_dt").eiwafCal();
		DoList(1);
	}

	function DoList(pageNo) {
		var f = document.form1;
		if (!grf_IsDateTerm(f.st_login_dt, f.ed_login_dt)) {
			return;
		}
		f.page_no.value = pageNo;
		svcf_Ajax("/test/userListAjax.do", f, {
			contentExpr: "#divUserList",
			sendFn: grf_AjaxStart,
			stopFn: grf_AjaxEnd
		});
	}

	function DoDetail(uid) {
		var f = document.form1;
		f.user_id.value = uid;
		svcf_Submit();
	}

	function CheckAll(){
		uif_CheckAll("#tblList", "chk_box", "#chkAll");
		alert(uif_CheckCount("#tblList", "chk_box"));
	}
//]]>
</script>

<form:form commandName="userPVO" name="form1" FormEvent="true" EnterAction="DoList(1);">
	<form:hidden path="page_no"/>
	<input type="hidden" name="user_id"/>

	<fieldset class="linebox_Gray">
	<table style="width:100%">
		<tr>
			<td>
				<table>
					<tr>
						<td class="Inqtit">성명</td>
						<td class="Inqcon">
							<form:input path="name" class="in" style="width:100px" title="성명" InputType="true" EnterAction="true"/>
						</td>
						<td class="Inqtit">사용자상태</td>
						<td class="Inqcon">
							<form:select path="user_status" items="${codeList}" itemValue="key" itemLabel="value" class="se" title="사용자상태" name="f1"/>
						</td>
						<td class="Inqtit">로그인일시</td>
						<td class="Inqconcal">
							<form:input path="st_login_dt" class="in" size="10" maxlength="8" InputType="date"/>
							<img src="/images/btn_cal.gif" class="btn_cal" CalendarIcon="st_login_dt"/>
							~ <form:input path="ed_login_dt" class="in" size="10" maxlength="8" InputType="date"/>
							<img src="/images/btn_cal.gif" class="btn_cal" CalendarIcon="ed_login_dt"/>
						</td>
						<td>
							<ul class="ul-period01">
								<ei:dateTerm startInput="document.form1.st_login_dt" endInput="document.form1.ed_login_dt">
									<li><ei:dateTermValue pattern="d" amount="0"><img src="/images/btn_cal_d1.gif" alt="당일" /></ei:dateTermValue></li>
									<li><ei:dateTermValue pattern="d" amount="7"><img src="/images/btn_cal_d7.gif" alt="1주일" /></ei:dateTermValue></li>
									<li><ei:dateTermValue pattern="d" amount="15"><img src="/images/btn_cal_d15.gif" alt="15일" /></ei:dateTermValue></li>
									<li><ei:dateTermValue pattern="M" amount="1"><img src="/images/btn_cal_m1.gif" alt="1개월" /></ei:dateTermValue></li>
								</ei:dateTerm>
							</ul>
						</td>
					</tr>
				</table>
			</td>
			<td class="Inqvline center" width="70"> 
				<span class="buttonStyle01 basic"><button type="button" class="buttonStyle01" onclick="DoList(1);">검색</button></span>
			</td>
		</tr>
	</table>
	</fieldset>
</form:form>

<form name="form2">
	<div id="divUserList"></div><!-- 사용자 목록 -->
</form>

</ei:layoutComponent>
</ei:layoutRender>
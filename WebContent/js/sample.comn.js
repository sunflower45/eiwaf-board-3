/* SAMPLE | common */

document.domain = "e4net.net";

var samplefv_Hostname = window.location.hostname;
var samplefv_Config;
if (samplefv_Hostname == "eiwaf.e4net.net") {
	samplefv_Config = "RL";
} else if (samplefv_Hostname == "teiwaf.e4net.net") {
	samplefv_Config = "ST";
} else {
	samplefv_Config = "DV";
}

//지자체 사이트 분기 URL 정보
function samplef_GateUrl() {
	var url = "/";
	var pfId = (typeof gvPfId  == "undefined") ? uif_GetCookie("pfId") : gvPfId;
	if (utlf_IsNullOrEmpty(pfId)) {
		return url;
	}
	return (url += pfId + "/");
}

//eiwaf_IntroPag 재정의
function eiwaf_IntroPag() {
	if (window.self.name == 'mainframe') {
		window.top.location.reload();
	} else {
		eiwaf_IntroPagInternal(samplef_GateUrl());
	}
}

//top 프레임 타이틀
function samplef_DocumentTitle() {
	if (window.parent) {
		try { window.parent.document.title = document.title; } catch(e) {}
	}
}

//검색 공통 Append 처리
function samplef_TBodyAppendCallback(status, data) {
	if (this.command == "INIT") {
		$(this.contentExpr).empty();
		$(this.commandButtonExpr).css("visibility", "hidden");
	}
	if (status.code == 0) {
		$(this.contentExpr).append(data.Content);
		if(data.Param.nxtPageYn == "Y") {
			$("#nxtKeyValTxt").val(data.Param.nxtKeyValTxt);
			$(this.commandButtonExpr).css("visibility", "visible");
		}else{
			$(this.commandButtonExpr).css("visibility", "hidden");
		}
	}else{
		alert(status.message);
	}
}

//RD 팝업 호출
function samplef_RdPopup(fnName, fnValue, attrs) {
	svcf_Link("/plugin/rd/report.jsp",
			new eiwaf.Params().add("fnName", utlf_Nvl(fnName, "")).add("fnValue", utlf_Nvl(fnValue, "")).getQueryString(),
			"_RD_POPUP", utlf_Nvl2(attrs, "width=780, height=700"));
}

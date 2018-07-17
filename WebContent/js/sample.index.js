/* SAMPLE | index */
document.domain = "e4net.net";

function idxf_CheckFrameset() {
	if (window.top != window.self) {
		window.top.location.href = window.self.location.href;
	}
}

function idxf_WriteFrameset(pfId) {
	if (pfId) {
		idxf_CheckFrameset();
		var reUrl = idxf_QueryString("reUrl");
		var svcUrl = reUrl == "" ? "/app/main/mainView.do" : reUrl;
		var url = svcUrl + (svcUrl.indexOf("?") > -1 ? "&" : "?") + "pfId=" + pfId;
		document.write("<frameset rows=\"*\" title=\"정책자금 통합관리시스템\">");
		document.write("	<frame name=\"mainframe\" id=\"mainframe\" src=\"" + url + "\" title=\"내용\" frameborder=\"0\" scrolling=\"auto\" noresize=\"noresize\"></frame>");
		document.write("</frameset>");
	} else {
		alert("정책자금 통합관리시스템 아이디가 없습니다.");
	}
}

function idxf_IndexPfId() {
	var pfId = window.location.href.split("/")[3];
	document.cookie = "pfId=" + pfId + "; path=/";
	return pfId;
}

function idxf_QueryString(strParam) {
	var qrystr = window.location.href;
	var parms = (qrystr.slice(qrystr.indexOf("?") + 1, qrystr.length)).split("&");
	for (var ii = 0; ii < parms.length; ++ii) {
		var idx = parms[ii].indexOf("=");
		if (idx > 0) {
			if (parms[ii].substring(0, idx) == strParam) {
				return decodeURIComponent(parms[ii].substring(idx + 1));
			}
		}
	}
	return "";
}
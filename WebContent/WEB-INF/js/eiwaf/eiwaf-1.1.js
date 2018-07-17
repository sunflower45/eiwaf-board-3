/**
 * E4NET EIWAF(Enterprise Integration Web App Framework).
 * This notice must be untouched at all times.
 * Copyright (c) 1996-2012 {@link http://www.e4net.net E4NET} Ltd, Co.
 * All rights are reserved.
 * 
 * @author E4NET
 * @version 1.1
 */
//컨텍스트 메뉴 기능 막기
//$(document).bind('contextmenu', function (e) { return false; });
//폼컨트롤 기능(CTRL/ALT)키 이벤트  막기 여부
var eiwafv_SetPreventFnKey = false;
//소스인코딩(UTF-8, 기타)
var eiwafv_VarCharByteType = "ANSI";
//ajax timeout
var eiwafv_VarAjaxTimeout = 5000;
//focusin 날짜 포멧
var eiwafv_VarDateInPattern = "yyyyMMdd";
//focusout 날짜 포멧
var eiwafv_VarDateOutPattern = "yyyy.MM.dd";
var eiwafv_MsgErrorTitle = "죄송합니다";
var eiwafv_MsgSystemException = "시스템 장애가 발생했습니다.\n\n문제가 계속 발생하면 관리자에게 문의하시기 바랍니다.";
var eiwafv_MsgAjaxError = "현재 통신량이 많아 업무처리가 지연되고 있습니다.\n\n잠시 후 다시 사용하여 주십시오.\n\n문제가 계속 발생하면 관리자에게 문의하시기 바랍니다.";
var eiwafv_MsgOnlyNumber = "숫자만 입력이 가능합니다.";
var eiwafv_MsgInvalidFormat = "입력가능한 형식이 아닙니다.";
var eiwafv_MsgOverflowInput = "입력가능한 길이를 초과하였습니다.";
var eiwafv_MsgInvalidDate = "유효하지 않은 날짜/시간입니다.";
var eiwafv_MsgNullOrEmpty1 = "항목이 입력되지 않았습니다.";
var eiwafv_MsgNullOrEmpty2 = "항목을 선택하십시오.";
//브라우져 체크
var eiwafv_Browser;
if ($.browser.msie) {
	eiwafv_Browser = 'msie';
} else if ($.browser.mozilla) {
	eiwafv_Browser = 'mozilla';
} else if ($.browser.safari) {
	if (/chrome/.test(navigator.userAgent.toLowerCase())) {
		eiwafv_Browser = 'chrome';
	} else {
		eiwafv_Browser = 'safari';
	}
} else if ($.browser.opera) {
	eiwafv_Browser = 'opera';
} else {
	eiwafv_Browser = 'mozilla';
}
//ajax 실패 처리(-1 보다 작은 코드 값)
var eiwaf_AjaxFailHandle = function (status, data) {
		uif_AlertMsg("응답", utlf_Nvl(status.message, "").br2nl());
		if (status.code == -200) {
			eiwaf_IntroPag();
		} else {

		}
	};
//ajax 예외 처리(textStatus: "success", "notmodified", "error","timeout", "parsererror", "dataerror")
var eiwaf_AjaxOptionError = function (xhr, textStatus, thrownError) {
		uif_AlertMsg(eiwafv_MsgErrorTitle, eiwafv_MsgAjaxError + " (" + textStatus + ")");
	};
//window.onload와 같은 역할을 하는 함수
function eiwaf_InitDocumentReady(status) {
	$('body').focus();
	$('form').eiwafLoadFormEvent();
	eiwaf_DocumentReady(status);
}
//eiwaf_DocumentReady 인터페이스(override) 함수
function eiwaf_DocumentReady(status) {

}
//사이트 intro 또는 로그인 화면으로 이동하는 함수
function eiwaf_IntroPag(url) {
	var r = utlf_Nvl(url, "/");
	if (window.opener && window.opener.name) {
		window.opener.top.location.href = r;
		uif_SelfClose();
	} else {
		window.top.location.href = r;
	}
}

document.write("<script type=\"text/javascript\" src=\"../js/eiwaf/eiwaf.core.js\"><\/script>");
document.write("<script type=\"text/javascript\" src=\"../js/eiwaf/eiwaf.tag." + eiwafv_Browser + ".js\"><\/script>");
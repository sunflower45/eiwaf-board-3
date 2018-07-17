/* eiwaf-ui v1.0.0 | CommonUtil | (c)E4NET Ltd, Co. */
function cmf_AjaxStart() {
	var message = cmf_AjaxMessage(utlf_Nvl(this.procType, "Q"));
	if (this.dimmed || this.showLoading) {
		cmf_AjaxRemainContent(this, message);
	} else if (this.contentExpr) {
		var ceObj = $(this.contentExpr);
		if (ceObj.is(":empty") || this.contentRemain == false) {
			this.internalContentRemain = false;
			cmf_AjaxClearContent(this, message, ceObj);
		} else {
			this.internalContentRemain = true;
			cmf_AjaxRemainContent(this, message, ceObj);
		}
	} else {
		this.showLoading = true;
		cmf_AjaxRemainContent(this, message);
	}
}

function cmf_AjaxEnd() {
	cmf_HideLoading(this.dimmed);
	if (this.contentExpr) {
		if (this.internalContentRemain != true) {
			$(this.contentExpr + " div.loadingBox:eq(0)").remove();
		}
	}
}

function cmf_AjaxMessage(svc) {
	var message;
	if      (svc == "Q") { message = "요청"; }
	else if (svc == "R") { message = "조회"; }
	else if (svc == "I") { message = "등록"; }
	else if (svc == "U") { message = "수정"; }
	else if (svc == "D") { message = "삭제"; }
	else if (svc == "P") { message = "인쇄"; }
	else                 { message = svc;    }
	return message;
}

function cmf_AjaxClearContent(options, message, ceObj) {
	var jObj = $("#eiJsInnerLoading");
	if (jObj.length == 0) {
		jObj = $("<div id='eiJsInnerLoading' style='display:none;'><div class='loadingBox'><div class='loading'><div class='bar'><img src='/image/common/loading.gif' alt='loading'/></div><div class='txt'><div class='tl'><span id='eiJsInnerLoadingSvc'></span> 처리중 입니다.</div><div class='ds'> 잠시만 기다려 주시기 바랍니다.</div></div></div></div></div>").appendTo("body");
	}
	$("#eiJsInnerLoadingSvc").html(message);
	ceObj.html(jObj.html());
}

function cmf_AjaxRemainContent(options, message, ceObj) {
	if (options.dimmed == true || this.showLoading == true) {
		cmf_ShowLoading(message, options.dimmed);
	} else {
		var jObj = cmf_LoadingFloatObject(message);
		var bObj = null;
		if (utlf_IsNull(ceObj)) {
			ceObj = $(options.dimmed || this.showLoading);
			if (options.dimmed) {
				bObj = cmf_LoadingBackGroundObject();
			}
		}
		jObj = jObj.add(bObj);
		if (ceObj && ceObj.length > 0) {
			jObj.css({
				left: ceObj.offset().left + 'px',
				top: ceObj.offset().top + 'px',
				width: ceObj.css('width'),
				height: ceObj.css('height')
			}).show();
		} else {
			jObj.show().center();
		}
	}
}

function cmf_LoadingFloatObject(message) {
	var jObj = $("#eiJsFloatLoading");
	if (jObj.length == 0) {
		jObj = $("<div id='eiJsFloatLoading' style='display:none;position:absolute;z-index:901;'><div class='loading2'><div class='bar'><img src='/image/common/loading.gif' alt='loading'/></div><div class='txt'><div class='tl'><span id='eiJsFloatLoadingSvc'></span> 처리중 입니다.</div><div  class='ds'> 잠시만 기다려 주시기 바랍니다.</div></div></div></div>").appendTo("body");
	}
	if (message) {
		$("#eiJsFloatLoadingSvc").html(message);
	}
	return jObj;
}

function cmf_LoadingBackGroundObject() {
	var jObj = $("#eiJsDimmedBackGround");
	if (jObj.length == 0) {
		jObj = $("<div id='eiJsDimmedBackGround' class='dimedWrap' style='display:none;z-index:900;'><img src='/image/common/bg_dimed.png' width='100%' height='100%' alt='' /></div>").appendTo("body");
	}
	return jObj;
}

function cmf_ShowLoading(message, dimmed) {
	if (dimmed) {
		cmf_LoadingBackGroundObject().show();
	}
	cmf_LoadingFloatObject(message).show().center();
}

function cmf_HideLoading(dimmed) {
	cmf_LoadingFloatObject().hide();
	if (dimmed) {
		cmf_LoadingBackGroundObject().hide();
	}
}

function cmf_IsDateTerm(startInput, endInput, dPattern) {
	var isInput = uif_IsHTMLInputElement(startInput);
	var sdate, edate;
	if (isInput) {
		sdate = startInput.value;
		edate = endInput.value;
		dPattern = utlf_Nvl(dPattern, Date.OutPattern);
	} else {
		sdate = startInput;
		edate = endInput;
	}
	if (utlf_ParseDate(sdate, dPattern) > utlf_ParseDate(edate, dPattern)) {
		if (isInput) {
			var stitle = utlf_Nvl2(startInput.title, "시작일");
			var etitle = utlf_Nvl2(endInput.title, "종료일");
			uif_AlertMsg(stitle + "이 " + etitle + "보다 큽니다.", endInput);
		} else {
			uif_AlertMsg("시작일이 종료일보다 큽니다.");
		}
		return false;
	}
	return true;
}

var cmfv_IsDoubleSubmit;
function cmf_IsDoubleSubmit(timeout) {
	if (cmfv_IsDoubleSubmit) {
		return true;
	}
	setTimeout(function() { cmfv_IsDoubleSubmit = false; }, utlf_Nvl(timeout, 2000));
	cmfv_IsDoubleSubmit = true;
	return false;
}

function cmf_Iframe(type, title) {
	var name = "eiJsIframe_" + type;
	var jObj = $("#" + name);
	if (jObj.length == 0) {
		var ititle;
		if (type == 'download') {
			ititle = utlf_Nvl2(title, "파일다운로드");
		} else if (type == 'upload') {
			ititle = utlf_Nvl2(title, "파일업로드");
		} else if (type == 'excel') {
			ititle = utlf_Nvl2(title, "엑셀다운로드");
		} else if (type == 'print') {
			ititle = utlf_Nvl2(title, "인쇄");
		} else {
			ititle = utlf_Nvl2(title, "내용없음");
		}
		jObj = $("<iframe id=\"" + name + "\" name=\"" + name + "\" title=\"" + ititle + "\" style=\"display:none;\"></iframe>").appendTo("body");
	}
	return jObj.attr("name");
}

function cmf_LoadContent(url, options) {
	var opts = $.extend({ dataType: "text", cache: false }, options);
	opts.url = url;
	opts.success = function (data) {
		if (this.callbackFn) {
			this.callbackFn.call(this, data);
		} else {
			var jObj = $(this.contentExpr);
			if (jObj.length == 0) {
				jObj = $("<div id='" + this.contentExpr.substring(1) + "' LoadContent='true'></div>").hide().appendTo("body");
			}
			jObj.html(data);
			jObj.show();
		}
	};
	opts.error = function (xhr, textStatus, thrownError) {
		eiwaf_AjaxOptionError.call(this, xhr, textStatus, thrownError);
	};
	return $.ajax(opts);
}

function cmf_LoadContentHide(obj, empty) {
	var dObj = $(obj).closest("[LoadContent='true']").hide();
	if (empty) {
		dObj.empty();
	}
}

function cmf_IsPopupWindow() {
	return $("body").is("[PopupBody=true]");
}

function cmf_MessageEvent(obj, msgEvent) {
	$(obj).click(function(){
		try {
			var url;
			if (!utlf_IsNullOrBlank(msgEvent)) {
				url = msgEvent;
			} else if (!(typeof gvDefaultUrl == "undefined" || utlf_IsNullOrBlank(gvDefaultUrl))) {
				url = gvDefaultUrl;
			} else if (cmf_IsPopupWindow()) {
				url = "javascript:uif_SelfClose();";
			} else {
				url = "javascript:eiwaf_IntroPag();";
			}
			eval(url.startsWith("javascript:") ? url.substring(11) : "svcf_Link(\"" + url + "\")");
		} catch (e) {
			eiwaf_IntroPag();
		}
		return false;
	});
}

function cmf_Title(title, tab1, tab2) {
	document.title = title + (tab1 ? " :: " + tab1 + (tab2 ? " :: " + tab2 : "") : "") + " - 사이트명";
}

function cmf_TitleTab(tab1, tab2) {
	if (typeof gvPageTitle != "undefined") {
		cmf_Title(gvPageTitle, tab1, tab2);
	} else {
		cmf_Title(tab1, tab2);
	}
}
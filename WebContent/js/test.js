/**
 * 날짜 기간설정 유효성 검사.
 * - dPattern 기본값 - Date.FocusFormat
 * - 예1 : grf_IsDateTerm("20100102", "20100101"), 기본형: yyyyMMdd
 * - 예2 : grf_IsDateTerm(document.form1.start_date, document.form1.end_date), 기본형: yyyy.MM.dd
 * @param {HTMLInputElementOrString} startInput 시작일자 input 또는 값
 * @param {HTMLInputElementOrString} endInput 종료일자 input 또는 값
 * @param {String} dPattern 날짜패턴 [optional]
 * @return 체크 결과
 * @type Boolean
 */
function grf_IsDateTerm(startInput, endInput, dPattern) {
	var isInput = false;
	if (typeof startInput == "object" && startInput.constructor == HTMLInputElement) {
		isInput = true;
	}
	var sdate, edate;
	if (isInput) {
		sdate = startInput.value;
		edate = endInput.value;
		dPattern = utlf_Nvl(dPattern, "yyyy.MM.dd");
	} else {
		sdate = startInput;
		edate = endInput;
	}
	if (sdate.parseDate(dPattern) > edate.parseDate(dPattern)) {
		if (isInput) {
			var stitle = utlf_Nvl2(startInput.title, "시작일");
			var etitle = utlf_Nvl2(endInput.title, "종료일");
			uif_AlertMsg("기간설정", stitle + "이(가) " + etitle + "보다 큽니다.");
			uif_Focus(endInput);
		} else {
			uif_AlertMsg("기간설정", "시작일이 종료일보다 큽니다.");
		}
		return false;
	}
	return true;
}

/**
 * Ajax통신이 송신되어지기 전에 호출되는 Ajax event.
 * 함수 안에서 this 는 Ajax 호출 시 사용한 옵션이다.
 * @type void
 */
function grf_AjaxStart() {
	var svc = utlf_Nvl(this.processClss, "Q");
	var message;
	if      (svc == "Q") { message = "요청"; }
	else if (svc == "R") { message = "조회"; }
	else if (svc == "I") { message = "등록"; }
	else if (svc == "U") { message = "수정"; }
	else if (svc == "D") { message = "삭제"; }
	else if (svc == "P") { message = "인쇄"; }
	else                 { message = svc;    }
	if (this.dimmed) {
		grf_AjaxRemainContent(this, message);
	} else if (this.contentExpr) {
		if (this.contentRemain == false) {
			grf_AjaxClearContent(this, message);
		} else {
			var dimTar = $(this.contentExpr);
			if (utlf_IsNullOrBlank(dimTar.html())) {
				this.internalContentRemain = false;
				grf_AjaxClearContent(this, message);
			} else {
				this.internalContentRemain = true;
				grf_AjaxRemainContent(this, message, dimTar);
			}
		}
	}
}

/**
 * Ajax통신이 완료시 호출되는 event, sccuess 와 error이 호출되어진 후에 호출되는 Ajax Event.
 * 함수 안에서 this 는 Ajax 호출 시 사용한 옵션이다.
 * @type void
 */
function grf_AjaxEnd() {
	if (this.dimmed || this.contentRemain != false) {
		$("#divAjaxLoading2").hide();
	}
	if (this.internalContentRemain != true) {
		if (this.contentExpr) {
			$(this.contentExpr + " .tblLoadingBlock").remove();
		}
	}
}

/**
 * private 메소드
 * @param options
 * @param message
 * @private
 */
function grf_AjaxClearContent(options, message) {
	var jObj = $("#divAjaxLoading");
	if (jObj.length == 0) {
		jObj = $(
				"<div id=\"divAjaxLoading\" style=\"display:none;\"><table class=\"tblLoadingBlock\" border=\"0\" width=\"100%\" height=\"180\"><tr><td align=\"center\"><table class=\"tblLoadingBar\" border=\"0\" width=\"245\" height=\"50\"><tr><td><img src=\"/images/loading_01.gif\" style=\"position:absolute;top:7px;left:18px;\" /><p style=\"position:absolute;top:15px;left:65px;\"><strong><span id=\"spnAjaxLoadingSvc\"></span>&nbsp;처리중입니다.</strong></p></td></tr></table></td></tr></table></div>"
			).appendTo("body");
	}
	$("#spnAjaxLoadingSvc").html(message);
	$(options.contentExpr).html(jObj.html());
}

/**
 * private 메소드
 * @param options
 * @param message
 * @param dimTar
 * @private
 */
function grf_AjaxRemainContent(options, message, dimTar) {
	var jObj = $("#divAjaxLoading2");
	if (jObj.length == 0) {
		jObj = $(
				"<div id=\"divAjaxLoading2\" style=\"position:absolute; display:none; z-index:9999;\"><table class=\"tblLoadingBar\" border=\"0\" width=\"245\" height=\"50\"><tr><td><img src=\"/images/loading_01.gif\" style=\"position:absolute;top:7px;left:18px;\" /><p style=\"position:absolute;top:15px;left:65px;\"><strong><span id=\"spnAjaxLoadingSvc2\"></span>&nbsp;처리중입니다.</strong></p></td></tr></table></div>"
			).appendTo("body");
	}
	$("#spnAjaxLoadingSvc2").html(message);
	var barObj = $("table:first", jObj);
	var barOpts = {
			margin: '0px auto',
			left: '0px',
			top: '34%',
			position: 'relative'
		};
	if (dimTar) {
		jObj.css({
				left: dimTar.offset().left + 'px',
				top: dimTar.offset().top + 'px',
				width: dimTar.css('width'),
				height: dimTar.css('height')
			});
	} else {
		var opts = {
				left: '0px',
				top: '0px'
			};
		if (options.dimmed != true) {
			opts.width = '245px';
			opts.height = '0px';
			opts = $.extend(opts, options.dimmed);
		} else {
			opts.width = $(document).width() + 'px';
			opts.height = $(document).height() + 'px';
			barOpts.top = (($(window).height() - barObj.outerHeight()) / 2) + ($(window).scrollTop() || 0) + 'px';
		}
		jObj.css(opts);
	}
	barObj.css(barOpts);
	jObj.show();
}
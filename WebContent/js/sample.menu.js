/* SAMPLE | menu */

function menuf_DocumentReady(login) {
	if (login) {
		$(window).load(function() {
			menuf_LoginTimer();
			menuf_HtmlLoginTimer();
		});
	}
}

var menufv_MenuMap = [];
var menuf_MenuItem = null;
var menuf_MenuEtt = {
	add: function(key, value, type) {
		menufv_MenuMap[key] = (type ?  '@' + type + "|" : "") + value;
	},
	init: function(key) {
		var mn = menufv_MenuMap[key];
		if (!utlf_IsNull(mn)) {
			if (mn.charAt(0) == '@') {
				var val = mn.substring(1).split("|");
				var idxs = val[1].split(',');
				menuf_MenuItem = { type: 'lnb', lnb: val[0], indexes: idxs };
			} else {
				var idxs =  mn.split(',');
				menuf_MenuItem = { type: 'gnb', lnb: idxs[0], indexes: idxs };
			}
		}
	}
};

function menuf_GnbMenuEvent() {
	menuf_MenuEtt.init(gvMenuId);
	var jGnb = $("#gnb");
	var jObj = jGnb.children("li");
	jObj.add("li", jObj)
		.bind("mouseenter focusin", function() {
			$(this)
				.addClass("on")
				.children("ul").show()
				.end()
				.siblings(".on").removeClass("on")
				.children("ul").hide();
		})
		.bind("mouseleave", function() {
			$(this).removeClass("on").children("ul").hide();
		});

	var timeoutObj = null;
	jGnb.bind("mouseenter", function() {
			clearTimeout(timeoutObj);
		})
		.bind("mouseleave", function() {
			timeoutObj = setTimeout(function(){ menuf_InitGnbMenuEvent(jObj); }, 700);
		});

	menuf_InitGnbMenuEvent(jObj);
}

function menuf_InitGnbMenuEvent(jObj) {
	var mn = menuf_MenuItem;
	if (mn && mn.type == 'gnb') {
		jObj.eq(mn.indexes[0]).addClass("on")
			.children("ul").show()
			.children("li")
			.eq(mn.indexes[1]).addClass("over");
	}
}

function menuf_HtmlLnbMenu() {
	var mn = menuf_MenuItem;
	var lObj = $("#eiLayoutLnb");
	var sObj = $("#eiLayoutSubject");
	try {
		if (mn) {
			lObj.html(eval("menuf_HtmlLnbMenu_" + mn.lnb + "()"));
			var indexes = mn.indexes;
			var lineMap = [lObj.children("h2:first").text()];
			var jObj = lObj.children("ul:first");
			var iObj1 = jObj.find("> li > a").eq(indexes[1]);
			if (iObj1.length > 0) {
				lineMap.push(iObj1.text());
				iObj1.parent().addClass("on");
				var iObj2 = iObj1.next().find("> li > a").eq(indexes[2]);
				if (iObj2.length > 0) {
					lineMap.push(iObj2.text());
					iObj2.parent().addClass("on");
				}
			}
			jObj.find("li:not(.on)")
				.bind("focusin", function() {
					$(this).addClass("on");
				})
				.bind("focusout", function() {
					$(this).removeClass("on");
				});
			var bIdx = lineMap.length - 1;
			sObj.text(lineMap[bIdx]);
			lineMap[bIdx] = "</span><em>" + lineMap[bIdx] + "</em>";
			$("#eiLayoutLocation").append("<span>" + lineMap.join("</span> <span class='bar'>&gt;</span> <span>"));
		} else {
			sObj.text(gvPageTitle);
			alert("고객님께서 요청하신 페이지는 \n현재 서비스되고 있지 않거나 페이지명이 변경되었습니다.");
		}
	} catch (e) {
		sObj.html(gvPageTitle);
		alert("화면 표시중 에러가 발생했습니다. \n잠시 후 다시 이용하여 주시기 바랍니다.");
	}
}

function menuf_Logout(auto) {
	window.location.href = "/app/main/logout.do?auto=" + utlf_Nvl(auto, "false");
	return false;
}

function menuf_HtmlLoginTimer() {
	$("body").append("\
<div id='divLoginTimer' class='layerPop' style='width:589px;display:none;'>\
	<div class='layerInner01'></div><div class='layerInner02'></div>\
	<div class='layerHeader'>\
		<div class='tit'><h1>이용안내</h1></div>\
		<a href='#none' onclick='return menuf_CheckLogin();' class='close'><span class='hide'>닫기</span></a>\
	</div>\
	<div class='layerContaniner'>\
		<div class='layerCon01'><div class='layerCon02'>\
			<div class='errorArea'>\
				<div class='imgArea'><img src='/image/common/limittime.gif' alt='이용안내 이미지' /></div>\
				<div class='txtArea'>\
					<h2><em><span id='spnLoginTimer'>60</span>초 후</em> 자동으로 로그아웃 예정입니다.</h2>\
					<p class='txt'>안전한 서비스 이용을 위하여 <em>10분 동안</em> 거래가<br />없으실 경우, <em>자동으로 로그아웃</em> 됩니다.</p>\
					<p class='txt txtLine'>로그인 시간을 연장하시려면 ‘시간 연장’ 버튼을 <br />클릭하여주시기 바랍니다.</p>\
					<div class='btnArea pb0'>\
						<span class='mbtn'><a id='aLoginTimerConfirm' href='#none' onclick='return menuf_CheckLogin();'>시간연장</a></span>\
						<span class='mbtn mbtnT02'><a href='#none' onclick='return menuf_Logout();'>로그아웃</a></span>\
					</div>\
				</div>\
				<div class='clear'></div>\
			</div>\
		</div></div>\
	</div>\
</div>\
<div id='divLoginTimerDimmed' class='dimedWrap' style='z-index:9999;display:none;'><img src='/image/common/bg_dimed.png' width='100%' height='100%' alt='' /></div>\
		");
}

var eiwafTimer;
function menuf_LoginTimer() {
	var jObj = $("#eiLayoutTimer");
	var tObj = null;
	eiwafTimer = new eiwaf.Timer(15,
			function() {
				menuf_Logout(true);
			},
			function(mm, ss) {
				var s = (ss < 10 ? "0" + ss : ss);
				if (mm < 1) {
					if (!tObj) {
						tObj = $("#divLoginTimer");
					}
					if (!tObj.is(":visible")) {
						$("#divLoginTimerDimmed").show();
						tObj.center().show();
						$("#aLoginTimerConfirm").focus();
					}
					$("#spnLoginTimer").text(s);
				}
				jObj.text((mm < 10 ? "0" + mm : mm) + ":" + s);
			}
		);
	eiwafTimer.start();
}

function menuf_CheckLogin() {
	eiwafTimer.stop();
	svcf_Ajax("/app/main/loginCheck.do", null, {
		type: "GET",
		callbackFn: function(status, data){
			if (status.code != 0) {
				alert(status.message);
				if (status.msgCode == "STATUS.SessionTimeout") {
					eiwaf_IntroPag();
				}
				return;
			}
			eiwafTimer.start();
			$("#divLoginTimer, #divLoginTimerDimmed").hide();
		}
	});
	return false;
}

function menuf_SubTile(title) {
	$("#eiLayoutSubject").text(title);
}

function menuf_IntroPag() {
	window.top.location.href = samplef_GateUrl();
}

function IfrmContentLink(menuUrl, data) {
	svcf_Link(menuUrl, data, "ifrmContent");
}

dTree.prototype.addMenuInfo = function(id, pid, name, url, menuCd) {
	this.add(id, pid, name, url, null, null, null, null, null, menuCd)
};

dTree.prototype.getTitle = function(node) {
	if (node.title) {
		return node.title;
	} else {
		return node.name;
	}
};

dTree.prototype.lineMap = function(nodeId) {
	var cn = this.aNodes[this.aNodesPath[nodeId]];
	if (cn == null) {
		cn = this.aNodes[this.selectedNode];
	}
	var m = [];
	while (true) {
		if (cn.pid == this.root.id) {
			break;
		}
		m.push(this.getTitle(cn));
		cn = this.aNodes[this.aNodesPath[cn.pid]];
	}
	return m.join(" &gt; ");
};

dTree.prototype.getSelectedNode = function() {
	return this.aNodes[this.selectedNode];
};

dTree.prototype.openTo2 = function(mnid) {
	var cn = this.aNodes[this.aNodesPath[mnid]];
	this.openTo(cn.id, true);
	return cn;
};

dTree.prototype.unselected = function() {
	if (this.selectedNode || this.selectedNode == 0) {
		eOld = document.getElementById("s" + this.obj + this.selectedNode);
		eOld.className = "node";
	}
	this.selectedNode = null;
	fvALLSysImproPageId = null;
};

function MainPageInitMainMenuTree(menuobj) {
	menuobj.config.inOrder = true;
	menuobj.config.useLineMap = true;
	menuobj.config.useCookies = false;
}

function MainPageDisplayMainMenuTree(divname, menuobj) {
	var divobj = $("#" + divname);
	$(divobj).html(menuobj.toString());
	$("div:first>div:first", divobj).hide();
	var oDepthCheckStr;
	$("div:first>div:eq(1)>*", divobj).filter(".dTreeNode").find("a:first, img:first").each(function() {
		var str = this.href;
		if (str) {
			if ('IMG' == this.tagName && 'nolines_plus_s.gif' == str.substring(str.lastIndexOf('/') + 1)) {
				eval(oDepthCheckStr);
			} else {
				oDepthCheckStr = str.substring('javascript:'.length);
			}
		}
	});
}

function LeftMenuLink(svcclss, menuid, data, tar, attr, closeAll) {
	if (closeAll) {
		fvALLMainMenu.closeAll();
	}
	var n = fvALLMainMenu.openTo2(menuid);
	var sc = n.url.substring('javascript:'.length);
	eval(sc.substring(0, sc.length - 1) + ",'" + utlf_Nvl(data, "") + "','" + utlf_Nvl(tar, "_self") + "','" + utlf_Nvl(attr, "") + "')");
}

function MainPageLineMap(menuId) {
	SetSysImproPageId(menuId);
	return GetMainMenuTreeObject().lineMap(menuId);
}

function SetSysImproPageId(menuId) {
	fvALLSysImproPageId = menuId;
}

function GetSysImproPageId() {
	return fvALLSysImproPageId;
}

function GetMainMenuTreeObject() {
	return fvALLMainMenu;
}

function GetMainMenuItemLink() {
	return GetMainMenuTreeObject().getSelectedNode();
}

function FlashfObject(swf, width, height, flashvars) {
	if (navigator.appName.indexOf("Microsoft") != -1) {
		document.write('<object id="FlashMovie" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" ');
		document.write('codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=version=8,0,0,0" width="' + width + '" height="' + height + '">');
		document.write('<param name="movie" value="' + swf + '"/>');
		document.write('<param name="FlashVars" value="' + flashvars + '"/>');
		document.write('<param name="quality" value="best"/>');
		//document.write('<param name="bgcolor" value="' + bgcolor + '"/>');
		document.write('<param name="menu" value="false"/>');
		document.write('<param name="salign" value="LT"/>');
		document.write('<param name="scale" value="noscale"/>');
		document.write('<param name="wmode" value="transparent"/>');
		// document.write('<param name="allowScriptAccess" value="sameDomain"/>');
		document.write('<param name="allowScriptAccess" value="always"/>');
		document.write('</object>');
	} else {
		document.write('<embed src="' + swf + '"  name="FlashMovie"   ');
		document.write('quality="best" ');
		//document.write('bgcolor="' + bgcolor + '" ');
		document.write('width="' + width + '" ');
		document.write('height="' + height + '" ');
		document.write('menu="false" ');
		document.write('scale="noscale" ');
		document.write('salign="LT" ');
		document.write('wmode="transparent" ');
		document.write('allowScriptAccess="sameDomain" ');
		document.write('<param name="FlashVars" value="' + flashvars + '" ');
		document.write('type="application/x-shockwave-flash" ');
		document.write('pluginspage="http://www.macromedia.com/go/getflashplayer">');
		document.write('</embed>');
	}
}
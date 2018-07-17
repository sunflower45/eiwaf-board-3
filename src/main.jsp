<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/view/layout/taglib-include.jsp"%>

<ei:layoutRender name="/view/layout/main-layout.jsp">
<ei:layoutComponent name="eiLayoutTitle">관리자시스템</ei:layoutComponent>
<ei:layoutComponent name="eiLayoutContent">

<script type="text/javascript" src="/js/tree/dtree.js"></script>
<script type="text/javascript" src="/js/main.js"></script>
<script type="text/javascript">
//<![CDATA[
	function eiwaf_DocumentReady(status) {
		$(window).resize(function () {
			var winsize = $(window).height();
			if (winsize < 600) {
				$('#ifrmContent').height(600 - 115);
				$('#divMainMenu').height(600 - 150);
			} else {
				$('#ifrmContent').height(winsize - 115);
				$('#divMainMenu').height(winsize - 150);
			}
		}).triggerHandler('resize');

		$("body").addClass("main");

		IfrmContentLink("/main/mainContent.do");

		$("#himgBtnSwitchClose").click(function(){
			$('#divLeftAreaClose').show();
			$('#divLeftAreaOpen').hide();
		}).css('cursor', 'hand');
		$("#himgBtnSwitchOpen").click(function(){
			$('#divLeftAreaOpen').show();
			$('#divLeftAreaClose').hide();
		}).css('cursor', 'hand');
	}
//]]>
</script>
<form name="form1">
	<input type="hidden" name="user_id"/>
</form>
<div id="Wrap">
    <div id="Header">
        <div class="tabNavi">
            <div id="divNavi" class="solutions">
                <ul>
                	<li><a href="http://www.smba.go.kr" target="_blank"><span>중소기업청</span></a></li>
                    <li><a href="http://www.bizinfo.go.kr" target="_blank"><span>비즈인포</span></a></li>
                </ul>
            </div>
            <div class="hMenu">
                <ul>
                    <li><a href="/"><span>HOME</span></a></li>
                    <li><a href="/main/logout.do"><span>LOGOUT</span></a></li>
                	<li><a href="#" onclick="GoView('${userId}');return false;"><span>회원정보수정</span></a></li>
                </ul>
            </div>
        </div>
        <div class="topNavi">
            <span class="Logo"><img id="imgLogoClick" src="/images/ci.png" alt="중소기업청" /></span>
        </div>
    </div>

    <table style="width:100%;" class="contentTable">
        <tr>
            <td width="195" valign="top" class="LeftArea_open">
                <div id="divLeftAreaOpen" class="LeftArea_open">
                    <div id="divTreeViewtab" class="treeViewtab">
                        <ul>
                            <li class="current"><a href="#"><span>전체메뉴</span></a></li>
                        </ul>
                    </div>
                    <div id="divMainMenu" class="treeView" style="width:165px;">
                        <div id="divALLMainMenu" style="width:165px;"></div>
                    </div>
                    <script type="text/javascript">
                        var fvALLSysImproPageId = "";
                        var fvALLMainMenu = new dTree('fvALLMainMenu', '/images/tree');
                        MainPageInitMainMenuTree(fvALLMainMenu);
                    </script>
                    <script type="text/javascript" src="/js/tree/dtree_${grpCl}_data.js"></script>
                    <script type="text/javascript">
                        MainPageDisplayMainMenuTree('divALLMainMenu', fvALLMainMenu);
                    </script>
                    <div class="switchBtn-close">
                        <a href="#"><img id="himgBtnSwitchClose" src="/images/btn_switch_close_out.gif" alt="" /></a>
                    </div>
                </div>
            </td>
            <td id="divLeftAreaClose" valign="top" class="LeftArea_close" style="display:none">
                <div class="LeftArea_close">
                    <div class="switchBtn-open">
                        <a href="#"><img id="himgBtnSwitchOpen" src="/images/btn_switch_open_out.gif" alt="" /></a>
                    </div>
                </div>
            </td>
            <td width="100%" valign="top">
            	<div><iframe id="ifrmContent" name="ifrmContent" frameborder="0" width="100%" scrolling="yes"></iframe></div>
            </td>
        </tr>
    </table>
</div>
<div id="divbottombar" class="bottom-bar">
	<p class="name">${userNm}(${userId})</p>
	<p class="compu">${clientIp}</p>
	<p class="time"><script type="text/javascript">FlashfObject("/images/time_01.swf", 125, 20);</script></p>
</div>

</ei:layoutComponent>
</ei:layoutRender>
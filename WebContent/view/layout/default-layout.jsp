<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/view/layout/taglib-include.jsp"%>

<ei:requestContext id="requestContext" newRequestData="true" newStatus="true"/>
<ei:layoutDefinition>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8"/>
<title>${eiLayoutTitle}</title>
<link type="text/css" href="/css/basic.css" rel="stylesheet"/>
<link type="text/css" href="/css/layout.css" rel="stylesheet"/>
<script type="text/javascript" src="/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/js/eiwaf/eiwaf-1.1.js"></script>
<script type="text/javascript" charset="utf-8" src="/js/test.js"></script>
<script type="text/javascript">
//<![CDATA[
	$(function() {
		eiwaf_InitDocumentReady(${requestContext.status});
		try {
			var path = parent.MainPageLineMap("${requestContext.requestKey}");
			$("#__SPAN_LINETITLE").html(document.title);
			$("#__SPAN_LINEMAP").html(path);
		} catch(e) {
			$("#__SPAN_LINETITLE").html(document.title);
		}
	});
//]]>
</script>
</head>
<body class="iFrameContents">
<div class="TitleBar">
	<span id="__SPAN_LINETITLE" class="Title"><!-- 문서 타이틀 정의 --></span>
	<span id="__SPAN_LINEMAP" class="linemap"><!-- 라인맵 정의 --></span>
</div>
${eiLayoutContent}
</body>
</html>

</ei:layoutDefinition>
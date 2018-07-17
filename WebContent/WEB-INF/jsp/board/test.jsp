<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript" src="/js/eiwaf/eiwaf-1.0.0.js" charset="utf-8"></script>
<script>
$(document).on('click', '#btn', function(){

	svcf_Ajax("http://localhost:8080/member/ajax.do", data, {
		callbackFn : fnListPageCallback
	});
	$("#id").val("");
})
</script>
</head>
<body>
<form method="POST" id="form1">
	이름: <input type="text" id="id" /> <br/>
	
	<input type="button" id="btn" value="SEND">
</form>
<ul id="list"></ul>

</body>
</html>
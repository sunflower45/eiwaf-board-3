<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/view/layout/taglib-include.jsp"%>

<ei:layoutRender name="/view/layout/default-layout.jsp">
<ei:layoutComponent name="eiLayoutTitle">[리소스]-리셋</ei:layoutComponent>
<ei:layoutComponent name="eiLayoutContent">

리셋 - 서버로그 참조하십시오.<br/>
<pre>
[2012-06-07 11:11:45,819][DEBUG]- /test/reset.do, PRE-HANDLE TIME:0ms
[2012-06-07 11:11:45,819][INFO]- net.e4net.eiwaf.service.resource.ResourceEventListener#onApplicationEvent start
[2012-06-07 11:11:45,819][INFO]- net.e4net.eiwaf.service.resource.impl.CodeServiceImpl destroy
[2012-06-07 11:11:45,819][INFO]- net.e4net.eiwaf.service.resource.impl.CodeServiceImpl start
[2012-06-07 11:11:45,819][INFO]- Loading xml file from ServletContext resource [/WEB-INF/config/resource/code/code_sample.xml]
[2012-06-07 11:11:45,819][INFO]- net.e4net.eiwaf.service.resource.impl.CodeServiceImpl finish
[2012-06-07 11:11:45,820][INFO]- CODE loaded
[2012-06-07 11:11:45,820][INFO]- net.e4net.eiwaf.service.resource.ResourceEventListener#onApplicationEvent finish
[2012-06-07 11:11:45,820][DEBUG]- /test/reset.do, POST-HANDLE TIME:1ms
[2012-06-07 11:11:45,820][DEBUG]- 
################################## Status ##################################
Status:
        code    : 0
        msgCode : STATUS.Ok
        message : 정상 처리되었습니다.
################################## Status ##################################
[2012-06-07 11:11:45,820][STAT]- 100.1.29.119|127.0.0.1|S1|unknownUser|unknownUser|test/reset|do|OK|test/reset|OK|0

</pre>
</ei:layoutComponent>
</ei:layoutRender>
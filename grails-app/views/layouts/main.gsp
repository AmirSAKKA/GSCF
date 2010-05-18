<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en-EN" xml:lang="en-EN">
<head>
	<title><g:layoutTitle default="Grails"/></title>
	<link rel="stylesheet" href="${resource(dir: 'css', file: session.style + '.css')}"/>
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'login_panel.css')}"/>
	<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon"/>
	<g:javascript library="jquery"/>
	<script src="${createLinkTo(dir: 'js', file: 'jquery-ui-1.8.1.custom.min.js')}" type="text/javascript"></script>
	<link rel="stylesheet" href="${createLinkTo(dir: 'css/cupertino', file: 'jquery-ui-1.8.1.custom.css')}"/>
	<g:layoutHead/>
	<script type="text/javascript" src="${resource(dir: 'js', file: 'login_panel.js')}"></script>
	<script type="text/javascript" src="${resource(dir: 'js', file: 'topnav.js')}"></script>
	<g:if env="development"><script type="text/javascript" src="${resource(dir: 'js', file: 'development.js')}"></script></g:if>
</head>
<body>
<g:render template="/common/login_panel"/>
<div class="container">
	<div id="header">
		<g:render template="/common/topnav"/>
	</div>
	<div id="content"><g:layoutBody/></div>
	<div id="footer">
		Copyright © 2008 - <g:formatDate format="yyyy" date="${new Date()}"/> NMC & NuGO. All rights reserved.
		( style: <%=session.style%> )
	</div>
	<g:if env="development"><g:render template="/common/feedback"/></g:if>
</div>
</body>
</html>
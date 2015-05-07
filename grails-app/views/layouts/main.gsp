<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title><g:layoutTitle default="Grails" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
<%--<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" />
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-theme.min.css')}" />--%>
<link rel="stylesheet" href="${resource(dir: 'css', file: 'global.css')}" />
<asset:stylesheet src="application.css" />
<%--<script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>--%>
<%--<script type="text/javascript" src="js/bootstrap.min.js"></script>--%>
<asset:javascript src="application.js" />
<g:layoutHead />
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"> <img alt="University of Ulster"
					src="${resource(dir: 'images', file: 'ulster_logo.png')}" />
				</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="${params?.controller == null ? 'active' : ''}"><a href="${createLink(uri: '/', absolute: true)}">Home</a></li>
					<li class="${params?.controller == 'twitterQuery' ? 'active' : ''}"><g:link controller="twitterQuery">Twitter Query</g:link></li>
				</ul>
				<%--
		        <li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
		          <ul class="dropdown-menu" role="menu">
		            <li><a href="#">Action</a></li>
		            <li><a href="#">Another action</a></li>
		            <li><a href="#">Something else here</a></li>
		            <li class="divider"></li>
		            <li><a href="#">Separated link</a></li>
		            <li class="divider"></li>
		            <li><a href="#">One more separated link</a></li>
		          </ul>
		        </li>
		      </ul>
		      --%>
				<%--
		      <form class="navbar-form navbar-left" role="search">
		        <div class="form-group">
		          <input type="text" class="form-control" placeholder="Search">
		        </div>
		        <button type="submit" class="btn btn-default">Submit</button>
		      </form>
		      --%>
				<sec:ifLoggedIn>
					<ul class="nav navbar-nav navbar-right">
						<sec:ifAllGranted roles="ROLE_ADMIN">
							<li class="${params?.controller == 'twitter' ? 'active' : ''}"><g:link controller="twitter">Twitter API Status</g:link></li>
						</sec:ifAllGranted>
						<li class="divider"></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-expanded="false"> ${sec.loggedInUserInfo(field: "username")}<span class="caret"></span>
						</a>
							<ul class="dropdown-menu" role="menu">
								<li><g:remoteLink class="logout" controller="logout" method="post" asynchronous="false"
										onSuccess="location.reload()">
										<i class="icon-off"></i>
										<g:message code="layout.main.userLogout" />
									</g:remoteLink></li>
							</ul></li>
					</ul>
				</sec:ifLoggedIn>
				<%--
		        <li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
		          <ul class="dropdown-menu" role="menu">
		            <li><a href="#">Action</a></li>
		            <li><a href="#">Another action</a></li>
		            <li><a href="#">Something else here</a></li>
		            <li class="divider"></li>
		            <li><a href="#">Separated link</a></li>
		          </ul>
		        </li>
		        --%>

			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<g:layoutBody />
	<nav class="navbar navbar-inverse navbar-fixed-bottom">
		<div class="container">
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="#">v1.0</a></li>
				</ul>
				<ul class="nav pull-right">
					<li><p class="navbar-text">
							© 2015 <a href="http://jordiv.com" target="_blank">Jordi Vilaplana</a>
						</p></li>
				</ul>
			</div>
		</div>
	</nav>
	<div id="spinner" class="spinner" style="display: none;">
		<g:message code="spinner.alt" default="Loading&hellip;" />
	</div>
</body>
</html>

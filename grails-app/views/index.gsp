<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>Welcome to #eMOVIX</title>
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<h1>
				<img alt="Ulster University" src="${assetPath(src: 'logo_udl.png')}" /> <small>#eMOVIX Project</small>
			</h1>
			<p>Welcome to the #eMOVIX project.</p>
			<sec:ifNotLoggedIn>
				<p>
				<img src="" />
					Please
					<g:link controller="twitterQuery">log in</g:link>
					or
					<g:link controller="user" action="create">register a new account</g:link>
					to get started.
				</p>
			</sec:ifNotLoggedIn>
			<p>
				<a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a>
			</p>
		</div>
	</div>
</body>
</html>

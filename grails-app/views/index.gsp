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
				<img alt="Ulster University" src="${resource(dir: 'images', file: 'ulster_logo_big.png')}" /> <small>Cyberbullying
					Detection Project</small>
			</h1>
			<p>Welcome to the cyberbullying detection project.</p>
			<sec:ifNotLoggedIn>
				<p>
					Please
					<g:link controller="twitterQuery">log in</g:link>
					or
					<g:link controller="user" action="create">register a new account</g:link>
					to get started.
				</p>
			</sec:ifNotLoggedIn>
			<%--
			<p>
				<a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a>
			</p>
			--%>
		</div>
	</div>
	<%-- TODO:
		<ul>
			<li>Afegir el altre grup (bullying-improper?)</li>
			<li>Els altres grups també haurien de sortir a la review</li>
			<li>Mostrar relacions de buller-victima en un graf</li>
		</ul> 
		New type: "bullying, improper"
	--%>
</body>
</html>

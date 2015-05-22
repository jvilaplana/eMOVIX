<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
	</head>
	<body>
		<div class="container">
			<div class="page-header">
				<h1><g:message code="twitter.search.title" /></h1>
			</div>
			<g:form action="searchResults" class="form-inline">
				<div class="form-group">
					<g:textField class="form-control" name="query" placeholder="${g.message(code: 'twitter.search.query')}" />
					<g:submitButton class="btn btn-primary" name="submitSearch" value="${g.message(code: 'twitter.search.submit')}" />
				</div>
			</g:form>
		</div>
	</body>
</html>

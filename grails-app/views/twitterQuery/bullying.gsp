
<%@ page import="com.jordiv.emovix.TwitterQuery" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'twitterQuery.label', default: 'TwitterQuery')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container">
			<div class="page-header">
				<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			</div>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:link action="dashboard" id="${twitterQueryInstance?.id}" class="btn btn-default">
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <g:message code="default.back.label" />
			</g:link>
			<g:link action="create" class="btn btn-default pull-right">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> <g:message code="default.new.label" args="[entityName]" />
			</g:link>
			<p>&nbsp;</p>
			<table class="table table-condensed">
			<thead>
					<tr>
						<%--
						<g:sortableColumn property="name" title="${message(code: 'twitterQuery.name.label', default: 'Name')}" />
						<g:sortableColumn property="query" title="${message(code: 'twitterQuery.query.label', default: 'Query')}" />
						--%>
						<th>Username</th>
						<th>Text</th>
						<th>Offending Words</th>
						<th>R</th>
						<th>S</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${twitterQueryResponseClassificationList}" status="i" var="twitterQueryResponseClassification">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<%--<td><g:link action="show" id="${twitterQueryResponseClassification?.queryResponse?.query?.id}">${fieldValue(bean: twitterQueryResponseClassification, field: "offendingWords")}</g:link></td>--%>
						<td><a href="https://twitter.com/${twitterQueryResponseClassification?.queryResponse?.screenName}" target="_blank">@${twitterQueryResponseClassification?.queryResponse?.screenName}</a></td>
						<td><a href="https://twitter.com/${twitterQueryResponseClassification?.queryResponse?.screenName}/status/${twitterQueryResponseClassification?.queryResponse?.statusId}" target="_blank">${twitterQueryResponseClassification?.queryResponse?.text}</a></td>
						<td>${fieldValue(bean: twitterQueryResponseClassification, field: "offendingWords")}</td>
						<td>${fieldValue(bean: twitterQueryResponseClassification, field: "ranking")}</td>
						<td>${fieldValue(bean: twitterQueryResponseClassification, field: "score")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${twitterQueryResponseClassificationCount ?: 0}" id="${twitterQueryInstance?.id}" />
			</div>
		</div>
	</body>
</html>


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
			<g:link class="create" action="create" class="btn btn-default pull-right">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> <g:message code="default.new.label" args="[entityName]" />
			</g:link>
			<table class="table table-condensed">
			<thead>
					<tr>
						<g:sortableColumn property="name" title="${message(code: 'twitterQuery.name.label', default: 'Name')}" />
						<g:sortableColumn property="query" title="${message(code: 'twitterQuery.query.label', default: 'Query')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${twitterQueryInstanceList}" status="i" var="twitterQueryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="dashboard" id="${twitterQueryInstance.id}">${fieldValue(bean: twitterQueryInstance, field: "name")}</g:link></td>
						<td>${fieldValue(bean: twitterQueryInstance, field: "query")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${twitterQueryInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>

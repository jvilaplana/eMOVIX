
<%@ page import="com.jordiv.emovix.twitter.TwitterMonitorUser" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'twitterMonitorUser.label', default: 'TwitterMonitorUser')}" />
</head>
<body>
	<div class="container-fluid">
		<h2><g:message code="default.list.label" args="[entityName]" /></h2>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		<div class="btn-group pull-right" role="group" aria-label="...">
			<g:link class="btn btn-primary" controller="twitterMonitorUser" action="create">
				<span class="glyphicon glyphicon-plus"></span> <g:message code="default.new.label" args="[entityName]" />
			</g:link>
		</div>
		<table class="table table-hover">
			<thead>
				<tr>
					<th><g:message code="twitterMonitorUser.user.label" /></th>
					<th><g:message code="twitterMonitorUser.group.label" /></th>
					<g:sortableColumn property="dateCreated" title="${message(code: 'default.dateCreated.label')}" />
					<g:sortableColumn property="lastUpdated" title="${message(code: 'default.lastUpdated.label')}" />
				</tr>
			</thead>
			<tbody>
			<g:each in="${twitterMonitorUserInstanceList}" status="i" var="twitterMonitorUserInstance">
				<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					<td><g:link action="show" id="${twitterMonitorUserInstance.id}">@${fieldValue(bean: twitterMonitorUserInstance, field: "user")}</g:link></td>
					<td>${fieldValue(bean: twitterMonitorUserInstance, field: "group")}</td>
					<td>${fieldValue(bean: twitterMonitorUserInstance, field: "dateCreated")}</td>
					<td><g:formatDate date="${twitterMonitorUserInstance.lastUpdated}" /></td>
				</tr>
			</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${twitterMonitorUserInstanceCount ?: 0}" />
		</div>
		<div class="btn-group pull-right" role="group" aria-label="...">
			<g:link class="btn btn-primary" controller="twitterMonitorUser" action="create">
				<span class="glyphicon glyphicon-plus"></span> <g:message code="default.new.label" args="[entityName]" />
			</g:link>
		</div>
	</div>
</body>
</html>


<%@ page import="com.jordiv.emovix.twitter.TwitterMonitorGroup" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'twitterMonitorGroup.label', default: 'TwitterMonitorGroup')}" />
</head>
<body>
	<div class="container-fluid">
		<h2><g:message code="default.list.label" args="[entityName]" /></h2>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		<div class="btn-group pull-right" role="group" aria-label="...">
			<g:link class="btn btn-primary" controller="twitterMonitorGroup" action="create">
				<span class="glyphicon glyphicon-plus"></span> <g:message code="default.new.label" args="[entityName]" />
			</g:link>
		</div>
		<table class="table table-hover">
			<thead>
				<tr>
				
					<g:sortableColumn property="dateCreated" title="${message(code: 'twitterMonitorGroup.dateCreated.label', default: 'Date Created')}" />
				
					<g:sortableColumn property="description" title="${message(code: 'twitterMonitorGroup.description.label', default: 'Description')}" />
				
					<g:sortableColumn property="lastUpdated" title="${message(code: 'twitterMonitorGroup.lastUpdated.label', default: 'Last Updated')}" />
				
					<g:sortableColumn property="name" title="${message(code: 'twitterMonitorGroup.name.label', default: 'Name')}" />
				
				</tr>
			</thead>
			<tbody>
			<g:each in="${twitterMonitorGroupInstanceList}" status="i" var="twitterMonitorGroupInstance">
				<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
				
					<td><g:link action="show" id="${twitterMonitorGroupInstance.id}">${fieldValue(bean: twitterMonitorGroupInstance, field: "dateCreated")}</g:link></td>
				
					<td>${fieldValue(bean: twitterMonitorGroupInstance, field: "description")}</td>
				
					<td><g:formatDate date="${twitterMonitorGroupInstance.lastUpdated}" /></td>
				
					<td>${fieldValue(bean: twitterMonitorGroupInstance, field: "name")}</td>
				
				</tr>
			</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${twitterMonitorGroupInstanceCount ?: 0}" />
		</div>
		<div class="btn-group pull-right" role="group" aria-label="...">
			<g:link class="btn btn-primary" controller="twitterMonitorGroup" action="create">
				<span class="glyphicon glyphicon-plus"></span> <g:message code="default.new.label" args="[entityName]" />
			</g:link>
		</div>
	</div>
</body>
</html>

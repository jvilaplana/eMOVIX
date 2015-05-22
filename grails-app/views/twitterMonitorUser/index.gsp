
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
		<table class="table table-hover">
			<thead>
				<tr>
				
					<g:sortableColumn property="dateCreated" title="${message(code: 'twitterMonitorUser.dateCreated.label', default: 'Date Created')}" />
				
					<th><g:message code="twitterMonitorUser.group.label" default="Group" /></th>
				
					<g:sortableColumn property="lastUpdated" title="${message(code: 'twitterMonitorUser.lastUpdated.label', default: 'Last Updated')}" />
				
					<th><g:message code="twitterMonitorUser.user.label" default="User" /></th>
				
				</tr>
			</thead>
			<tbody>
			<g:each in="${twitterMonitorUserInstanceList}" status="i" var="twitterMonitorUserInstance">
				<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
				
					<td><g:link action="show" id="${twitterMonitorUserInstance.id}">${fieldValue(bean: twitterMonitorUserInstance, field: "dateCreated")}</g:link></td>
				
					<td>${fieldValue(bean: twitterMonitorUserInstance, field: "group")}</td>
				
					<td><g:formatDate date="${twitterMonitorUserInstance.lastUpdated}" /></td>
				
					<td>${fieldValue(bean: twitterMonitorUserInstance, field: "user")}</td>
				
				</tr>
			</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${twitterMonitorUserInstanceCount ?: 0}" />
		</div>
	</div>
</body>
</html>

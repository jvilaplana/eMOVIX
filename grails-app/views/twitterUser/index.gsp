
<%@ page import="com.jordiv.emovix.twitter.TwitterUser" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'twitterUser.label', default: 'TwitterUser')}" />
</head>
<body>
	<div class="container-fluid">
		<h2><g:message code="default.list.label" args="[entityName]" /></h2>
		<g:if test="${flash.message}">
			<div class="alert alert-danger" role="alert">${flash.message}</div>
		</g:if>
		<div class="btn-group pull-right" role="group" aria-label="...">
			<g:link class="btn btn-primary" controller="twitterUser" action="create">
				<span class="glyphicon glyphicon-plus"></span> <g:message code="default.new.label" args="[entityName]" />
			</g:link>
		</div>
		<table class="table table-hover">
			<thead>
				<tr>
				
					<g:sortableColumn property="timeZone" title="${message(code: 'twitterUser.timeZone.label', default: 'Time Zone')}" />
				
					<g:sortableColumn property="url" title="${message(code: 'twitterUser.url.label', default: 'Url')}" />
				
					<g:sortableColumn property="biggerProfileImageURL" title="${message(code: 'twitterUser.biggerProfileImageURL.label', default: 'Bigger Profile Image URL')}" />
				
					<g:sortableColumn property="biggerProfileImageURLHttps" title="${message(code: 'twitterUser.biggerProfileImageURLHttps.label', default: 'Bigger Profile Image URLH ttps')}" />
				
					<g:sortableColumn property="createdAt" title="${message(code: 'twitterUser.createdAt.label', default: 'Created At')}" />
				
					<g:sortableColumn property="dateCreated" title="${message(code: 'twitterUser.dateCreated.label', default: 'Date Created')}" />
				
				</tr>
			</thead>
			<tbody>
			<g:each in="${twitterUserInstanceList}" status="i" var="twitterUserInstance">
				<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
				
					<td><g:link action="show" id="${twitterUserInstance.id}">${fieldValue(bean: twitterUserInstance, field: "timeZone")}</g:link></td>
				
					<td>${fieldValue(bean: twitterUserInstance, field: "url")}</td>
				
					<td>${fieldValue(bean: twitterUserInstance, field: "biggerProfileImageURL")}</td>
				
					<td>${fieldValue(bean: twitterUserInstance, field: "biggerProfileImageURLHttps")}</td>
				
					<td><g:formatDate date="${twitterUserInstance.createdAt}" /></td>
				
					<td><g:formatDate date="${twitterUserInstance.dateCreated}" /></td>
				
				</tr>
			</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${twitterUserInstanceCount ?: 0}" />
		</div>
		<div class="btn-group pull-right" role="group" aria-label="...">
			<g:link class="btn btn-primary" controller="twitterUser" action="create">
				<span class="glyphicon glyphicon-plus"></span> <g:message code="default.new.label" args="[entityName]" />
			</g:link>
		</div>
	</div>
</body>
</html>

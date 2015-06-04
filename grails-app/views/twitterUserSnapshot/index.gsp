
<%@ page import="com.jordiv.emovix.twitter.TwitterUserSnapshot" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'twitterUserSnapshot.label', default: 'TwitterUserSnapshot')}" />
</head>
<body>
	<div class="container-fluid">
		<h2><g:message code="default.list.label" args="[entityName]" /></h2>
		<g:if test="${flash.message}">
			<div class="alert alert-danger" role="alert">${flash.message}</div>
		</g:if>
		<div class="btn-group pull-right" role="group" aria-label="...">
			<g:link class="btn btn-primary" controller="twitterUserSnapshot" action="create">
				<span class="glyphicon glyphicon-plus"></span> <g:message code="default.new.label" args="[entityName]" />
			</g:link>
		</div>
		<table class="table table-hover">
			<thead>
				<tr>
				
					<g:sortableColumn property="biggerProfileImageURL" title="${message(code: 'twitterUserSnapshot.biggerProfileImageURL.label', default: 'Bigger Profile Image URL')}" />
				
					<g:sortableColumn property="biggerProfileImageURLHttps" title="${message(code: 'twitterUserSnapshot.biggerProfileImageURLHttps.label', default: 'Bigger Profile Image URLH ttps')}" />
				
					<g:sortableColumn property="dateCreated" title="${message(code: 'twitterUserSnapshot.dateCreated.label', default: 'Date Created')}" />
				
					<g:sortableColumn property="description" title="${message(code: 'twitterUserSnapshot.description.label', default: 'Description')}" />
				
					<g:sortableColumn property="favouritesCount" title="${message(code: 'twitterUserSnapshot.favouritesCount.label', default: 'Favourites Count')}" />
				
					<g:sortableColumn property="followersCount" title="${message(code: 'twitterUserSnapshot.followersCount.label', default: 'Followers Count')}" />
				
				</tr>
			</thead>
			<tbody>
			<g:each in="${twitterUserSnapshotInstanceList}" status="i" var="twitterUserSnapshotInstance">
				<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
				
					<td><g:link action="show" id="${twitterUserSnapshotInstance.id}">${fieldValue(bean: twitterUserSnapshotInstance, field: "biggerProfileImageURL")}</g:link></td>
				
					<td>${fieldValue(bean: twitterUserSnapshotInstance, field: "biggerProfileImageURLHttps")}</td>
				
					<td><g:formatDate date="${twitterUserSnapshotInstance.dateCreated}" /></td>
				
					<td>${fieldValue(bean: twitterUserSnapshotInstance, field: "description")}</td>
				
					<td>${fieldValue(bean: twitterUserSnapshotInstance, field: "favouritesCount")}</td>
				
					<td>${fieldValue(bean: twitterUserSnapshotInstance, field: "followersCount")}</td>
				
				</tr>
			</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${twitterUserSnapshotInstanceCount ?: 0}" />
		</div>
		<div class="btn-group pull-right" role="group" aria-label="...">
			<g:link class="btn btn-primary" controller="twitterUserSnapshot" action="create">
				<span class="glyphicon glyphicon-plus"></span> <g:message code="default.new.label" args="[entityName]" />
			</g:link>
		</div>
	</div>
</body>
</html>

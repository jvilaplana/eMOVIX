
<%@ page import="com.jordiv.emovix.twitter.TwitterMonitorUser" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'twitterMonitorUser.label', default: 'TwitterMonitorUser')}" />
</head>
<body>
	<div class="container-fluid">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h2><g:message code="default.show.label" args="[entityName]" /></h2>
			</div>
			<div class="panel-body">
				<g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
				</g:if>
				<div class="pull-right">
					<g:link class="btn btn-primary" action="index">
						<span class="glyphicon glyphicon-list"></span> <g:message code="default.list.label" args="[entityName]" />
					</g:link>
					<g:link class="btn btn-primary" action="create">
						<span class="glyphicon glyphicon-plus"></span> <g:message code="default.new.label" args="[entityName]" />
					</g:link>
				</div>
				<div class="clearfix"></div>
				<div class="container-fluid">
				
					<g:if test="${twitterMonitorUserInstance?.dateCreated}">
					<p>
						<strong><g:message code="twitterMonitorUser.dateCreated.label" default="Date Created" />: </strong>
						
							<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${twitterMonitorUserInstance?.dateCreated}" /></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterMonitorUserInstance?.group}">
					<p>
						<strong><g:message code="twitterMonitorUser.group.label" default="Group" />: </strong>
						
							<span class="property-value" aria-labelledby="group-label"><g:link controller="twitterMonitorGroup" action="show" id="${twitterMonitorUserInstance?.group?.id}">${twitterMonitorUserInstance?.group?.encodeAsHTML()}</g:link></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterMonitorUserInstance?.lastUpdated}">
					<p>
						<strong><g:message code="twitterMonitorUser.lastUpdated.label" default="Last Updated" />: </strong>
						
							<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${twitterMonitorUserInstance?.lastUpdated}" /></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterMonitorUserInstance?.user}">
					<p>
						<strong><g:message code="twitterMonitorUser.user.label" default="User" />: </strong>
						
							<span class="property-value" aria-labelledby="user-label"><g:link controller="twitterUser" action="show" id="${twitterMonitorUserInstance?.user?.id}">${twitterMonitorUserInstance?.user?.encodeAsHTML()}</g:link></span>
						
					</p>
					</g:if>
					
					<g:link controller="twitterUserSnapshot">
						Snapshots
					</g:link>
				
				</div>
				<hr />
				<g:form url="[resource:twitterMonitorUserInstance, action:'delete']" method="DELETE">
					<div>
						<g:link class="btn btn-default" action="edit" resource="${twitterMonitorUserInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</div>
				</g:form>
			</div>
		</div>
	</div>
</body>
</html>

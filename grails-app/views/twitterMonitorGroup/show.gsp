
<%@ page import="com.jordiv.emovix.twitter.TwitterMonitorGroup" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'twitterMonitorGroup.label', default: 'TwitterMonitorGroup')}" />
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
				
					<g:if test="${twitterMonitorGroupInstance?.dateCreated}">
					<p>
						<strong><g:message code="twitterMonitorGroup.dateCreated.label" default="Date Created" />: </strong>
						
							<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${twitterMonitorGroupInstance?.dateCreated}" /></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterMonitorGroupInstance?.description}">
					<p>
						<strong><g:message code="twitterMonitorGroup.description.label" default="Description" />: </strong>
						
							<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${twitterMonitorGroupInstance}" field="description"/></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterMonitorGroupInstance?.lastUpdated}">
					<p>
						<strong><g:message code="twitterMonitorGroup.lastUpdated.label" default="Last Updated" />: </strong>
						
							<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${twitterMonitorGroupInstance?.lastUpdated}" /></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterMonitorGroupInstance?.name}">
					<p>
						<strong><g:message code="twitterMonitorGroup.name.label" default="Name" />: </strong>
						
							<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${twitterMonitorGroupInstance}" field="name"/></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterMonitorGroupInstance?.users}">
					<p>
						<strong><g:message code="twitterMonitorGroup.users.label" default="Users" />: </strong>
						
							<g:each in="${twitterMonitorGroupInstance.users}" var="u">
							<span class="property-value" aria-labelledby="users-label"><g:link controller="twitterMonitorUser" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
							</g:each>
						
					</p>
					</g:if>
				
				</div>
				<hr />
				<g:form url="[resource:twitterMonitorGroupInstance, action:'delete']" method="DELETE">
					<div>
						<g:link class="btn btn-default" action="edit" resource="${twitterMonitorGroupInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</div>
				</g:form>
			</div>
		</div>
	</div>
</body>
</html>

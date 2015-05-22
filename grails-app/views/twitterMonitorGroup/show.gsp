
<%@ page import="com.jordiv.emovix.twitter.TwitterMonitorGroup" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'twitterMonitorGroup.label', default: 'TwitterMonitorGroup')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-twitterMonitorGroup" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-twitterMonitorGroup" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list twitterMonitorGroup">
			
				<g:if test="${twitterMonitorGroupInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="twitterMonitorGroup.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${twitterMonitorGroupInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${twitterMonitorGroupInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="twitterMonitorGroup.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${twitterMonitorGroupInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${twitterMonitorGroupInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="twitterMonitorGroup.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${twitterMonitorGroupInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${twitterMonitorGroupInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="twitterMonitorGroup.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${twitterMonitorGroupInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${twitterMonitorGroupInstance?.users}">
				<li class="fieldcontain">
					<span id="users-label" class="property-label"><g:message code="twitterMonitorGroup.users.label" default="Users" /></span>
					
						<g:each in="${twitterMonitorGroupInstance.users}" var="u">
						<span class="property-value" aria-labelledby="users-label"><g:link controller="twitterMonitorUser" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:twitterMonitorGroupInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${twitterMonitorGroupInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

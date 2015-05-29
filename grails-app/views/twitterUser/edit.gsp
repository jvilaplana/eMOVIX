<%@ page import="com.jordiv.emovix.twitter.TwitterUser" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'twitterUser.label', default: 'TwitterUser')}" />
</head>
<body>
	<div class="container-fluid">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h2><g:message code="default.edit.label" args="[entityName]" /></h2>
			</div>
			<div class="panel-body">
				<g:if test="${flash.message}">
					<div class="alert alert-danger" role="alert">${flash.message}</div>
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
					<g:hasErrors bean="${twitterUserInstance}">
					<ul class="errors" role="alert">
						<g:eachError bean="${twitterUserInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
						</g:eachError>
					</ul>
					</g:hasErrors>
					<g:form url="[resource:twitterUserInstance, action:'update']" method="PUT" >
						<g:hiddenField name="version" value="${twitterUserInstance?.version}" />
						<fieldset class="form">
							<g:render template="form"/>
						</fieldset>
						<fieldset class="buttons">
							<g:actionSubmit class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label')}" />
							<g:link class="btn btn-default" action="show" resource="${twitterUserInstance}"><g:message code="default.button.cancel.label" /></g:link>
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

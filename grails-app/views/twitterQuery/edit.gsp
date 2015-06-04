<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'twitterQuery.label', default: 'TwitterQuery')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container">
			<div class="page-header">
				<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			</div>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="btn-group pull-right" role="group">
				<g:link class="btn btn-default" action="index">
					<span class="glyphicon glyphicon-list"></span>
					<g:message code="default.list.label" args="[entityName]" />
				</g:link>
			</div>
			<div class="clearfix"></div>
			&nbsp;
			<div class="panel panel-primary">
				<div class="panel-heading">
		        	<h3 class="panel-title"><g:message code="default.create.label" args="[entityName]" /></h3>
		     	</div>
		      	<div class="panel-body">
		      		<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>
					<g:hasErrors bean="${twitterQueryInstance}">
					<ul class="errors" role="alert">
						<g:eachError bean="${twitterQueryInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
						</g:eachError>
					</ul>
					</g:hasErrors>
					<g:form url="[resource:twitterQueryInstance, action:'update']" method="PUT">
						<g:hiddenField name="version" value="${twitterQueryInstance?.version}" />
						<g:render template="form"/>
						<g:actionSubmit name="update" class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
						<g:link action="dashboard" id="${twitterQueryInstance?.id}" class="btn btn-default"><g:message code="default.button.cancel.label" /></g:link>
					</g:form>
	      		</div>
		    </div>
		</div>
	</body>
</html>

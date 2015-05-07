
<%@ page import="com.jordiv.emovix.TwitterQuery" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'twitterQuery.label', default: 'TwitterQuery')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container">
			<div class="page-header">
				<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			</div>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="btn-group pull-right" role="group">
				<g:link class="btn btn-default" action="index">
					<span class="glyphicon glyphicon-list"></span>
					<g:message code="default.list.label" args="[entityName]" />
				</g:link>
				<g:link class="btn btn-default" action="create">
					<span class="glyphicon glyphicon-plus"></span>
					<g:message code="default.new.label" args="[entityName]" />
				</g:link>
			</div>
			<div class="clearfix"></div>
			<p></p>
			<g:if test="${twitterQueryInstance?.query}">
				<div class="panel panel-primary">
					<div class="panel-heading">
			        	<h3 class="panel-title"><g:fieldValue bean="${twitterQueryInstance}" field="name"/></h3>
			     	</div>
			      	<div class="panel-body">
			      		<span id="query-label" class="property-label"><g:message code="twitterQuery.query.label" default="Query" />:</span>
						<code><span class="property-value" aria-labelledby="query-label"><g:fieldValue bean="${twitterQueryInstance}" field="query"/></span></code>
		      		</div>
			    </div>
			</g:if>
			<div class="btn-group pull-right" role="group">
				<g:form url="[resource:twitterQueryInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="btn btn-default" action="edit" resource="${twitterQueryInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
				</g:form>
			</div>
			<div class="btn-group" role="group">
				<g:link class="btn btn-success has-spinner" action="run" resource="${twitterQueryInstance}">
					<span class="glyphicon glyphicon-play-circle"></span>
					<g:message code="default.run.label" />
					<span class="spinner"><span class="glyphicon glyphicon-refresh spin"></span></span>
				</g:link>
			</div>
			<p>&nbsp;</p>
			<table class="table table-bordered table-hover table-condensed">
				<thead>
					<tr>
						<th><g:message code="twitterQueryResponse.screenName.label" /></th>
						<th><g:message code="twitterQueryResponse.text.label" /></th>
						<th><g:message code="twitterQueryResponse.actions.label" /></th>
					</tr>
					</thead>
					<tbody>
						<g:each in="${result}" var="r">
						<tr>
							<td><a href="https://twitter.com/${r[0]}" target="_blank">@${r[0]}</a></td>
							<td>${r[1]}</td>
							<td>
								<a href="https://twitter.com/${r[0]}/status/${r[3]}" target="_blank">
									<span class="glyphicon glyphicon-new-window"></span>
								</a>
								<g:if test="${r[2] != null}">
									<a href="https://www.google.co.uk/maps/search/${r[2]}" target="_blank">
										<span class="glyphicon glyphicon-map-marker"></span>
									</a>
								</g:if>
							</td>
						</g:each>
					</tbody>
			</table>
		</div>
	</body>
</html>


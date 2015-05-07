<%@ page import="com.jordiv.emovix.TwitterQueryResponse" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'twitterQueryResponse.label', default: 'TwitterQueryResponse')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container">
		total = ${twitterQueryResponseInstanceCount }
			<div class="page-header">
				<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			</div>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:link class="create" action="create" class="btn btn-default pull-right">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> <g:message code="default.new.label" args="[entityName]" />
			</g:link>
			<table class="table table-condensed">
			<thead>
					<tr>
						<g:sortableColumn property="screenName" title="${message(code: 'twitterQueryResponse.screenName.label', default: 'Screen Name')}" />
						<g:sortableColumn property="text" title="${message(code: 'twitterQueryResponse.text.label', default: 'Text')}" />
						<g:sortableColumn property="latitude" title="${message(code: 'twitterQueryResponse.latitude.label', default: 'Latitude')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${twitterQueryResponseInstanceList}" status="i" var="twitterQueryResponseInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${twitterQueryResponseInstance.id}">${fieldValue(bean: twitterQueryResponseInstance, field: "screenName")}</g:link></td>
						<td>${fieldValue(bean: twitterQueryResponseInstance, field: "text")}</td>			
						<td>
							<g:if test="${twitterQueryResponseInstance?.longitude != null}">
								<a href="https://www.google.co.uk/maps/search/${twitterQueryResponseInstance?.latitude},${twitterQueryResponseInstance?.longitude}" target="_blank">
									<span class="glyphicon glyphicon-map-marker"></span>
								</a>
							</g:if>
							
						</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			
			<div class="pagination">
				<g:paginate total="${twitterQueryResponseInstanceCount ?: 0}" />
			</div>
			<div class="clearfix"></div>
			<br /><br /><br /><br /><br /><br />
		</div>
	</body>
</html>

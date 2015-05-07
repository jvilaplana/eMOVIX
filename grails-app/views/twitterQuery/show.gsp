
<%@ page import="com.jordiv.emovix.TwitterQuery" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'twitterQuery.label', default: 'TwitterQuery')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'dashboard.css')}" />
	</head>
	<body>
		<div class="container-fluid">
					<g:if test="${twitterQueryInstance?.query}">
						<div class="panel panel-primary">
							<div class="panel-heading">
					        	<h3 class="panel-title"><g:fieldValue bean="${twitterQueryInstance}" field="name"/></h3>
					     	</div>
					      	<div class="panel-body">
					      		<p>
					      			<span id="query-label" class="property-label"><g:message code="twitterQuery.query.label" default="Query" />:</span>
									<code><span class="property-value" aria-labelledby="query-label"><g:fieldValue bean="${twitterQueryInstance}" field="query"/></span></code>
								</p>
								<p>
									<span id="count-label" class="property-label"><g:message code="twitterQuery.count.label" default="Count" />:</span>
									<code><span class="property-value" aria-labelledby="count-label"><g:fieldValue bean="${twitterQueryInstance}" field="count"/></span></code>
								</p>
								<p>
									<span id="enabled-label" class="property-label"><g:message code="twitterQuery.enabled.label" default="Enabled" />:</span>
									<code><span class="property-value" aria-labelledby="enabled-label"><g:fieldValue bean="${twitterQueryInstance}" field="enabled"/></span></code>
								</p>
								<p>
									<span id="running-label" class="property-label"><g:message code="twitterQuery.running.label" default="Running" />:</span>
									<code><span class="property-value" aria-labelledby="running-label"><g:fieldValue bean="${twitterQueryInstance}" field="running"/></span></code>
								</p>
								<hr />
								<table class="table">
									<thead>
										<tr>
											<th>Total</th>
											<th>Neutral</th>
											<th>Bullying</th>
											<th>Improper</th>
											<th>Mood</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>${responseCount}</td>
											<td>${neutralCount}</td>
											<td><g:link action="bullying" id="${twitterQueryInstance.id}">${bullyingCount}</g:link></td>
											<td>${improperCount}</td>
											<td>${moodCount}</td>
										</tr>
									</tbody>
								</table>
				      		</div>
					    </div>
					</g:if>
				</div>
			</div>
		</div>
	</body>
</html>

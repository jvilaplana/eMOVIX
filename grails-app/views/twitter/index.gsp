<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to #eMOVIX</title>
	</head>
	<body>
		<div class="container">
			<div class="page-header">
				<h1><g:message code="twitter.status.title" args="[entityName]" /></h1>
			</div>
			<p>Current Twitter API status: <a href="https://dev.twitter.com/overview/status" target="_blank">API Status | Twitter Developers</a></p>
			<p>Current limits:</p>
	  		<table class="table table-stripped table-bordered table-condensed">
	  			<thead>
	  				<tr>
	  					<th><g:message code="twitter.status.endpoint" /></th>
	  					<th><g:message code="twitter.status.limit" /></th>
	  					<th><g:message code="twitter.status.remaining" /></th>
	  					<th><g:message code="twitter.status.resetTimeInSeconds" /></th>
	  					<th><g:message code="twitter.status.secondsUntilReset" /></th>
  					</tr>
 					</thead>
 					<tbody>
 						<g:each in="${rateLimits}" var="rateLimit">
 						<tr class="${rateLimit.limit == rateLimit.remaining ? 'success' : (rateLimit.remaining == 0 ? 'danger' : 'warning')}">
 							<td>${rateLimit.endpoint}</td>
 							<td>${rateLimit.limit}</td>
 							<td>${rateLimit.remaining}</td>
 							<td>${rateLimit.resetTimeInSeconds}</td>
 							<td>${rateLimit.secondsUntilReset}</td>
					</tr>
	  				</g:each>
 					</tbody>
	  		</table>
		</div>
	</body>
</html>

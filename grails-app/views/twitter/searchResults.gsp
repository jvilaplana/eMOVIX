<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<script type="text/javascript">
var user = '';

function showAddToGroupModal(userName) {
	user = userName;
	$('#twitterUserToMonitor').html(user);
	$('#myModal').modal('show');
	console.log(user);
}

$(function () {
	$('#closeModalBtn').click(function() { $('#myModal').modal('hide'); });
});
</script>
</head>
<body>
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel"><g:message code="twitter.searchResults.addToGroup.title" /></h4>
				</div>
				<div class="modal-body">
					<p><g:message code="twitter.searchResults.addToGroup.text1" />: @<span id="twitterUserToMonitor"></span></p>
					<p><g:message code="twitter.searchResults.addToGroup.text2" />.</p>
					<div class="well">
						<g:select name="monitorGroup" from="${monitorGroups}" />
					</div>
					<p>
						<input type="hidden" id="victimUsername" name="victimUsername" value="" />
						<div id="victimRadio"></div>
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="closeModalBtn"><g:message code="default.button.cancel.label" /></button>
					<button type="button" class="btn btn-primary" id="confirmBullyingBtn" disabled><g:message code="default.add.label" args="['']" /></button>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="page-header">
			<h1>
				<g:message code="twitter.searchResults.title" />
			</h1>
		</div>
		<g:form action="searchResults">
			<g:hiddenField name="query" value="${nextQuery?.query}" />
			<g:hiddenField name="maxId" value="${nextQuery?.maxId}" />
			<g:submitButton class="btn btn-primary" name="nextPage" value="${g.message(code: 'twitter.searchResults.nextPage')}" />
		</g:form>
		<p>&nbsp;</p>
		<g:each var="result" in="${results}">
			<div class="well">
				<blockquote>
					<span id="tweet"> <a href="https://twitter.com/${result?.getUser()?.screenName}/status/${result?.id}"
						target="_blank">
							${result?.text}
					</a>
					</span>
					<footer id="username">
						<a href="https://twitter.com/${result?.getUser()?.screenName}" target="_blank">@${result?.getUser()?.screenName}</a>
					</footer>
				</blockquote>
				<a href="#" class="btn btn-primary" onclick="showAddToGroupModal('${result?.getUser()?.screenName}');"><g:message code="twitter.searchResults.addToGroup" /></a>
			</div>
		</g:each>
	</div>
</body>
</html>

<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName" value="${message(code: 'twitterQuery.label', default: 'TwitterQuery')}" />
<link rel="stylesheet" href="${resource(dir: 'css', file: 'dashboard.css')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
<script type="text/javascript">

		function updateVictimUsername(victim) {
			$('#victimUsername').val(victim);
		}

		var classifications = [];
		$(function () {
			$('#myModal').on('shown.bs.modal', function () {
			    $('#myInput').focus()
			  });

			$('#confirmBullyingBtn').click(function() {
				sendReview(true);
				$('#myModal').modal('hide');
			});

			$('#closeModalBtn').click(function() { $('#myModal').modal('hide'); });

			<g:each in="${twitterQueryResponseClassificationList}" status="i" var="c">
				var c = {};
				c.responseId = '${c.queryResponse?.id}';
				c.score = '${c.score}';
				c.ranking = '${c.ranking}';
				c.name = '${c.queryResponse?.screenName}';
				c.text = '${c.queryResponse?.text?.replace('\n', ' ')}';
				c.statusId = '${c.queryResponse?.statusId}';
				classifications.push(c);
			</g:each>

			updateTweet();

			$("#reviewYes").click(function() {
				sendReview(true);
			});
			$("#reviewNo").click(function() { sendReview(false); });
			$("#reviewSkip").click(function() {
				updateTweet();
				$("#tweetPanel").effect("bounce", {}, 500);
			});
		});

		function sendReview(rev) {
			$.ajax({
			  type: "POST",
			  url: "${createLink(controller:'twitterQueryResponseReview', action:'ajaxSave')}",
			  dataType: 'json',
			  data: {
				isBullying: rev,
				victimUsername: $('#victimUsername').val(),
				'user.id': ${user},
				'response.id': $('#responseId').html()
			  },
			  beforeSend: function( xhr ) {
			    xhr.overrideMimeType("text/json; charset=x-user-defined");
			  },
			  success: function(result) {
				  updateTweet();
				  if(rev) $("#tweetPanel").effect("slide", {}, 500);
				  else $("#tweetPanel").effect("shake", {}, 500);
			  },
			  error: function(jqXHR, textStatus, errorThrown) {
				  console.log("Error!");
			  }
			});
		}

		function updateTweet() {
			classifications.splice(0, 1);
			$("#reviewAmount").html(classifications.length);
			$("#username").html('<a href="https://twitter.com/' + classifications[0].name + '" target="_blank">@' + classifications[0].name + '</a>');
			$("#tweet").html('<a href="https://twitter.com/' + classifications[0].name + '/status/' + classifications[0].statusId + '" target="_blank">' + classifications[0].text + '</a>');
			$("#responseId").html(classifications[0].responseId);

			var pattern = /\B@[a-z0-9_-]+/gi;
			var usernames = classifications[0].text.match(pattern);

			$("#victimRadio").html('');
			for(var u in usernames) {
				$("#victimRadio").html($("#victimRadio").html() +
						'<div class="radio"><label><input type="radio" onclick="updateVictimUsername(\'' + usernames[u] + '\')" id="victim_' + u + '" name="victim" value="' + usernames[u] + '" />' + usernames[u] + '</label></div>');

			}

			$("#victimRadio").html($("#victimRadio").html() + '<div class="radio"><label><input id="victimOtherRadio" type="radio" name="victim" value="-1" />Other</label></div>');

			$('#victimOtherRadio').click(function() {
				if(!$('#victimOther').length) {
					$("#victimRadio").append(
						'<form class="form-inline"><div id="victimOtherGroup" class="form-group">' +
							'<label for="victimOther">Provide a valid Twitter username:</label> <input type="text" id="victimOther" name="victimOther" class="form-control" placeholder="@username" />' +
						'</div> ' +
						'<a href="#" id="checkUsernameBtn" class="btn btn-primary"><span id="checkUsernameBtnIcon" class="glyphicon glyphicon-ok"></span></a></form>'
					);
					$('#checkUsernameBtn').click(function() {
						$.ajax({
						  url: "${g.createLink(action: 'ajaxCheckTwitterUsername')}",
						  data: { username: $('#victimOther').val() },
						  beforeSend: function( xhr ) {
			  		        xhr.overrideMimeType( "text/plain; charset=x-user-defined" );
					      }
						})
					    .done(function( data ) {
						    console.log(data);
						    console.log(data == true);
							if(data == true) {
								$('#confirmBullyingBtn').prop('disabled', false);
								$('#checkUsernameBtn').switchClass('btn-primary', 'btn-success');
								$('#victimOtherGroup').addClass('has-success');
								updateVictimUsername($('#victimOther').val());
							}
				    		else {
					    		$('#checkUsernameBtn').switchClass('btn-primary', 'btn-danger');
					    		$('#checkUsernameBtn').switchClass('btn-success', 'btn-danger');
					    		$('#victimOtherGroup').switchClass('has-success', 'has-error');
					    		$('#victimOther').focus();
							}
						});
					});
					$('#victimOther').on('input', function() {
						$('#confirmBullyingBtn').prop('disabled', true);
						$('#checkUsernameBtn').switchClass('btn-success', 'btn-primary');
						$('#checkUsernameBtn').switchClass('btn-danger', 'btn-primary');
						$('#victimOtherGroup').removeClass('has-error');
						$('#victimOtherGroup').removeClass('has-success');
					});
				}
			});

			if(usernames == null || usernames.length == 0) {
				$('#victimOtherRadio').click();
			}

			$("input").click(function() {
				if($(this).attr('id').indexOf("victim_") != -1) {
					$('#confirmBullyingBtn').prop('disabled', false);
					$('#victimOther').val($(this).val());
				}
				else if($(this).attr('id') == "victimOtherRadio") {
					$('#confirmBullyingBtn').prop('disabled', true);
					$(this).val('');
				}
			});
		}
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
					<h4 class="modal-title" id="myModalLabel">Mark this message as bullying?</h4>
				</div>
				<div class="modal-body">
					<p>You are about to mark this tweet as bullying.</p>
					<p>Could you provide the username of the victim please?</p>
					<p>
						<input type="hidden" id="victimUsername" name="victimUsername" value="" />
					<div id="victimRadio"></div>
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="closeModalBtn">Close</button>
					<button type="button" class="btn btn-primary" id="confirmBullyingBtn" disabled>Save changes</button>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<g:render template="/twitterQuery/dashboardMenu" />
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">Review bullying messages</h1>
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>
				<div class="jumbotron">
					<div class="pull-right">
						<span id="reviewAmount" class="badge"></span>
					</div>
					<h2>Is this bullying?</h2>
					<div id="tweetPanel" class="panel panel-primary">
						<div class="panel-body">
							<span id="responseId" class="hidden"></span>
							<blockquote>
								<span id="tweet"></span>
								<footer id="username"></footer>
							</blockquote>
						</div>
					</div>
					<p>
						<button type="button" class="btn btn-danger btn-lg" data-toggle="modal" data-target="#myModal">
							<span class="glyphicon glyphicon-flag"></span> Yes
						</button>
						<%--
						<a id="reviewYes" class="btn btn-danger btn-lg" href="#" role="button"> <span class="glyphicon glyphicon-flag"></span>
							Yes
						</a>
						--%>
						<a id="reviewNo" class="btn btn-success btn-lg" href="#" role="button"> <span class="glyphicon glyphicon-ok"></span>
							No
						</a> <a id="reviewSkip" class="btn btn-default btn-lg" href="#" role="button"> <span
							class="glyphicon glyphicon-chevron-right"></span> Skip
						</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

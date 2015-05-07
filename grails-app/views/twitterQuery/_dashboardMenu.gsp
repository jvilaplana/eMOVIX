<div class="col-sm-3 col-md-2 sidebar">
	<ul class="nav nav-sidebar">
		<li class="${params?.action == 'dashboard' ? 'active' : ''}">
			<g:link action="dashboard" id="${twitterQueryInstance?.id}">
				<span class="glyphicon glyphicon-dashboard"></span>
				Overview
			</g:link>
		</li>
	</ul>
	<ul class="nav nav-sidebar">
		<li>
			<g:link class="" action="dashboard" id="${twitterQueryInstance?.id}">
				<span class="glyphicon glyphicon-refresh"></span>
				<g:message code="default.refresh.label" args="[entityName]" />
			</g:link>
		</li>
		<li>
			<g:if test="${twitterQueryInstance?.enabled}">
				<g:link class="has-spinner" action="disable" resource="${twitterQueryInstance}">
					<span class="glyphicon glyphicon-stop"></span>
					<g:message code="default.disable.label" />
					<span class="spinner"><span class="glyphicon glyphicon-refresh spin"></span></span>
				</g:link>
			</g:if>
			<g:else>
				<g:link class="has-spinner" action="enable" resource="${twitterQueryInstance}">
					<span class="glyphicon glyphicon-play"></span>
					<g:message code="default.enable.label" />
					<span class="spinner"><span class="glyphicon glyphicon-refresh spin"></span></span>
				</g:link>
			</g:else>
		</li>
		<li>
			<g:link class="has-spinner" controller="twitterQueryResponse" action="index" id="${twitterQueryInstance?.id}">
				<span class="glyphicon glyphicon-play-circle"></span>
				<g:message code="twitterQuery.showResponses.label" />
				<span class="spinner"><span class="glyphicon glyphicon-refresh spin"></span></span>
			</g:link>
		</li>
		<li class="${params?.action == 'review' ? 'active' : ''}">
			<g:link class="has-spinner" controller="twitterQuery" action="review" id="${twitterQueryInstance?.id}">
				<span class="glyphicon glyphicon-eye-open"></span>
				Review messages
				<span class="spinner"><span class="glyphicon glyphicon-refresh spin"></span></span>
			</g:link>
		</li>
	</ul>
	<ul class="nav nav-sidebar">
		<li>
			<g:link class="" action="create">
				<span class="glyphicon glyphicon-plus"></span>
				<g:message code="default.new.label" args="[entityName]" />
			</g:link>
		</li>
		<li>
			<g:link class="" action="index">
				<span class="glyphicon glyphicon-list"></span>
				<g:message code="default.list.label" args="[entityName]" />
			</g:link>
		</li>
	</ul>
	<ul class="nav nav-sidebar">
		<li>
			<g:link class="" action="edit" resource="${twitterQueryInstance}">
				<span class="glyphicon glyphicon-edit"></span>
				<g:message code="default.button.edit.label" default="Edit" />
			</g:link>
		</li>
	</ul>
	<g:form url="[resource:twitterQueryInstance, action:'delete']" method="DELETE">
		<fieldset class="buttons">
			<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
		</fieldset>
	</g:form>
</div>

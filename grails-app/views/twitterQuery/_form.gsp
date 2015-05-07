<%@ page import="com.jordiv.emovix.TwitterQuery" %>
<div class="form-group ${hasErrors(bean: twitterQueryInstance, field: 'name', 'error')}">
	<label for="name">
		<g:message code="twitterQuery.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" class="form-control" placeholder="Descriptive name" required="" value="${twitterQueryInstance?.name}"/>
</div>
<div class="form-group ${hasErrors(bean: twitterQueryInstance, field: 'query', 'error')}">
	<label for="query">
		<g:message code="twitterQuery.query.label" default="Query" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="query" class="form-control" placeholder="Desired query" required="" value="${twitterQueryInstance?.query}"/>
</div>
<div class="form-group ${hasErrors(bean: twitterQueryInstance, field: 'count', 'error')}">
	<label for="count">
		<g:message code="twitterQuery.count.label" default="Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="count" class="form-control" placeholder="Number of desired results [1-100]" min="1" max="100" required="" value="${twitterQueryInstance?.count}" />
</div>
<div class="checkbox ${hasErrors(bean: twitterQueryInstance, field: 'enabled', 'error')}">
	<label for="enabled">
		<g:checkBox name="enabled" value="${twitterQueryInstance?.enabled}" /> 
		<g:message code="twitterQuery.enabled.label" />
	</label>
</div>

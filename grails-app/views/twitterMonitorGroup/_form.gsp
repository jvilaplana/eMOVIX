<%@ page import="com.jordiv.emovix.twitter.TwitterMonitorGroup" %>


<div class="form-group ${hasErrors(bean: twitterMonitorGroupInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="twitterMonitorGroup.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="description" required="" value="${twitterMonitorGroupInstance?.description}"/>

</div>
<div class="form-group ${hasErrors(bean: twitterMonitorGroupInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="twitterMonitorGroup.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="name" required="" value="${twitterMonitorGroupInstance?.name}"/>

</div>
<div class="form-group ${hasErrors(bean: twitterMonitorGroupInstance, field: 'users', 'error')} ">
	<label for="users">
		<g:message code="twitterMonitorGroup.users.label" default="Users" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${twitterMonitorGroupInstance?.users?}" var="u">
    <li><g:link controller="twitterMonitorUser" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="twitterMonitorUser" action="create" params="['twitterMonitorGroup.id': twitterMonitorGroupInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'twitterMonitorUser.label', default: 'TwitterMonitorUser')])}</g:link>
</li>
</ul>


</div>

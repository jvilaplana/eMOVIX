<%@ page import="com.jordiv.emovix.twitter.TwitterMonitorUser" %>


<div class="form-group ${hasErrors(bean: twitterMonitorUserInstance, field: 'group', 'error')} required">
	<label for="group">
		<g:message code="twitterMonitorUser.group.label" default="Group" />
		<span class="required-indicator">*</span>
	</label>
	<g:select class="form-control" id="group" name="group.id" from="${com.jordiv.emovix.twitter.TwitterMonitorGroup.list()}" optionKey="id" required="" value="${twitterMonitorUserInstance?.group?.id}" class="many-to-one"/>

</div>
<%--
<div class="form-group ${hasErrors(bean: twitterMonitorUserInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="twitterMonitorUser.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select class="form-control" id="user" name="user.id" from="${com.jordiv.emovix.twitter.TwitterUser.list()}" optionKey="id" required="" value="${twitterMonitorUserInstance?.user?.id}" class="many-to-one"/>
</div>
--%>
<g:if test="${params?.action == 'create'}">
	<div class="form-group ${hasErrors(bean: twitterQueryInstance, field: 'user', 'error')}">
		<label for="userName">
			<g:message code="twitterMonitorUser.user.label" />
			<span class="required-indicator">*</span>
		</label>
		<g:textField name="userName" class="form-control" placeholder="" required="" value="${params?.userName}"/>
	</div>
</g:if>


<%@ page import="com.jordiv.emovix.TwitterQueryResponse" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'twitterQueryResponse.label', default: 'TwitterQueryResponse')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-twitterQueryResponse" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-twitterQueryResponse" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list twitterQueryResponse">
			
				<g:if test="${twitterQueryResponseInstance?.latitude}">
				<li class="fieldcontain">
					<span id="latitude-label" class="property-label"><g:message code="twitterQueryResponse.latitude.label" default="Latitude" /></span>
					
						<span class="property-value" aria-labelledby="latitude-label"><g:fieldValue bean="${twitterQueryResponseInstance}" field="latitude"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${twitterQueryResponseInstance?.longitude}">
				<li class="fieldcontain">
					<span id="longitude-label" class="property-label"><g:message code="twitterQueryResponse.longitude.label" default="Longitude" /></span>
					
						<span class="property-value" aria-labelledby="longitude-label"><g:fieldValue bean="${twitterQueryResponseInstance}" field="longitude"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${twitterQueryResponseInstance?.statusId}">
				<li class="fieldcontain">
					<span id="statusId-label" class="property-label"><g:message code="twitterQueryResponse.statusId.label" default="Status Id" /></span>
					
						<span class="property-value" aria-labelledby="statusId-label"><g:fieldValue bean="${twitterQueryResponseInstance}" field="statusId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${twitterQueryResponseInstance?.createdAt}">
				<li class="fieldcontain">
					<span id="createdAt-label" class="property-label"><g:message code="twitterQueryResponse.createdAt.label" default="Created At" /></span>
					
						<span class="property-value" aria-labelledby="createdAt-label"><g:formatDate date="${twitterQueryResponseInstance?.createdAt}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${twitterQueryResponseInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="twitterQueryResponse.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${twitterQueryResponseInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${twitterQueryResponseInstance?.favoriteCount}">
				<li class="fieldcontain">
					<span id="favoriteCount-label" class="property-label"><g:message code="twitterQueryResponse.favoriteCount.label" default="Favorite Count" /></span>
					
						<span class="property-value" aria-labelledby="favoriteCount-label"><g:fieldValue bean="${twitterQueryResponseInstance}" field="favoriteCount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${twitterQueryResponseInstance?.inReplyToScreenName}">
				<li class="fieldcontain">
					<span id="inReplyToScreenName-label" class="property-label"><g:message code="twitterQueryResponse.inReplyToScreenName.label" default="In Reply To Screen Name" /></span>
					
						<span class="property-value" aria-labelledby="inReplyToScreenName-label"><g:fieldValue bean="${twitterQueryResponseInstance}" field="inReplyToScreenName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${twitterQueryResponseInstance?.inReplyToStatusId}">
				<li class="fieldcontain">
					<span id="inReplyToStatusId-label" class="property-label"><g:message code="twitterQueryResponse.inReplyToStatusId.label" default="In Reply To Status Id" /></span>
					
						<span class="property-value" aria-labelledby="inReplyToStatusId-label"><g:fieldValue bean="${twitterQueryResponseInstance}" field="inReplyToStatusId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${twitterQueryResponseInstance?.inReplyToUserId}">
				<li class="fieldcontain">
					<span id="inReplyToUserId-label" class="property-label"><g:message code="twitterQueryResponse.inReplyToUserId.label" default="In Reply To User Id" /></span>
					
						<span class="property-value" aria-labelledby="inReplyToUserId-label"><g:fieldValue bean="${twitterQueryResponseInstance}" field="inReplyToUserId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${twitterQueryResponseInstance?.lang}">
				<li class="fieldcontain">
					<span id="lang-label" class="property-label"><g:message code="twitterQueryResponse.lang.label" default="Lang" /></span>
					
						<span class="property-value" aria-labelledby="lang-label"><g:fieldValue bean="${twitterQueryResponseInstance}" field="lang"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${twitterQueryResponseInstance?.possiblySensitive}">
				<li class="fieldcontain">
					<span id="possiblySensitive-label" class="property-label"><g:message code="twitterQueryResponse.possiblySensitive.label" default="Possibly Sensitive" /></span>
					
						<span class="property-value" aria-labelledby="possiblySensitive-label"><g:formatBoolean boolean="${twitterQueryResponseInstance?.possiblySensitive}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${twitterQueryResponseInstance?.query}">
				<li class="fieldcontain">
					<span id="query-label" class="property-label"><g:message code="twitterQueryResponse.query.label" default="Query" /></span>
					
						<span class="property-value" aria-labelledby="query-label"><g:link controller="twitterQuery" action="show" id="${twitterQueryResponseInstance?.query?.id}">${twitterQueryResponseInstance?.query?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${twitterQueryResponseInstance?.retweetCount}">
				<li class="fieldcontain">
					<span id="retweetCount-label" class="property-label"><g:message code="twitterQueryResponse.retweetCount.label" default="Retweet Count" /></span>
					
						<span class="property-value" aria-labelledby="retweetCount-label"><g:fieldValue bean="${twitterQueryResponseInstance}" field="retweetCount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${twitterQueryResponseInstance?.retweetedStatus}">
				<li class="fieldcontain">
					<span id="retweetedStatus-label" class="property-label"><g:message code="twitterQueryResponse.retweetedStatus.label" default="Retweeted Status" /></span>
					
						<span class="property-value" aria-labelledby="retweetedStatus-label"><g:link controller="twitterQueryResponse" action="show" id="${twitterQueryResponseInstance?.retweetedStatus?.id}">${twitterQueryResponseInstance?.retweetedStatus?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${twitterQueryResponseInstance?.screenName}">
				<li class="fieldcontain">
					<span id="screenName-label" class="property-label"><g:message code="twitterQueryResponse.screenName.label" default="Screen Name" /></span>
					
						<span class="property-value" aria-labelledby="screenName-label"><g:fieldValue bean="${twitterQueryResponseInstance}" field="screenName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${twitterQueryResponseInstance?.source}">
				<li class="fieldcontain">
					<span id="source-label" class="property-label"><g:message code="twitterQueryResponse.source.label" default="Source" /></span>
					
						<span class="property-value" aria-labelledby="source-label"><g:fieldValue bean="${twitterQueryResponseInstance}" field="source"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${twitterQueryResponseInstance?.text}">
				<li class="fieldcontain">
					<span id="text-label" class="property-label"><g:message code="twitterQueryResponse.text.label" default="Text" /></span>
					
						<span class="property-value" aria-labelledby="text-label"><g:fieldValue bean="${twitterQueryResponseInstance}" field="text"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:twitterQueryResponseInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${twitterQueryResponseInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

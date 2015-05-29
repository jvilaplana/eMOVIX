
<%@ page import="com.jordiv.emovix.twitter.TwitterUser" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'twitterUser.label', default: 'TwitterUser')}" />
</head>
<body>
	<div class="container-fluid">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h2><g:message code="default.show.label" args="[entityName]" /></h2>
			</div>
			<div class="panel-body">
				<g:if test="${flash.message}">
					<div class="alert alert-danger" role="alert">${flash.message}</div>
				</g:if>
				<div class="pull-right">
					<g:link class="btn btn-primary" action="index">
						<span class="glyphicon glyphicon-list"></span> <g:message code="default.list.label" args="[entityName]" />
					</g:link>
					<g:link class="btn btn-primary" action="create">
						<span class="glyphicon glyphicon-plus"></span> <g:message code="default.new.label" args="[entityName]" />
					</g:link>
				</div>
				<div class="clearfix"></div>
				<div class="container-fluid">
				
					<g:if test="${twitterUserInstance?.timeZone}">
					<p>
						<strong><g:message code="twitterUser.timeZone.label" default="Time Zone" />: </strong>
						
							<span class="property-value" aria-labelledby="timeZone-label"><g:fieldValue bean="${twitterUserInstance}" field="timeZone"/></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserInstance?.url}">
					<p>
						<strong><g:message code="twitterUser.url.label" default="Url" />: </strong>
						
							<span class="property-value" aria-labelledby="url-label"><g:fieldValue bean="${twitterUserInstance}" field="url"/></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserInstance?.biggerProfileImageURL}">
					<p>
						<strong><g:message code="twitterUser.biggerProfileImageURL.label" default="Bigger Profile Image URL" />: </strong>
						
							<span class="property-value" aria-labelledby="biggerProfileImageURL-label"><g:fieldValue bean="${twitterUserInstance}" field="biggerProfileImageURL"/></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserInstance?.biggerProfileImageURLHttps}">
					<p>
						<strong><g:message code="twitterUser.biggerProfileImageURLHttps.label" default="Bigger Profile Image URLH ttps" />: </strong>
						
							<span class="property-value" aria-labelledby="biggerProfileImageURLHttps-label"><g:fieldValue bean="${twitterUserInstance}" field="biggerProfileImageURLHttps"/></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserInstance?.createdAt}">
					<p>
						<strong><g:message code="twitterUser.createdAt.label" default="Created At" />: </strong>
						
							<span class="property-value" aria-labelledby="createdAt-label"><g:formatDate date="${twitterUserInstance?.createdAt}" /></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserInstance?.dateCreated}">
					<p>
						<strong><g:message code="twitterUser.dateCreated.label" default="Date Created" />: </strong>
						
							<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${twitterUserInstance?.dateCreated}" /></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserInstance?.description}">
					<p>
						<strong><g:message code="twitterUser.description.label" default="Description" />: </strong>
						
							<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${twitterUserInstance}" field="description"/></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserInstance?.favouritesCount}">
					<p>
						<strong><g:message code="twitterUser.favouritesCount.label" default="Favourites Count" />: </strong>
						
							<span class="property-value" aria-labelledby="favouritesCount-label"><g:fieldValue bean="${twitterUserInstance}" field="favouritesCount"/></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserInstance?.followersCount}">
					<p>
						<strong><g:message code="twitterUser.followersCount.label" default="Followers Count" />: </strong>
						
							<span class="property-value" aria-labelledby="followersCount-label"><g:fieldValue bean="${twitterUserInstance}" field="followersCount"/></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserInstance?.friendsCount}">
					<p>
						<strong><g:message code="twitterUser.friendsCount.label" default="Friends Count" />: </strong>
						
							<span class="property-value" aria-labelledby="friendsCount-label"><g:fieldValue bean="${twitterUserInstance}" field="friendsCount"/></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserInstance?.getStatusesCount}">
					<p>
						<strong><g:message code="twitterUser.getStatusesCount.label" default="Get Statuses Count" />: </strong>
						
							<span class="property-value" aria-labelledby="getStatusesCount-label"><g:fieldValue bean="${twitterUserInstance}" field="getStatusesCount"/></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserInstance?.isDefaultProfile}">
					<p>
						<strong><g:message code="twitterUser.isDefaultProfile.label" default="Is Default Profile" />: </strong>
						
							<span class="property-value" aria-labelledby="isDefaultProfile-label"><g:formatBoolean boolean="${twitterUserInstance?.isDefaultProfile}" /></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserInstance?.isDefaultProfileImage}">
					<p>
						<strong><g:message code="twitterUser.isDefaultProfileImage.label" default="Is Default Profile Image" />: </strong>
						
							<span class="property-value" aria-labelledby="isDefaultProfileImage-label"><g:formatBoolean boolean="${twitterUserInstance?.isDefaultProfileImage}" /></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserInstance?.isGeoEnabled}">
					<p>
						<strong><g:message code="twitterUser.isGeoEnabled.label" default="Is Geo Enabled" />: </strong>
						
							<span class="property-value" aria-labelledby="isGeoEnabled-label"><g:formatBoolean boolean="${twitterUserInstance?.isGeoEnabled}" /></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserInstance?.isProtected}">
					<p>
						<strong><g:message code="twitterUser.isProtected.label" default="Is Protected" />: </strong>
						
							<span class="property-value" aria-labelledby="isProtected-label"><g:formatBoolean boolean="${twitterUserInstance?.isProtected}" /></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserInstance?.isVerified}">
					<p>
						<strong><g:message code="twitterUser.isVerified.label" default="Is Verified" />: </strong>
						
							<span class="property-value" aria-labelledby="isVerified-label"><g:formatBoolean boolean="${twitterUserInstance?.isVerified}" /></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserInstance?.lang}">
					<p>
						<strong><g:message code="twitterUser.lang.label" default="Lang" />: </strong>
						
							<span class="property-value" aria-labelledby="lang-label"><g:fieldValue bean="${twitterUserInstance}" field="lang"/></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserInstance?.lastUpdated}">
					<p>
						<strong><g:message code="twitterUser.lastUpdated.label" default="Last Updated" />: </strong>
						
							<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${twitterUserInstance?.lastUpdated}" /></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserInstance?.location}">
					<p>
						<strong><g:message code="twitterUser.location.label" default="Location" />: </strong>
						
							<span class="property-value" aria-labelledby="location-label"><g:fieldValue bean="${twitterUserInstance}" field="location"/></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserInstance?.miniProfileImageURLHttps}">
					<p>
						<strong><g:message code="twitterUser.miniProfileImageURLHttps.label" default="Mini Profile Image URLH ttps" />: </strong>
						
							<span class="property-value" aria-labelledby="miniProfileImageURLHttps-label"><g:fieldValue bean="${twitterUserInstance}" field="miniProfileImageURLHttps"/></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserInstance?.miniprofileImageURL}">
					<p>
						<strong><g:message code="twitterUser.miniprofileImageURL.label" default="Miniprofile Image URL" />: </strong>
						
							<span class="property-value" aria-labelledby="miniprofileImageURL-label"><g:fieldValue bean="${twitterUserInstance}" field="miniprofileImageURL"/></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserInstance?.name}">
					<p>
						<strong><g:message code="twitterUser.name.label" default="Name" />: </strong>
						
							<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${twitterUserInstance}" field="name"/></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserInstance?.screenName}">
					<p>
						<strong><g:message code="twitterUser.screenName.label" default="Screen Name" />: </strong>
						
							<span class="property-value" aria-labelledby="screenName-label"><g:fieldValue bean="${twitterUserInstance}" field="screenName"/></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserInstance?.userId}">
					<p>
						<strong><g:message code="twitterUser.userId.label" default="User Id" />: </strong>
						
							<span class="property-value" aria-labelledby="userId-label"><g:fieldValue bean="${twitterUserInstance}" field="userId"/></span>
						
					</p>
					</g:if>
				
				</div>
				<hr />
				<g:form url="[resource:twitterUserInstance, action:'delete']" method="DELETE">
					<div>
						<g:link class="btn btn-default" action="edit" resource="${twitterUserInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</div>
				</g:form>
			</div>
		</div>
	</div>
</body>
</html>

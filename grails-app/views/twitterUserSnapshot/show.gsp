
<%@ page import="com.jordiv.emovix.twitter.TwitterUserSnapshot" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'twitterUserSnapshot.label', default: 'TwitterUserSnapshot')}" />
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
				
					<g:if test="${twitterUserSnapshotInstance?.biggerProfileImageURL}">
					<p>
						<strong><g:message code="twitterUserSnapshot.biggerProfileImageURL.label" default="Bigger Profile Image URL" />: </strong>
						
							<span class="property-value" aria-labelledby="biggerProfileImageURL-label"><g:fieldValue bean="${twitterUserSnapshotInstance}" field="biggerProfileImageURL"/></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserSnapshotInstance?.biggerProfileImageURLHttps}">
					<p>
						<strong><g:message code="twitterUserSnapshot.biggerProfileImageURLHttps.label" default="Bigger Profile Image URLH ttps" />: </strong>
						
							<span class="property-value" aria-labelledby="biggerProfileImageURLHttps-label"><g:fieldValue bean="${twitterUserSnapshotInstance}" field="biggerProfileImageURLHttps"/></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserSnapshotInstance?.dateCreated}">
					<p>
						<strong><g:message code="twitterUserSnapshot.dateCreated.label" default="Date Created" />: </strong>
						
							<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${twitterUserSnapshotInstance?.dateCreated}" /></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserSnapshotInstance?.description}">
					<p>
						<strong><g:message code="twitterUserSnapshot.description.label" default="Description" />: </strong>
						
							<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${twitterUserSnapshotInstance}" field="description"/></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserSnapshotInstance?.favouritesCount}">
					<p>
						<strong><g:message code="twitterUserSnapshot.favouritesCount.label" default="Favourites Count" />: </strong>
						
							<span class="property-value" aria-labelledby="favouritesCount-label"><g:fieldValue bean="${twitterUserSnapshotInstance}" field="favouritesCount"/></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserSnapshotInstance?.followersCount}">
					<p>
						<strong><g:message code="twitterUserSnapshot.followersCount.label" default="Followers Count" />: </strong>
						
							<span class="property-value" aria-labelledby="followersCount-label"><g:fieldValue bean="${twitterUserSnapshotInstance}" field="followersCount"/></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserSnapshotInstance?.friendsCount}">
					<p>
						<strong><g:message code="twitterUserSnapshot.friendsCount.label" default="Friends Count" />: </strong>
						
							<span class="property-value" aria-labelledby="friendsCount-label"><g:fieldValue bean="${twitterUserSnapshotInstance}" field="friendsCount"/></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserSnapshotInstance?.statusesCount}">
					<p>
						<strong><g:message code="twitterUserSnapshot.statusesCount.label" default="Get Statuses Count" />: </strong>
						
							<span class="property-value" aria-labelledby="statusesCount-label"><g:fieldValue bean="${twitterUserSnapshotInstance}" field="statusesCount"/></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserSnapshotInstance?.isDefaultProfile}">
					<p>
						<strong><g:message code="twitterUserSnapshot.isDefaultProfile.label" default="Is Default Profile" />: </strong>
						
							<span class="property-value" aria-labelledby="isDefaultProfile-label"><g:formatBoolean boolean="${twitterUserSnapshotInstance?.isDefaultProfile}" /></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserSnapshotInstance?.isDefaultProfileImage}">
					<p>
						<strong><g:message code="twitterUserSnapshot.isDefaultProfileImage.label" default="Is Default Profile Image" />: </strong>
						
							<span class="property-value" aria-labelledby="isDefaultProfileImage-label"><g:formatBoolean boolean="${twitterUserSnapshotInstance?.isDefaultProfileImage}" /></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserSnapshotInstance?.isGeoEnabled}">
					<p>
						<strong><g:message code="twitterUserSnapshot.isGeoEnabled.label" default="Is Geo Enabled" />: </strong>
						
							<span class="property-value" aria-labelledby="isGeoEnabled-label"><g:formatBoolean boolean="${twitterUserSnapshotInstance?.isGeoEnabled}" /></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserSnapshotInstance?.isProtected}">
					<p>
						<strong><g:message code="twitterUserSnapshot.isProtected.label" default="Is Protected" />: </strong>
						
							<span class="property-value" aria-labelledby="isProtected-label"><g:formatBoolean boolean="${twitterUserSnapshotInstance?.isProtected}" /></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserSnapshotInstance?.isVerified}">
					<p>
						<strong><g:message code="twitterUserSnapshot.isVerified.label" default="Is Verified" />: </strong>
						
							<span class="property-value" aria-labelledby="isVerified-label"><g:formatBoolean boolean="${twitterUserSnapshotInstance?.isVerified}" /></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserSnapshotInstance?.lang}">
					<p>
						<strong><g:message code="twitterUserSnapshot.lang.label" default="Lang" />: </strong>
						
							<span class="property-value" aria-labelledby="lang-label"><g:fieldValue bean="${twitterUserSnapshotInstance}" field="lang"/></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserSnapshotInstance?.lastUpdated}">
					<p>
						<strong><g:message code="twitterUserSnapshot.lastUpdated.label" default="Last Updated" />: </strong>
						
							<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${twitterUserSnapshotInstance?.lastUpdated}" /></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserSnapshotInstance?.location}">
					<p>
						<strong><g:message code="twitterUserSnapshot.location.label" default="Location" />: </strong>
						
							<span class="property-value" aria-labelledby="location-label"><g:fieldValue bean="${twitterUserSnapshotInstance}" field="location"/></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserSnapshotInstance?.miniProfileImageURLHttps}">
					<p>
						<strong><g:message code="twitterUserSnapshot.miniProfileImageURLHttps.label" default="Mini Profile Image URLH ttps" />: </strong>
						
							<span class="property-value" aria-labelledby="miniProfileImageURLHttps-label"><g:fieldValue bean="${twitterUserSnapshotInstance}" field="miniProfileImageURLHttps"/></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserSnapshotInstance?.miniprofileImageURL}">
					<p>
						<strong><g:message code="twitterUserSnapshot.miniprofileImageURL.label" default="Miniprofile Image URL" />: </strong>
						
							<span class="property-value" aria-labelledby="miniprofileImageURL-label"><g:fieldValue bean="${twitterUserSnapshotInstance}" field="miniprofileImageURL"/></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserSnapshotInstance?.name}">
					<p>
						<strong><g:message code="twitterUserSnapshot.name.label" default="Name" />: </strong>
						
							<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${twitterUserSnapshotInstance}" field="name"/></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserSnapshotInstance?.screenName}">
					<p>
						<strong><g:message code="twitterUserSnapshot.screenName.label" default="Screen Name" />: </strong>
						
							<span class="property-value" aria-labelledby="screenName-label"><g:fieldValue bean="${twitterUserSnapshotInstance}" field="screenName"/></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserSnapshotInstance?.timeZone}">
					<p>
						<strong><g:message code="twitterUserSnapshot.timeZone.label" default="Time Zone" />: </strong>
						
							<span class="property-value" aria-labelledby="timeZone-label"><g:fieldValue bean="${twitterUserSnapshotInstance}" field="timeZone"/></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserSnapshotInstance?.url}">
					<p>
						<strong><g:message code="twitterUserSnapshot.url.label" default="Url" />: </strong>
						
							<span class="property-value" aria-labelledby="url-label"><g:fieldValue bean="${twitterUserSnapshotInstance}" field="url"/></span>
						
					</p>
					</g:if>
				
					<g:if test="${twitterUserSnapshotInstance?.user}">
					<p>
						<strong><g:message code="twitterUserSnapshot.user.label" default="User" />: </strong>
						
							<span class="property-value" aria-labelledby="user-label"><g:link controller="twitterUser" action="show" id="${twitterUserSnapshotInstance?.user?.id}">${twitterUserSnapshotInstance?.user?.encodeAsHTML()}</g:link></span>
						
					</p>
					</g:if>
				
				</div>
				<hr />
				<g:form url="[resource:twitterUserSnapshotInstance, action:'delete']" method="DELETE">
					<div>
						<g:link class="btn btn-default" action="edit" resource="${twitterUserSnapshotInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</div>
				</g:form>
			</div>
		</div>
	</div>
</body>
</html>

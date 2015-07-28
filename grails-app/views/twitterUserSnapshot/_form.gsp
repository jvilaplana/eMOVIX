<%@ page import="com.jordiv.emovix.twitter.TwitterUserSnapshot" %>


<div class="form-group ${hasErrors(bean: twitterUserSnapshotInstance, field: 'biggerProfileImageURL', 'error')} required">
	<label for="biggerProfileImageURL">
		<g:message code="twitterUserSnapshot.biggerProfileImageURL.label" default="Bigger Profile Image URL" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="biggerProfileImageURL" required="" value="${twitterUserSnapshotInstance?.biggerProfileImageURL}"/>

</div>
<div class="form-group ${hasErrors(bean: twitterUserSnapshotInstance, field: 'biggerProfileImageURLHttps', 'error')} required">
	<label for="biggerProfileImageURLHttps">
		<g:message code="twitterUserSnapshot.biggerProfileImageURLHttps.label" default="Bigger Profile Image URLH ttps" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="biggerProfileImageURLHttps" required="" value="${twitterUserSnapshotInstance?.biggerProfileImageURLHttps}"/>

</div>
<div class="form-group ${hasErrors(bean: twitterUserSnapshotInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="twitterUserSnapshot.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="description" required="" value="${twitterUserSnapshotInstance?.description}"/>

</div>
<div class="form-group ${hasErrors(bean: twitterUserSnapshotInstance, field: 'favouritesCount', 'error')} required">
	<label for="favouritesCount">
		<g:message code="twitterUserSnapshot.favouritesCount.label" default="Favourites Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="favouritesCount" type="number" value="${twitterUserSnapshotInstance.favouritesCount}" required=""/>

</div>
<div class="form-group ${hasErrors(bean: twitterUserSnapshotInstance, field: 'followersCount', 'error')} required">
	<label for="followersCount">
		<g:message code="twitterUserSnapshot.followersCount.label" default="Followers Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="followersCount" type="number" value="${twitterUserSnapshotInstance.followersCount}" required=""/>

</div>
<div class="form-group ${hasErrors(bean: twitterUserSnapshotInstance, field: 'friendsCount', 'error')} required">
	<label for="friendsCount">
		<g:message code="twitterUserSnapshot.friendsCount.label" default="Friends Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="friendsCount" type="number" value="${twitterUserSnapshotInstance.friendsCount}" required=""/>

</div>
<div class="form-group ${hasErrors(bean: twitterUserSnapshotInstance, field: 'statusesCount', 'error')} required">
	<label for="statusesCount">
		<g:message code="twitterUserSnapshot.statusesCount.label" default="Get Statuses Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="statusesCount" type="number" value="${twitterUserSnapshotInstance.statusesCount}" required=""/>

</div>
<div class="form-group ${hasErrors(bean: twitterUserSnapshotInstance, field: 'isDefaultProfile', 'error')} ">
	<label for="isDefaultProfile">
		<g:message code="twitterUserSnapshot.isDefaultProfile.label" default="Is Default Profile" />
		
	</label>
	<g:checkBox name="isDefaultProfile" value="${twitterUserSnapshotInstance?.isDefaultProfile}" />

</div>
<div class="form-group ${hasErrors(bean: twitterUserSnapshotInstance, field: 'isDefaultProfileImage', 'error')} ">
	<label for="isDefaultProfileImage">
		<g:message code="twitterUserSnapshot.isDefaultProfileImage.label" default="Is Default Profile Image" />
		
	</label>
	<g:checkBox name="isDefaultProfileImage" value="${twitterUserSnapshotInstance?.isDefaultProfileImage}" />

</div>
<div class="form-group ${hasErrors(bean: twitterUserSnapshotInstance, field: 'isGeoEnabled', 'error')} ">
	<label for="isGeoEnabled">
		<g:message code="twitterUserSnapshot.isGeoEnabled.label" default="Is Geo Enabled" />
		
	</label>
	<g:checkBox name="isGeoEnabled" value="${twitterUserSnapshotInstance?.isGeoEnabled}" />

</div>
<div class="form-group ${hasErrors(bean: twitterUserSnapshotInstance, field: 'isProtected', 'error')} ">
	<label for="isProtected">
		<g:message code="twitterUserSnapshot.isProtected.label" default="Is Protected" />
		
	</label>
	<g:checkBox name="isProtected" value="${twitterUserSnapshotInstance?.isProtected}" />

</div>
<div class="form-group ${hasErrors(bean: twitterUserSnapshotInstance, field: 'isVerified', 'error')} ">
	<label for="isVerified">
		<g:message code="twitterUserSnapshot.isVerified.label" default="Is Verified" />
		
	</label>
	<g:checkBox name="isVerified" value="${twitterUserSnapshotInstance?.isVerified}" />

</div>
<div class="form-group ${hasErrors(bean: twitterUserSnapshotInstance, field: 'lang', 'error')} required">
	<label for="lang">
		<g:message code="twitterUserSnapshot.lang.label" default="Lang" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="lang" required="" value="${twitterUserSnapshotInstance?.lang}"/>

</div>
<div class="form-group ${hasErrors(bean: twitterUserSnapshotInstance, field: 'location', 'error')} required">
	<label for="location">
		<g:message code="twitterUserSnapshot.location.label" default="Location" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="location" required="" value="${twitterUserSnapshotInstance?.location}"/>

</div>
<div class="form-group ${hasErrors(bean: twitterUserSnapshotInstance, field: 'miniProfileImageURLHttps', 'error')} required">
	<label for="miniProfileImageURLHttps">
		<g:message code="twitterUserSnapshot.miniProfileImageURLHttps.label" default="Mini Profile Image URLH ttps" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="miniProfileImageURLHttps" required="" value="${twitterUserSnapshotInstance?.miniProfileImageURLHttps}"/>

</div>
<div class="form-group ${hasErrors(bean: twitterUserSnapshotInstance, field: 'miniprofileImageURL', 'error')} required">
	<label for="miniprofileImageURL">
		<g:message code="twitterUserSnapshot.miniprofileImageURL.label" default="Miniprofile Image URL" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="miniprofileImageURL" required="" value="${twitterUserSnapshotInstance?.miniprofileImageURL}"/>

</div>
<div class="form-group ${hasErrors(bean: twitterUserSnapshotInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="twitterUserSnapshot.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="name" required="" value="${twitterUserSnapshotInstance?.name}"/>

</div>
<div class="form-group ${hasErrors(bean: twitterUserSnapshotInstance, field: 'screenName', 'error')} required">
	<label for="screenName">
		<g:message code="twitterUserSnapshot.screenName.label" default="Screen Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="screenName" required="" value="${twitterUserSnapshotInstance?.screenName}"/>

</div>
<div class="form-group ${hasErrors(bean: twitterUserSnapshotInstance, field: 'timeZone', 'error')} required">
	<label for="timeZone">
		<g:message code="twitterUserSnapshot.timeZone.label" default="Time Zone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="timeZone" required="" value="${twitterUserSnapshotInstance?.timeZone}"/>

</div>
<div class="form-group ${hasErrors(bean: twitterUserSnapshotInstance, field: 'url', 'error')} required">
	<label for="url">
		<g:message code="twitterUserSnapshot.url.label" default="Url" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="url" required="" value="${twitterUserSnapshotInstance?.url}"/>

</div>
<div class="form-group ${hasErrors(bean: twitterUserSnapshotInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="twitterUserSnapshot.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select class="form-control" id="user" name="user.id" from="${com.jordiv.emovix.twitter.TwitterUser.list()}" optionKey="id" required="" value="${twitterUserSnapshotInstance?.user?.id}" class="many-to-one"/>

</div>

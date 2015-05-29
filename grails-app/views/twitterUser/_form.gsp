<%@ page import="com.jordiv.emovix.twitter.TwitterUser" %>


<div class="form-group ${hasErrors(bean: twitterUserInstance, field: 'timeZone', 'error')} ">
	<label for="timeZone">
		<g:message code="twitterUser.timeZone.label" default="Time Zone" />
		
	</label>
	<g:textField class="form-control" name="timeZone" value="${twitterUserInstance?.timeZone}"/>

</div>
<div class="form-group ${hasErrors(bean: twitterUserInstance, field: 'url', 'error')} ">
	<label for="url">
		<g:message code="twitterUser.url.label" default="Url" />
		
	</label>
	<g:textField class="form-control" name="url" value="${twitterUserInstance?.url}"/>

</div>
<div class="form-group ${hasErrors(bean: twitterUserInstance, field: 'biggerProfileImageURL', 'error')} required">
	<label for="biggerProfileImageURL">
		<g:message code="twitterUser.biggerProfileImageURL.label" default="Bigger Profile Image URL" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="biggerProfileImageURL" required="" value="${twitterUserInstance?.biggerProfileImageURL}"/>

</div>
<div class="form-group ${hasErrors(bean: twitterUserInstance, field: 'biggerProfileImageURLHttps', 'error')} required">
	<label for="biggerProfileImageURLHttps">
		<g:message code="twitterUser.biggerProfileImageURLHttps.label" default="Bigger Profile Image URLH ttps" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="biggerProfileImageURLHttps" required="" value="${twitterUserInstance?.biggerProfileImageURLHttps}"/>

</div>
<div class="form-group ${hasErrors(bean: twitterUserInstance, field: 'createdAt', 'error')} required">
	<label for="createdAt">
		<g:message code="twitterUser.createdAt.label" default="Created At" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createdAt" precision="day"  value="${twitterUserInstance?.createdAt}"  />

</div>
<div class="form-group ${hasErrors(bean: twitterUserInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="twitterUser.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="description" required="" value="${twitterUserInstance?.description}"/>

</div>
<div class="form-group ${hasErrors(bean: twitterUserInstance, field: 'favouritesCount', 'error')} required">
	<label for="favouritesCount">
		<g:message code="twitterUser.favouritesCount.label" default="Favourites Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="favouritesCount" type="number" value="${twitterUserInstance.favouritesCount}" required=""/>

</div>
<div class="form-group ${hasErrors(bean: twitterUserInstance, field: 'followersCount', 'error')} required">
	<label for="followersCount">
		<g:message code="twitterUser.followersCount.label" default="Followers Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="followersCount" type="number" value="${twitterUserInstance.followersCount}" required=""/>

</div>
<div class="form-group ${hasErrors(bean: twitterUserInstance, field: 'friendsCount', 'error')} required">
	<label for="friendsCount">
		<g:message code="twitterUser.friendsCount.label" default="Friends Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="friendsCount" type="number" value="${twitterUserInstance.friendsCount}" required=""/>

</div>
<div class="form-group ${hasErrors(bean: twitterUserInstance, field: 'getStatusesCount', 'error')} required">
	<label for="getStatusesCount">
		<g:message code="twitterUser.getStatusesCount.label" default="Get Statuses Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="getStatusesCount" type="number" value="${twitterUserInstance.getStatusesCount}" required=""/>

</div>
<div class="form-group ${hasErrors(bean: twitterUserInstance, field: 'isDefaultProfile', 'error')} ">
	<label for="isDefaultProfile">
		<g:message code="twitterUser.isDefaultProfile.label" default="Is Default Profile" />
		
	</label>
	<g:checkBox name="isDefaultProfile" value="${twitterUserInstance?.isDefaultProfile}" />

</div>
<div class="form-group ${hasErrors(bean: twitterUserInstance, field: 'isDefaultProfileImage', 'error')} ">
	<label for="isDefaultProfileImage">
		<g:message code="twitterUser.isDefaultProfileImage.label" default="Is Default Profile Image" />
		
	</label>
	<g:checkBox name="isDefaultProfileImage" value="${twitterUserInstance?.isDefaultProfileImage}" />

</div>
<div class="form-group ${hasErrors(bean: twitterUserInstance, field: 'isGeoEnabled', 'error')} ">
	<label for="isGeoEnabled">
		<g:message code="twitterUser.isGeoEnabled.label" default="Is Geo Enabled" />
		
	</label>
	<g:checkBox name="isGeoEnabled" value="${twitterUserInstance?.isGeoEnabled}" />

</div>
<div class="form-group ${hasErrors(bean: twitterUserInstance, field: 'isProtected', 'error')} ">
	<label for="isProtected">
		<g:message code="twitterUser.isProtected.label" default="Is Protected" />
		
	</label>
	<g:checkBox name="isProtected" value="${twitterUserInstance?.isProtected}" />

</div>
<div class="form-group ${hasErrors(bean: twitterUserInstance, field: 'isVerified', 'error')} ">
	<label for="isVerified">
		<g:message code="twitterUser.isVerified.label" default="Is Verified" />
		
	</label>
	<g:checkBox name="isVerified" value="${twitterUserInstance?.isVerified}" />

</div>
<div class="form-group ${hasErrors(bean: twitterUserInstance, field: 'lang', 'error')} required">
	<label for="lang">
		<g:message code="twitterUser.lang.label" default="Lang" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="lang" required="" value="${twitterUserInstance?.lang}"/>

</div>
<div class="form-group ${hasErrors(bean: twitterUserInstance, field: 'location', 'error')} required">
	<label for="location">
		<g:message code="twitterUser.location.label" default="Location" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="location" required="" value="${twitterUserInstance?.location}"/>

</div>
<div class="form-group ${hasErrors(bean: twitterUserInstance, field: 'miniProfileImageURLHttps', 'error')} required">
	<label for="miniProfileImageURLHttps">
		<g:message code="twitterUser.miniProfileImageURLHttps.label" default="Mini Profile Image URLH ttps" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="miniProfileImageURLHttps" required="" value="${twitterUserInstance?.miniProfileImageURLHttps}"/>

</div>
<div class="form-group ${hasErrors(bean: twitterUserInstance, field: 'miniprofileImageURL', 'error')} required">
	<label for="miniprofileImageURL">
		<g:message code="twitterUser.miniprofileImageURL.label" default="Miniprofile Image URL" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="miniprofileImageURL" required="" value="${twitterUserInstance?.miniprofileImageURL}"/>

</div>
<div class="form-group ${hasErrors(bean: twitterUserInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="twitterUser.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="name" required="" value="${twitterUserInstance?.name}"/>

</div>
<div class="form-group ${hasErrors(bean: twitterUserInstance, field: 'screenName', 'error')} required">
	<label for="screenName">
		<g:message code="twitterUser.screenName.label" default="Screen Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="screenName" required="" value="${twitterUserInstance?.screenName}"/>

</div>
<div class="form-group ${hasErrors(bean: twitterUserInstance, field: 'userId', 'error')} required">
	<label for="userId">
		<g:message code="twitterUser.userId.label" default="User Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="userId" type="number" value="${twitterUserInstance.userId}" required=""/>

</div>

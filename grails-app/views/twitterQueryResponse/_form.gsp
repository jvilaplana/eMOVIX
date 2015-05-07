<%@ page import="com.jordiv.emovix.TwitterQueryResponse" %>



<div class="fieldcontain ${hasErrors(bean: twitterQueryResponseInstance, field: 'latitude', 'error')} ">
	<label for="latitude">
		<g:message code="twitterQueryResponse.latitude.label" default="Latitude" />
		
	</label>
	<g:field name="latitude" value="${fieldValue(bean: twitterQueryResponseInstance, field: 'latitude')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: twitterQueryResponseInstance, field: 'longitude', 'error')} ">
	<label for="longitude">
		<g:message code="twitterQueryResponse.longitude.label" default="Longitude" />
		
	</label>
	<g:field name="longitude" value="${fieldValue(bean: twitterQueryResponseInstance, field: 'longitude')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: twitterQueryResponseInstance, field: 'statusId', 'error')} required">
	<label for="statusId">
		<g:message code="twitterQueryResponse.statusId.label" default="Status Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="statusId" type="number" value="${twitterQueryResponseInstance.statusId}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: twitterQueryResponseInstance, field: 'createdAt', 'error')} required">
	<label for="createdAt">
		<g:message code="twitterQueryResponse.createdAt.label" default="Created At" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createdAt" precision="day"  value="${twitterQueryResponseInstance?.createdAt}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: twitterQueryResponseInstance, field: 'favoriteCount', 'error')} required">
	<label for="favoriteCount">
		<g:message code="twitterQueryResponse.favoriteCount.label" default="Favorite Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="favoriteCount" type="number" value="${twitterQueryResponseInstance.favoriteCount}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: twitterQueryResponseInstance, field: 'inReplyToScreenName', 'error')} required">
	<label for="inReplyToScreenName">
		<g:message code="twitterQueryResponse.inReplyToScreenName.label" default="In Reply To Screen Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="inReplyToScreenName" required="" value="${twitterQueryResponseInstance?.inReplyToScreenName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: twitterQueryResponseInstance, field: 'inReplyToStatusId', 'error')} required">
	<label for="inReplyToStatusId">
		<g:message code="twitterQueryResponse.inReplyToStatusId.label" default="In Reply To Status Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="inReplyToStatusId" type="number" value="${twitterQueryResponseInstance.inReplyToStatusId}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: twitterQueryResponseInstance, field: 'inReplyToUserId', 'error')} required">
	<label for="inReplyToUserId">
		<g:message code="twitterQueryResponse.inReplyToUserId.label" default="In Reply To User Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="inReplyToUserId" type="number" value="${twitterQueryResponseInstance.inReplyToUserId}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: twitterQueryResponseInstance, field: 'lang', 'error')} required">
	<label for="lang">
		<g:message code="twitterQueryResponse.lang.label" default="Lang" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lang" required="" value="${twitterQueryResponseInstance?.lang}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: twitterQueryResponseInstance, field: 'possiblySensitive', 'error')} ">
	<label for="possiblySensitive">
		<g:message code="twitterQueryResponse.possiblySensitive.label" default="Possibly Sensitive" />
		
	</label>
	<g:checkBox name="possiblySensitive" value="${twitterQueryResponseInstance?.possiblySensitive}" />

</div>

<div class="fieldcontain ${hasErrors(bean: twitterQueryResponseInstance, field: 'query', 'error')} required">
	<label for="query">
		<g:message code="twitterQueryResponse.query.label" default="Query" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="query" name="query.id" from="${com.jordiv.emovix.TwitterQuery.list()}" optionKey="id" required="" value="${twitterQueryResponseInstance?.query?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: twitterQueryResponseInstance, field: 'retweetCount', 'error')} required">
	<label for="retweetCount">
		<g:message code="twitterQueryResponse.retweetCount.label" default="Retweet Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="retweetCount" type="number" value="${twitterQueryResponseInstance.retweetCount}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: twitterQueryResponseInstance, field: 'retweetedStatus', 'error')} required">
	<label for="retweetedStatus">
		<g:message code="twitterQueryResponse.retweetedStatus.label" default="Retweeted Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="retweetedStatus" name="retweetedStatus.id" from="${com.jordiv.emovix.TwitterQueryResponse.list()}" optionKey="id" required="" value="${twitterQueryResponseInstance?.retweetedStatus?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: twitterQueryResponseInstance, field: 'screenName', 'error')} required">
	<label for="screenName">
		<g:message code="twitterQueryResponse.screenName.label" default="Screen Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="screenName" required="" value="${twitterQueryResponseInstance?.screenName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: twitterQueryResponseInstance, field: 'source', 'error')} required">
	<label for="source">
		<g:message code="twitterQueryResponse.source.label" default="Source" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="source" required="" value="${twitterQueryResponseInstance?.source}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: twitterQueryResponseInstance, field: 'text', 'error')} required">
	<label for="text">
		<g:message code="twitterQueryResponse.text.label" default="Text" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="text" required="" value="${twitterQueryResponseInstance?.text}"/>

</div>


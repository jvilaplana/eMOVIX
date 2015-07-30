<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<style>
blockquote.twitter-tweet {
  display: inline-block;
  font-family: "Helvetica Neue", Roboto, "Segoe UI", Calibri, sans-serif;
  font-size: 12px;
  font-weight: bold;
  line-height: 16px;
  border-color: #eee #ddd #bbb;
  border-radius: 5px;
  border-style: solid;
  border-width: 1px;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.15);
  margin: 10px 5px;
  padding: 16px 16px 16px 16px;
  border-bottom: 1px solid #e1e8ed;
  background-color: #F9FFFF;
  cursor: pointer;
  width: 100%;
}
 
blockquote.twitter-tweet p {
  font-size: 16px;
  font-weight: normal;
  line-height: 20px;
}
 
blockquote.twitter-tweet a {
  color: inherit;
  font-weight: normal;
  text-decoration: none;
  outline: 0 none;
}
 
blockquote.twitter-tweet a:hover,
blockquote.twitter-tweet a:focus {
  text-decoration: underline;
}

blockquote.twitter-tweet img {
  float: left;
  padding-right: 0px;
  margin-right: 10px;
  border-radius: 5px;
  width: 48px;
  height: 48px;
}

div.langDet {
  border: 1px dashed blue;
  margin-left: 50px;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Catalonia Tweets</h1>
		<p>Total geolocated tweets count: ${geoTweetsCount}</p>
		<p>Catalonia tweets count: ${cataloniaTweetsCount} 
			(<g:formatNumber number="${(cataloniaTweetsCount * 100) / geoTweetsCount }" format="##.##" />% of total)</p>
		<div class="well">
			<g:each in="${langs}" var="lang">
				<p>${lang.key}: ${lang.value} (<g:formatNumber number="${(lang.value.toInteger() * 100) / langsTotal}" format="##.##" />%)</p>
			</g:each>
		</div>
		<div class="well">
			<g:each in="${cataloniaTweets}" var="tweet">
				<blockquote class="twitter-tweet">
				<img src="${tweet.getTwitterUser().getBiggerProfileImageURL()}" />
				<p>${tweet.getText()}</p>
				- ${tweet.getTwitterUser().getName()} (@${tweet.getTwitterUser().getScreenName()}) 
				<a target="_blank" href="https://twitter.com/${tweet.getTwitterUser().getScreenName()}/status/${tweet.statusId}">
					<g:formatDate date="${tweet.getCreatedAt()}" format="MMM d, yyyy" />
				</a>
				<p><a target="_blank" href="https://www.google.com/maps/?q=${tweet.geoLocation.latitude},${tweet.geoLocation.longitude}">to maps --></a></p>
				</blockquote>
				<g:each in="${tweet.languageDetections}" var="langDet">
					<div class="langDet">
						<p>Language: ${langDet.language}</p>
						<p>Source: ${langDet.source}</p>
						<p>Is reasonably certain: ${langDet.isReasonablyCertain}</p>
						<p>Confidence: ${langDet.confidence}</p>
					</div>
				</g:each>
			</g:each>
			<br />
		</div>
	</div>
</body>
</html>

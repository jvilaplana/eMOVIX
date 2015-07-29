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
</style>
</head>
<body>
	<div class="container">
		<h1>Automatically Detected Catalan Tweets</h1>
		<p>Total tweets count: ${twitterStatusCount}</p>
		<h2>Detected by Language Detection API + Apache Tika</h2>
		<p>Catalan tweets count: ${catalanTweets2Count} 
			(<g:formatNumber number="${(catalanTweets2Count * 100) / twitterStatusCount }" format="##.##" />%)</p>
		<div class="well">
			<g:each in="${catalanTweets2}" var="tweet">
				<blockquote class="twitter-tweet">
				<img src="${tweet.status.getTwitterUser().getBiggerProfileImageURL()}" />
				<p>${tweet.status.getText()}</p>
				- ${tweet.status.getTwitterUser().getName()} (@${tweet.status.getTwitterUser().getScreenName()}) 
				<a target="_blank" href="https://twitter.com/${tweet.status.getTwitterUser().getScreenName()}/status/${tweet.status.statusId}">
					<g:formatDate date="${tweet.status.getCreatedAt()}" format="MMM d, yyyy" />
				</a>
				</blockquote>
			</g:each>
		</div>
		<h2>Detected by Apache Tika</h2>
		<p>Catalan tweets count: ${catalanTweetsCount} 
			(<g:formatNumber number="${(catalanTweetsCount * 100) / twitterStatusCount }" format="##.##" />%)</p>
		<div class="well">
			<g:each in="${catalanTweets}" var="tweet">
				<blockquote class="twitter-tweet">
				<img src="${tweet.status.getTwitterUser().getBiggerProfileImageURL()}" />
				<p>${tweet.status.getText()}</p>
				- ${tweet.status.getTwitterUser().getName()} (@${tweet.status.getTwitterUser().getScreenName()}) 
				<a target="_blank" href="https://twitter.com/${tweet.status.getTwitterUser().getScreenName()}/status/${tweet.status.statusId}">
					<g:formatDate date="${tweet.status.getCreatedAt()}" format="MMM d, yyyy" />
				</a>
				</blockquote>
			</g:each>
		</div>
	</div>
</body>
</html>

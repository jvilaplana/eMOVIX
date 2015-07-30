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
		<h1>Geocodings</h1>
		<g:each in="${geocodings}" var="geocoding">
			<div class="well" style="min-height: 350px">
				
				<p>Location: ${geocoding.location}</p>
				<p>Latitude: ${geocoding.latitude}</p>
				<p>Longitude: ${geocoding.longitude}</p>
				<%--<a target="_blank" href="https://www.google.com/maps/?q=${geocoding.latitude},${geocoding.longitude}">to maps --></a>
				<iframe src="https://www.google.com/maps/?q=${geocoding.latitude},${geocoding.longitude}"></iframe> --%>
				<p>Twitter Users:</p>
				<ul>
					<g:each in="${geocoding.users}" var="user">
						<li>${user.name} (@${user.screenName})</li>
					</g:each>
				</ul>
			</div>
			<div style="clear: both;"></div>
		</g:each>
	</div>
</body>
</html>

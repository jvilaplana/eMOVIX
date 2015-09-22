package com.jordiv.emovix.twitter

import grails.plugins.rest.client.RestBuilder
import grails.transaction.Transactional

import org.apache.tika.language.LanguageIdentifier

import twitter4j.FilterQuery
import twitter4j.Paging
import twitter4j.RateLimitStatus
import twitter4j.Status
import twitter4j.StatusListener
import twitter4j.Twitter
import twitter4j.TwitterException
import twitter4j.TwitterFactory
import twitter4j.TwitterStream
import twitter4j.TwitterStreamFactory
import twitter4j.User

import com.detectlanguage.DetectLanguage
import com.detectlanguage.Result

@Transactional
class TwitterService {

    def serviceMethod() {

    }
	
	def apiStatus(String ep) {
		def rateLimits = []
		try {
			Twitter twitter = TwitterFactory.getSingleton()
			Map<String, RateLimitStatus> rateLimitStatus = twitter.getRateLimitStatus()
			for (String endpoint : rateLimitStatus.keySet()) {
				RateLimitStatus status = rateLimitStatus.get(endpoint)
				def rateLimit = [:]
				rateLimit.endpoint = endpoint.toString()
				rateLimit.limit = status.getLimit()
				rateLimit.remaining = status.getRemaining()
				rateLimit.resetTimeInSeconds = status.getResetTimeInSeconds()
				rateLimit.secondsUntilReset = status.getSecondsUntilReset()
				if(ep == rateLimit.endpoint) return rateLimit
				rateLimits.add rateLimit
			}
		} catch(TwitterException te) {
			te.printStackTrace();
			println("Failed to get rate limit status: " + te.getMessage());
			flash.message = message(code: 'twitter.exception.label')
		}
		
		return rateLimits
	}
	
	def getUser(String screenName) {
		TwitterUser twitterUser = TwitterUser.findByScreenName(screenName)
		
		if(twitterUser != null) return twitterUser
		
		Twitter twitter = TwitterFactory.getSingleton()
		User user = null
		try {
		user = twitter.showUser(screenName)
		} catch(Exception e) {}
		
		if(user != null) {
			twitterUser = new TwitterUser()
			twitterUser.biggerProfileImageURL = user.getBiggerProfileImageURL()
			twitterUser.biggerProfileImageURLHttps = user.getBiggerProfileImageURLHttps()
			twitterUser.createdAt = user.getCreatedAt()
			twitterUser.description = user.getDescription()
			twitterUser.favouritesCount = user.getFavouritesCount()
			twitterUser.followersCount = user.getFollowersCount()
			twitterUser.friendsCount = user.getFriendsCount()
			twitterUser.userId = user.getId()
			twitterUser.lang = user.getLang()
			twitterUser.location = user.getLocation()
			twitterUser.miniprofileImageURL = user.getMiniProfileImageURL()
			twitterUser.miniProfileImageURLHttps = user.getMiniProfileImageURLHttps()
			twitterUser.name = user.getName()
			twitterUser.screenName = user.getScreenName()
			twitterUser.statusesCount = user.getStatusesCount()
			twitterUser.timeZone = user.getTimeZone()
			twitterUser.url = user.getURL()
			twitterUser.isDefaultProfile = user.isDefaultProfile()
			twitterUser.isDefaultProfileImage = user.isDefaultProfileImage()
			twitterUser.isGeoEnabled = user.isGeoEnabled()
			twitterUser.isProtected = user.isProtected()
			twitterUser.isVerified = user.isVerified()
			
			//twitterUser.save flush: true, failOnError: true
			twitterUser.mongo.save()
			
			//def geocoding = TwitterGeocoding.findByLocation(twitterUser.location)
			def geocoding = TwitterGeocoding.mongo.findByLocation(twitterUser.location)
			if(geocoding == null) {
				
				//def latLong = getGeocoding(twitterUser.location)
				
				//if(latLong != -1) {
					geocoding = new TwitterGeocoding()
					geocoding.location = twitterUser.location
					geocoding.longitude = null
					geocoding.latitude = null
					//geocoding.longitude = latLong.longitude
					//geocoding.latitude = latLong.latitude
					geocoding.addToUsers(twitterUser)
					
					//geocoding.save flush: true, failOnError: true
					geocoding.mongo.save()
				//}
				
			}
			
			twitterUser.geocoding = geocoding
			//twitterUser.save flush: true, failOnError: true
			twitterUser.mongo.save()
		}
		
		return twitterUser
	}
	
	def getUserSnapshot(TwitterUser twitterUser) {
		log.debug "Initiating snapshot of user " + twitterUser.screenName
		println "Initiating snapshot of user " + twitterUser.screenName
		if(twitterUser == null) return twitterUser
		
		Twitter twitter = TwitterFactory.getSingleton()
		User user = null
		try {
			user = twitter.showUser(twitterUser.screenName)
		} catch(TwitterException e) {
			log.error "Twitter user " + twitterUser.screenName + " could not be found on Twitter!"
		}
		
		TwitterUserSnapshot userSnapshot = null
		
		if(user != null) {
			userSnapshot = new TwitterUserSnapshot()
			userSnapshot.biggerProfileImageURL = user.getBiggerProfileImageURL()
			userSnapshot.biggerProfileImageURLHttps = user.getBiggerProfileImageURLHttps()
			userSnapshot.description = user.getDescription()
			userSnapshot.favouritesCount = user.getFavouritesCount()
			userSnapshot.followersCount = user.getFollowersCount()
			userSnapshot.friendsCount = user.getFriendsCount()
			userSnapshot.lang = user.getLang()
			userSnapshot.location = user.getLocation()
			userSnapshot.miniprofileImageURL = user.getMiniProfileImageURL()
			userSnapshot.miniProfileImageURLHttps = user.getMiniProfileImageURLHttps()
			userSnapshot.name = user.getName()
			userSnapshot.screenName = user.getScreenName()
			userSnapshot.statusesCount = user.getStatusesCount()
			userSnapshot.timeZone = user.getTimeZone()
			userSnapshot.url = user.getURL()
			userSnapshot.isDefaultProfile = user.isDefaultProfile()
			userSnapshot.isDefaultProfileImage = user.isDefaultProfileImage()
			userSnapshot.isGeoEnabled = user.isGeoEnabled()
			userSnapshot.isProtected = user.isProtected()
			userSnapshot.isVerified = user.isVerified()
			userSnapshot.user = twitterUser
			//userSnapshot.save flush: true, failOnError: true
			userSnapshot.mongo.save()
			
			twitterUser.snapshots.add userSnapshot
			//twitterUser.save flush: true, failOnError: true
			twitterUser.mongo.save()
		}
		
		return userSnapshot
	}
	
	def getUserTweets(TwitterUser user) {
		Twitter twitter = TwitterFactory.getSingleton()
		
		Paging paging = new Paging(1, 200);
		//List<Status> statuses = twitter.getUserTimeline(user.userId, paging);
		//List<Status> statuses = twitter.getHomeTimeline();
		List<Status> statuses = twitter.getUserTimeline("vjordi", paging);
		/*
		System.out.println("Showing home timeline.");
		for (Status status : statuses) {
			System.out.println(status.getUser().getName() + ":" +
							   status.getText());
		}
		*/
	}
	
	def isCachedUser(Long userId) {
		return TwitterUser.findByUserId(userId)
	}
	
	def isTwitterUsername(String username) {
		try {
			Twitter twitter = TwitterFactory.getSingleton()
			twitter.showUser(username)
			return true
		} catch(TwitterException e) {
			return false
		}
	}
	
	/**
	 * Saves a tweet from the Twitter4j API to the database
	 */
	def saveTwitterStatus(Status status) {
		//println "Saving a tweet from " + status.getUser().getScreenName()
		// Check if this tweet already exists in the database
		TwitterStatus twitterStatus = TwitterStatus.mongo.findByStatusId(status.getId())
		if(twitterStatus != null) return
		
		if(status.getText().size() > 255) {
			log.warn "Status ignored due to abnormal text size (" + status.getText().size() + "): " + status.getText()
			return
		}
		
		twitterStatus = new TwitterStatus()
		
		twitterStatus.contributors = status.getContributors()
		twitterStatus.createdAt = status.getCreatedAt()
		twitterStatus.favoriteCount = status.getFavoriteCount()
		
		if(status.getGeoLocation() != null) {
			twitterStatus.geoLocation = new TwitterGeoLocation(
				latitude: status.getGeoLocation().getLatitude(),
				longitude: status.getGeoLocation().getLongitude()).mongo.save(flush: true)
		}
		
		twitterStatus.statusId = status.getId()
		twitterStatus.inReplyToScreenName = status.getInReplyToScreenName()
		twitterStatus.inReplyToStatusId = status.getInReplyToStatusId()
		twitterStatus.inReplyToUserId = status.getInReplyToUserId()
		twitterStatus.lang = status.getLang()
		//TODO save twitterStatus.place
		//TODO save twitterStatus.quotedStatus
		twitterStatus.quotedStatusId = status.getQuotedStatusId()
		twitterStatus.retweetCount = status.getRetweetCount()
		//TODO save twitterStatus.retweetedStatus
		
		if(status.getScopes() != null) {
			twitterStatus.scopes = new TwitterScopes(placeIds: status.getScopes().getPlaceIds()).mongo.save(flush: true)
		}
		
		twitterStatus.source = status.getSource()
		twitterStatus.text = status.getText()
		
		if(this.isCachedUser(status.getUser().getId())) {
			//println "User " + status.getUser().getScreenName() + " is cached, saving to status..."
			twitterStatus.twitterUser = TwitterUser.mongo.findByUserId(status.getUser().getId())
		}
		else {
			twitterStatus.twitterUser = this.getUser(status.getUser().getScreenName())
		}
		
		twitterStatus.withheldInCountries = status.getWithheldInCountries()
		twitterStatus.isFavorited = status.isFavorited()
		twitterStatus.isPossiblySensitive = status.isPossiblySensitive()
		twitterStatus.isRetweet = status.isRetweet()
		twitterStatus.isRetweeted = status.isRetweeted()
		twitterStatus.isTruncated = status.isTruncated()
		
		//twitterStatus.save flush: true, failOnError: true
		twitterStatus.mongo.save()
		
		return twitterStatus
	}
	
	
	def getStream() {
		print "Initializing Twitter Streaming API ... "
		/*
		StatusListener listener = new StatusAdapter() {
			public void onStatus(Status status) {
				//println status.getUser().getName() + " : " + status.getText()
				//println status.getUser().getName() + ":"
				twitterService.saveTwitterStatus(status)
			}
			public void onDeletionNotice(StatusDeletionNotice statusDeletionNotice) {}
			public void onStallWarning(StallWarning stallWarning) {
				println "STALL WARNING:"
				println stallWarning
			}
			public void onTrackLimitationNotice(int numberOfLimitedStatuses) {}
			public void onException(Exception ex) {
				ex.printStackTrace()
			}
		}
		*/
		
		StatusListener listener = new CustomStatusListener()
		
		//TwitterStream twitterStream = new TwitterStreamFactory().getInstance()
		TwitterStream twitterStream = TwitterStreamFactory.getSingleton()
		
		twitterStream.clearListeners()
		twitterStream.addListener(listener)
		// sample() method internally creates a thread which manipulates TwitterStream and calls these adequate listener methods continuously.
		//twitterStream.sample();
		FilterQuery filterQuery = new FilterQuery()
		
		double[][] worldBox
		double[][] catBox
		double[][] ukBox
		double[][] europe
		double[][] iberia
		
		worldBox = new double[2][2]
		catBox = new double[2][2]
		ukBox = new double[2][2]
		europe = new double[2][2]
		iberia = new double[2][2]
		
		
		//TODO DESAR AL TWEET DE QUINA CAIXA HA VINGUT
		worldBox[0][0] = -180
		worldBox[0][1] = -90
		worldBox[1][0] = 180
		worldBox[1][1] = 90
		
		catBox[0][0] = 0
		catBox[0][1] = 40.42
		catBox[1][0] = 3.51
		catBox[1][1] = 43
		
		ukBox[0][0] = 2.5
		ukBox[0][1] = -12.1
		ukBox[1][0] = 49.3
		ukBox[1][1] = 63.3
		
		europe[0][0] = -45.14
		europe[0][1] = 23.57
		europe[1][0] = 42.9346
		europe[1][1] = 72.7145
		
		iberia[0][0] = -12
		iberia[0][1] = 34
		iberia[1][0] = 7
		iberia[1][1] = 45
		
		
		filterQuery.locations(worldBox)
		twitterStream.filter(filterQuery)
		
		println "[OK]"
	}
	
	/**
	 * Try to detect the language of a Twitter message.
	 * 
	 * @param status A twitter message object
	 * @return
	 */
	def detectLanguage(TwitterStatus status) {
		
		if(status == null) return
		
		// Language detection using Apache Tika
		// http://svn.apache.org/viewvc/tika/trunk/tika-core/src/main/resources/org/apache/tika/language/tika.language.properties?view=markup
		LanguageIdentifier li = new LanguageIdentifier(status.getText());
		//println li.getSupportedLanguages()
		
		TwitterStatusLanguageDetection languageDetection = new TwitterStatusLanguageDetection()
		
		languageDetection.status = status
		languageDetection.source = "tika"
		languageDetection.language = li.getLanguage()
		languageDetection.isReasonablyCertain = li.isReasonablyCertain()
		
		languageDetection.mongo.save()
		//languageDetection.save flush: true, failOnError: true
		
		if(languageDetection.language == "ca") {
			// Language detection using Detect Language API
			//TODO Move the apiKey to a config file
			DetectLanguage.apiKey = "466c93794a58215689e299c33e8d7794"
			List<Result> results = DetectLanguage.detect(status.getText());
			
			for(Result result : results) {
				languageDetection = new TwitterStatusLanguageDetection()
				languageDetection.status = status
				languageDetection.source = "detectlanguage"
				languageDetection.language = result.language
				languageDetection.isReasonablyCertain = result.isReliable
				languageDetection.confidence = result.confidence
				//languageDetection.save flush: true, failOnError: true
				languageDetection.mongo.save()
			}
		}
	}
	
	def getGeocoding(String location) {
		if(location == null || location.equals("")) return [latitude: -180, longitude: -90]
		
		def rest = new RestBuilder()
		//def resp = rest.get("http://open.mapquestapi.com/geocoding/v1/address?key=Fmjtd%7Cluub2g0tng%2Cb2%3Do5-9ubxhz&callback=renderGeocode&location=" + location + "&outFormat=csv&thumbMaps=false&maxResults=1")
		def resp = rest.get("http://open.mapquestapi.com/geocoding/v1/address?key=rV9y5rZVwaWwYwFWA4pOj2IkuvXsoC0u&callback=renderGeocode&location=" + location + "&outFormat=csv&thumbMaps=false&maxResults=1")
		
		/*def resp = rest.get("http://open.mapquestapi.com/geocoding/v1/address=key=Fmjtd|luub2g0tng,b2=o5-9ubxhz") {
			json {
				key ="Fmjtd|luub2g0tng,b2=o5-9ubxhz"
				inFormat ="json"
				outFormat ="json"
				location ="Lleida"
			}
		}*/
		
		//def list = new XmlParser().parseText(resp.text)
		
		//println list.attributes()
		
		def test = resp.text
		test = resp.text.replaceAll("\"", "")
		test = resp.text.split(",")
		
		if(test.size() < 23) return -1
		
		def latitude = Double.parseDouble(test[21].replaceAll("\"", ""))
		def longitude = Double.parseDouble(test[22].replaceAll("\"", ""))
		
		return [latitude: latitude, longitude: longitude]
	}
}

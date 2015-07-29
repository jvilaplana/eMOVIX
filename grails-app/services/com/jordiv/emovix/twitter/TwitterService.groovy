package com.jordiv.emovix.twitter

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
		User user = twitter.showUser(screenName)
		
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
			
			twitterUser.save flush: true, failOnError: true
		}
		
		return twitterUser
	}
	
	def getUser(User user) {
		TwitterUser twitterUser = TwitterUser.findByScreenName(user.getScreenName())
		
		if(twitterUser != null) return twitterUser
		
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
			
			twitterUser.save flush: true, failOnError: true
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
			userSnapshot.save flush: true, failOnError: true
			
			twitterUser.snapshots.add userSnapshot
			twitterUser.save flush: true, failOnError: true
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
		TwitterStatus twitterStatus = TwitterStatus.findByStatusId(status.getId())
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
				longitude: status.getGeoLocation().getLongitude()).save(flush: true)
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
			twitterStatus.scopes = new TwitterScopes(placeIds: status.getScopes().getPlaceIds()).save(flush: true)
		}
		
		twitterStatus.source = status.getSource()
		twitterStatus.text = status.getText()
		
		if(this.isCachedUser(status.getUser().getId())) {
			//println "User " + status.getUser().getScreenName() + " is cached, saving to status..."
			twitterStatus.twitterUser = TwitterUser.findByUserId(status.getUser().getId())
		}
		else {
			twitterStatus.twitterUser = this.getUser(status.getUser())
		}
		
		twitterStatus.withheldInCountries = status.getWithheldInCountries()
		twitterStatus.isFavorited = status.isFavorited()
		twitterStatus.isPossiblySensitive = status.isPossiblySensitive()
		twitterStatus.isRetweet = status.isRetweet()
		twitterStatus.isRetweeted = status.isRetweeted()
		twitterStatus.isTruncated = status.isTruncated()
		
		twitterStatus.save flush: true, failOnError: true
		
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
		worldBox = new double[2][2]
		
		worldBox[0][0] = -180
		worldBox[0][1] = -90
		worldBox[1][0] = 180
		worldBox[1][1] = 90
		
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
		languageDetection.save flush: true, failOnError: true
		
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
				languageDetection.save flush: true, failOnError: true
			}
		}
	}
}

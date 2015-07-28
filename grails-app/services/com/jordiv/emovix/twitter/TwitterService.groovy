package com.jordiv.emovix.twitter

import grails.transaction.Transactional
import twitter4j.FilterQuery
import twitter4j.Paging
import twitter4j.RateLimitStatus
import twitter4j.StallWarning
import twitter4j.Status
import twitter4j.StatusAdapter
import twitter4j.StatusDeletionNotice
import twitter4j.StatusListener
import twitter4j.Twitter
import twitter4j.TwitterException
import twitter4j.TwitterFactory
import twitter4j.TwitterStream
import twitter4j.TwitterStreamFactory
import twitter4j.User

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
	
	def isCachedUser(String screenName) {
		return TwitterUser.findByScreenName(screenName)
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
		println "Going to save a twitterStatus!"
		// Check if this tweet already exists in the database
		TwitterStatus twitterStatus = TwitterStatus.findByStatusId(status.getId())
		if(twitterStatus != null) return
		
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
			twitterStatus.scopes = new TwitterScopes(placeIds: status.getScopes().getPlaceIds())
		}
		
		twitterStatus.source = status.getSource()
		twitterStatus.text = status.getText()
		
		if(this.isCachedUser(status.getUser().getScreenName())) {
			twitterStatus.twitterUser = TwitterUser.findByScreenName(status.getUser().getScreenName())
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
		
		twitterStatus.save flush: true, failOnError: true
	}
}

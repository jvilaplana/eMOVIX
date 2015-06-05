package com.jordiv.emovix.twitter

import grails.transaction.Transactional
import twitter4j.RateLimitStatus
import twitter4j.Twitter
import twitter4j.TwitterFactory
import twitter4j.TwitterException
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
			twitterUser.getStatusesCount = user.getStatusesCount()
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
		User user = twitter.showUser(twitterUser.screenName)
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
			userSnapshot.getStatusesCount = user.getStatusesCount()
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
}

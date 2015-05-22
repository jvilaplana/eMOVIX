package com.jordiv.emovix.twitter

import grails.transaction.Transactional
import twitter4j.RateLimitStatus
import twitter4j.Twitter
import twitter4j.TwitterFactory
import twitter4j.TwitterException

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
}

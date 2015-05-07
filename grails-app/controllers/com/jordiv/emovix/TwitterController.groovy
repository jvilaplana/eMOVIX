package com.jordiv.emovix

import twitter4j.RateLimitStatus
import twitter4j.Twitter
import twitter4j.TwitterException
import twitter4j.TwitterFactory

class TwitterController {

    def index() {
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
				rateLimits.add rateLimit
			}
		} catch(TwitterException te) {
			te.printStackTrace();
			println("Failed to get rate limit status: " + te.getMessage());
			flash.message = message(code: 'twitter.exception.label')
		}
		
		render(view: "index", model: [rateLimits: rateLimits])
	}
}

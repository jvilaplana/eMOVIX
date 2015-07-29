package com.jordiv.emovix.twitter

import grails.converters.JSON
import twitter4j.Query
import twitter4j.QueryResult
import twitter4j.RateLimitStatus
import twitter4j.Status
import twitter4j.Twitter
import twitter4j.TwitterException
import twitter4j.TwitterFactory

class TwitterController {
	def twitterService
	
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
	
	def search() {
	
		render(view: "search", model: [])
	}
	
	def searchResults() {
		def searchQuery = params?.query
		def maxId = params.long('maxId')
		def results = []
		def nextQuery
		
		if(twitterService.apiStatus("/search/tweets")?.remaining > 0) {
			try {
				Twitter twitter = TwitterFactory.getSingleton()
				Query query = new Query(searchQuery)
				query.setCount(100)
				if(maxId) query.setMaxId(maxId)
				QueryResult result = null
	
				result = twitter.search(query)
				for (Status status : result.getTweets()) {
					results.add status
				}
				
				nextQuery = result.nextQuery()
	
			} catch(Exception e) {
				println "[ERROR - TwitterController] Something went wrong!"
				println e.printStackTrace()
			} finally {
				
			}
		}
		
		render(view: "searchResults", model: [results: results, nextQuery: nextQuery, monitorGroups: TwitterMonitorGroup.list()])
	}
	
	def visualizeStream() {
		def twitterStatusCount = TwitterStatus.count()
		render(view: "visualizeStream", model: [twitterStatusCount: twitterStatusCount])
	}
	
	def ajaxUpdateData() {
		def data = [:]
		
		def twitterStatusCount = TwitterStatus.count()
		def twitterUserCount = TwitterUser.count()
		
		data.statusCount = twitterStatusCount
		data.userCount = twitterUserCount
		render data as JSON
		return
	}
}

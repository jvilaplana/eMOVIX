package com.jordiv.emovix.twitter

import grails.converters.JSON
import grails.plugins.rest.client.RestBuilder
import twitter4j.Location
import twitter4j.Query
import twitter4j.QueryResult
import twitter4j.RateLimitStatus
import twitter4j.ResponseList
import twitter4j.Status
import twitter4j.Trends
import twitter4j.Twitter
import twitter4j.TwitterException
import twitter4j.TwitterFactory

import com.detectlanguage.DetectLanguage
import com.detectlanguage.Result

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
	
	def dashboard() {
		
		def twitterStatusCount = TwitterStatus.mongo.count()
		
		//def twitterStatusWithLanguageCount = TwitterStatus.mongo.where { languageDetections.size() != 0 }.count()
		def query = TwitterStatus.mongo.withCriteria{
			"languageDetections.size()" == 0
			}
		
		def twitterStatusWithLanguageCount = TwitterStatus.mongo.findAllByIsAutoLanguageDetected(true).size()
		
		
		render(view: "dashboard", model: [
			twitterStatusCount: twitterStatusCount,
			twitterStatusWithLanguageCount: twitterStatusWithLanguageCount])
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
		
		def catalanTweets = TwitterStatusLanguageDetection.findAllByLanguage("ca")
		render(view: "visualizeStream", model: [
			twitterStatusCount: twitterStatusCount, 
			catalanTweets: catalanTweets, 
			catalanTweetsCount: catalanTweets.size()])
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
	
	def catalanTweets() {
		def twitterStatusCount = TwitterStatusLanguageDetection.count()
		def catalanTweets = TwitterStatusLanguageDetection.findAllByLanguage("ca")
		
		def catalanTweets2 = TwitterStatusLanguageDetection.findAllByLanguageAndSource("ca", "detectlanguage")
		
		render(view: "catalanTweets", model: [
			twitterStatusCount: twitterStatusCount,
			catalanTweets: catalanTweets,
			catalanTweets2: catalanTweets2,
			catalanTweets2Count: catalanTweets2.size(),
			catalanTweetsCount: catalanTweets.size()])
	}
	
	def cataloniaTweets() {
		def geoTweets = TwitterStatus.findAllByGeoLocationIsNotNull()
		def cataloniaTweets = []
		
		
		for(TwitterStatus status : geoTweets) {
			def lat = status.geoLocation.latitude
			def lon = status.geoLocation.longitude
			if(lat >= 40 && lat <= 43 && lon >= 0 && lon <= 3.6) {
				cataloniaTweets.add status
			}
		}
		
		for(TwitterStatus status : cataloniaTweets) {
			def detectlanguage = false
			for(TwitterStatusLanguageDetection langDetection : status.languageDetections) {
				if(langDetection.source.equals("detectlanguage")) {
					 detectlanguage = true
					 break
				}
			}
			if(!detectlanguage) {
				DetectLanguage.apiKey = "466c93794a58215689e299c33e8d7794"
				List<Result> results = DetectLanguage.detect(status.getText());
				
				for(Result result : results) {
					TwitterStatusLanguageDetection languageDetection = new TwitterStatusLanguageDetection()
					languageDetection.status = status
					languageDetection.source = "detectlanguage"
					languageDetection.language = result.language
					languageDetection.isReasonablyCertain = result.isReliable
					languageDetection.confidence = result.confidence
					languageDetection.save flush: true, failOnError: true
				}
			}
		}
		
		def langs = [:]
		def langsTotal = 0
		for(TwitterStatus status : cataloniaTweets) {
			for(TwitterStatusLanguageDetection langDetection : status.languageDetections) {
				if(langDetection.source.equals("detectlanguage")) {
					if(!langs.containsKey(langDetection.language)) {
						langs[langDetection.language] = 0
					}
					langs[langDetection.language]++
					langsTotal++
					break
				}
			}
		}
		
		render(view: "cataloniaTweets", model: [
			cataloniaTweets: cataloniaTweets,
			cataloniaTweetsCount: cataloniaTweets.size(),
			geoTweetsCount: geoTweets.size(),
			langs: langs,
			langsTotal: langsTotal
			])
	}
	
	def getTrends() {
		Twitter twitter = new TwitterFactory().getInstance();
		ResponseList<Location> locations;
		locations = twitter.getAvailableTrends();
		System.out.println("Showing available trends");
		for (Location location : locations) {
			System.out.println(location.getName() + " (woeid:" + location.getWoeid() + ")");
			
			Trends trends = twitter.getPlaceTrends(location.getWoeid());
			for (int i = 0; i < trends.getTrends().length; i++) {
				System.out.println("\t" + trends.getTrends()[i].getName());
			}
		}
		
		
		
		render ""
	}
	
	def geocodings() {
		def geocodings = TwitterGeocoding.list()
		
		render(view: "geocodings", model: [geocodings: geocodings])
	}
}

package com.jordiv.emovix.core

import com.jordiv.emovix.twitter.TwitterStatus
import com.jordiv.emovix.twitter.TwitterStatusLanguageDetection

import com.detectlanguage.DetectLanguage
import com.detectlanguage.Result

class DetectLanguageJob {
    static triggers = {
      simple repeatInterval: 20000l // execute job once in 5 seconds
    }

    def execute() {
        // execute job
		
		
		TwitterStatus status = TwitterStatus.mongo.findByIsAutoLanguageDetected(false)
		
		
		def c = TwitterStatus.mongo.createCriteria()
		def r = c.list {
			isNull("languageDetections")
			maxResults(1)
		}
		//println r
		/*
		TwitterStatus status = null
		for(TwitterStatus twitterStatus : TwitterStatus.mongo.list()) {
			def detected = false
			for(TwitterStatusLanguageDetection detection : twitterStatus.languageDetections) {
				if(detection.status == twitterStatus && detection.source == "detectlanguage") {
					detected = true
					break
				}
			}
			if(!detected) {
				status = twitterStatus
				break
			}
		}
		*/
		if(status == null) return
		
		/*
		def twitterStatusList = TwitterStatus.mongo.where { languageDetections == null || languageDetections.size() == 0 }
		//def twitterStatusList = TwitterStatus.mongo.where { languageDetections.size() == 0 }
		//println twitterStatusList
		if(twitterStatusList == null || twitterStatusList.size() == 0) return
		
		TwitterStatus status = twitterStatusList[0]
		*/
		//println "------>"
		println "Twitter status " + status?.id + " not language detected, going for it ..."
		
		//TwitterStatus status = r[0]
		//println status.languageDetections
		/*
		def query = TwitterStatus.where {
			languageDetections == null || languageDetectiosn.size() == 0
		}
		*/
		
		TwitterStatusLanguageDetection languageDetection = new TwitterStatusLanguageDetection()
		
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
			//languageDetection.mongo.save()
			
			if(status.languageDetections == null) {
				println "The status " + status + " has a null languageDetections list"
				status.languageDetections = new ArrayList<TwitterStatusLanguageDetection>()
			}
			//status.addToLanguageDetections(languageDetection)
			
			//println "status.languageDetections --> " + status.properties
			//status.languageDetections.add languageDetection
			//println "Now the status has " + status.languageDetections.size() + " languageDetections"
			
			//languageDetection.mongo.save()
			
			status.addToLanguageDetections(languageDetection)
			status.isAutoLanguageDetected = true
			status.mongo.save()
			
			println "----"
			println status.getText()
			println languageDetection.status
			println languageDetection.language
			println languageDetection.isReasonablyCertain
			println "----"
		}
	}
}
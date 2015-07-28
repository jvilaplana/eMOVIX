package com.jordiv.emovix.twitter

class TwitterMonitorJob {
	TwitterService twitterService
	
    static triggers = {
      simple repeatInterval: 10000l // execute job once in 10 seconds
    }

	// Limit: 180 requests cada 898 segons --> 1 request cada 5 segons
	// Affected endpoint: /users/show/:id
    def execute() {
        // execute job
		def twitterMonitorUserList = TwitterMonitorUser.list(sort: "lastUpdated", max: 1)
		
		for(TwitterMonitorUser monitorUser : twitterMonitorUserList) {
			
			def yesterday = (new Date()) - 1
			
			// If the last update was performed 1 day ago or more ...
			if(yesterday > monitorUser.lastUpdated) {
				TwitterUser user = monitorUser.user
				createUserSnapshot(user)
				getUserTweets(user)
				monitorUser.lastUpdated = new Date()
				monitorUser.save flush: true
			}
		}
    }
	
	def createUserSnapshot(TwitterUser user) {
		println "Going for a snapshot of user " + user
		twitterService.getUserSnapshot(user)
	}
	
	def getUserTweets(TwitterUser user) {
		twitterService.getUserTweets(user)
	}
}

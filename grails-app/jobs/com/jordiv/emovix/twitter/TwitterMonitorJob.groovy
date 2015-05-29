package com.jordiv.emovix.twitter



class TwitterMonitorJob {
	def twitterService
	
    static triggers = {
      simple repeatInterval: 5000l // execute job once in 5 seconds
    }

	// Limit: 180 requests cada 898 segons --> 1 request cada 5 segons
    def execute() {
        // execute job
		def twitterMonitorUserList = TwitterMonitorUser.list()
		
		for(TwitterMonitorUser monitorUser : twitterMonitorUserList) {
			TwitterUser user = monitorUser.user
			
			
		}
    }
}

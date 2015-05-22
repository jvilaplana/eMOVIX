package com.jordiv.emovix.twitter

class TwitterMonitorUser {
	Date dateCreated
	Date lastUpdated
	
	TwitterUser user
	static belongsTo = [group: TwitterMonitorGroup]
	
    static constraints = {
    }
}

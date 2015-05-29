package com.jordiv.emovix.twitter

class TwitterMonitorUser {
	Date dateCreated
	Date lastUpdated
	
	TwitterUser user
	TwitterMonitorGroup group
	/** Whether accounts following this user should also be monitored or not */
	Boolean followFollowers = false
	
	static belongsTo = [group: TwitterMonitorGroup]
	
    static constraints = {
		user nullable: false
		group nullable: false
    }
	
	String toString() {
		user?.screenName
	}
}

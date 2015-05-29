package com.jordiv.emovix.twitter

class TwitterMonitorGroup {
	Date dateCreated
	Date lastUpdated
	String name
	String description
	
	static hasMany = [users: TwitterMonitorUser]
	
    static constraints = {
    }
	
	String toString() {
		return name
	}
}

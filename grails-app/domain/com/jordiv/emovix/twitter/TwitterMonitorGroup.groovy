package com.jordiv.emovix.twitter

class TwitterMonitorGroup {
	Date dateCreated
	Date lastUpdated
	String name
	String description
	
	static hasMany = [users: TwitterMonitorUser]
	
    static constraints = {
		name nullable: false, blank: false
		description nullable: true, blank: true
    }
	
	String toString() {
		return name
	}
}

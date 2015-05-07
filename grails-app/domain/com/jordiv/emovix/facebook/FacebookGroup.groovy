package com.jordiv.emovix.facebook

class FacebookGroup {
	Date dateCreated
	Date lastUpdated
	
	String groupId
	String name
	String description
	String privacy
	
	static belongsTo = FacebookUser
	static hasMany = [members: FacebookUser]
	
    static constraints = {
    }
}

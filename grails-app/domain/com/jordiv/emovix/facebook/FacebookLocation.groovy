package com.jordiv.emovix.facebook

class FacebookLocation {
	Date dateCreated
	Date lastUpdated
	
	String city
	String country
	String region
	String state
	String street
	
	static belongsTo = [user: FacebookUser]
	
    static constraints = {
    }
}

package com.jordiv.emovix.facebook

class FacebookPost {
	Date dateCreated
	Date lastUpdated
	
	String postId
	String message
	Date postDate
	Integer likes
	
	static hasMany = [comments: FacebookComment]
	
    static constraints = {
    }
}

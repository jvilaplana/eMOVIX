package com.jordiv.emovix.facebook

class FacebookComment {
	Date dateCreated
	Date lastUpdated
	
	String commentId
	String message
	Date commentDate
	Integer likes
	
	static belongsTo = [user: FacebookUser, post: FacebookPost]
	
    static constraints = {
    }
}

package com.jordiv.emovix.facebook

class FacebookPost {
	Date dateCreated
	Date lastUpdated
	
	String postId
	String message
	String description
	String from
	String name
	Date postDate
	String type
	Integer shares
	Integer likes
	boolean monitor = false
	
	static hasMany = [comments: FacebookComment]
	
	static mapping = {
		message type: 'text'
		description type: 'text'
	}
	
	static constraints = {
		message maxSize:5000
		//message nullable:true
		description maxSize:5000
		//description nullable:true
		from nullable:true
		name nullable:true
		type nullable:true
		shares nullable:true
		likes nullable:true
		postDate nullable:true
		
	}
}





/*
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
*/
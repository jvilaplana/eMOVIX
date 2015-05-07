package com.jordiv.emovix.twitter

class TwitterUserMention {
	Integer end
	Long userId
	String name
	String screenName
	Integer start
	String text
	
	static belongsTo = [status: TwitterStatus]
	
    static constraints = {
    }
}

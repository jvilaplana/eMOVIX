package com.jordiv.emovix

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

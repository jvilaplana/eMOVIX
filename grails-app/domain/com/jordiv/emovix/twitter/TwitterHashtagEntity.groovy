package com.jordiv.emovix.twitter

class TwitterHashtagEntity extends TwitterTweetEntity {
	/** End character of the hashtag */
	Integer end
	/** Index of the start character of the hashtag */
	Integer start
	/** Text of the hashtag without # */
	String text
	
	static belongsTo = [status: TwitterStatus]
	
    static constraints = {
    }
}

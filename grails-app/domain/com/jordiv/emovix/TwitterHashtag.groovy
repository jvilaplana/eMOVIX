package com.jordiv.emovix

/**
 * One single Hashtag entity.
 * 
 * @author Jordi Vilaplana
 *
 */
class TwitterHashtag {
	/** Returns the index of the start character of the hashtag */
	Integer start
	/** Returns the index of the end character of the hashtag */
	Integer end
	/** Returns the text of the hashtag without # */
	String text
	
	static belongsTo = [status: TwitterStatus]
	
    static constraints = {
    }
}

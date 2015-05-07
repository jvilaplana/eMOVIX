package com.jordiv.emovix

class TwitterURL {
	/** Returns the display URL if mentioned URL is shorten */
	String displayURL
	/** Returns the index of the end character of the URL mentioned in the tweet */
	Integer end
	/** Returns the expanded URL if mentioned URL is shorten */
	String expandedURL
	/** Returns the index of the start character of the URL mentioned in the tweet */
	Integer start
	/** Returns the URL mentioned in the tweet */
	String url
	
	static belongsTo = [status: TwitterStatus]
	
    static constraints = {
    }
}

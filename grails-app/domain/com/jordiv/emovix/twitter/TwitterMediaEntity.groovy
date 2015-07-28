package com.jordiv.emovix.twitter

class TwitterMediaEntity extends TwitterURL {
	/** Id of the media */
	Long entityId
	/** Media URL */
	String mediaURL
	/** Media secure URL */
	String mediaURLHttps
	/** Media type ("photo", "video", "animated_gif") */
	String type
	
    static constraints = {
		mediaURLHttps nullable: true
    }
}

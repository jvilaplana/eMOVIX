package com.jordiv.emovix.twitter

class TwitterStatusLanguageDetection {
	/** The detected language */
	String language
	/** The source of the current language detection ("tika") */
	String source
	/** Tries to judge whether the identification is certain enough to be trusted.
	 *  WARNING: Will never return true for small amount of input texts */
	Boolean isReasonablyCertain
	
	static belongsTo = [status: TwitterStatus]
	
    static constraints = {
		language nullable: false, blank: false
		source nullable: false, blank: false
    }
}

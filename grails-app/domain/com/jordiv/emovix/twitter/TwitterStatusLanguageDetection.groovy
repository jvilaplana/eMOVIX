package com.jordiv.emovix.twitter

class TwitterStatusLanguageDetection {
	/** The detected language */
	String language
	/** The source of the current language detection ("tika") */
	String source
	/** Tries to judge whether the identification is certain enough to be trusted.
	 *  WARNING: Will never return true for small amount of input texts (tika) */
	Boolean isReasonablyCertain
	/** Confidence value depends on how much text you pass and how well it is identified.
	 *  The more text you pass, the higher confidence value will be. It is not a range, it can be higher than 100 */
	Float confidence
	
	static belongsTo = [status: TwitterStatus]
	
    static constraints = {
		language nullable: false, blank: false
		source nullable: false, blank: false
		confidence nullable: true
    }
}

package com.jordiv.emovix.twitter

import java.util.Date;

class TwitterStatus {
	Date dateCreated
	List contributors
	Date createdAt
	Integer favoriteCount = 0
	TwitterGeoLocation geoLocation
	Long statusId
	String inReplyToScreenName = null
	Long inReplyToStatusId = -1
	Long inReplyToUserId = -1
	String lang
	TwitterPlace place
	String quotedStatus
	Long quotedStatusId
	Integer retweetCount = 0
	TwitterStatus retweetedStatus
	TwitterScopes scopes
	/** From where the tweet was originated */
	String source
	String text
	TwitterUser twitterUser
	List withheldInCountries
	Boolean isFavorited
	Boolean isPossiblySensitive
	Boolean isRetweet
	Boolean isRetweeted
	Boolean isTruncated
	/** Source box of this tweet (worldBox, catBox, ukBox, ... */
	Integer sourceBox
	
	static hasMany = [
		contributors: Long,
		userMentions: TwitterUserMention, 
		hashtagEntities: TwitterHashtagEntity, 
		mediaEntities: TwitterMediaEntity, 
		symbolEntities: TwitterSymbolEntity, 
		urls: TwitterURL,
		withheldInCountries: String,
		languageDetections: TwitterStatusLanguageDetection
		]
	
    static constraints = {
		createdAt nullable: false
		geoLocation nullable: true
		statusId nullable: false, unique: true
		favoriteCount nullable: false
		inReplyToScreenName nullable: true
		inReplyToStatusId nullable: true
		inReplyToUserId nullable: true
		lang nullable: false
		place nullable: true
		quotedStatus nullable: true
		quotedStatusId nullable: true
		retweetCount nullable: false, min: 0
		retweetedStatus nullable: true
		scopes nullable: true
		retweetedStatus nullable: true
		source nullable: true
		text nullable: false
		twitterUser nullable: false
		isPossiblySensitive nullable: true
		sourceBox nullable: true
    }
}

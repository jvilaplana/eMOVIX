package com.jordiv.emovix

import java.util.Date;

class TwitterStatus {
	Date dateCreated
	Date createdAt
	Double latitude
	Double longitude
	Long statusId
	String lang
	String text
	TwitterUser twitterUser
	String screenName
	Integer favoriteCount = 0
	String inReplyToScreenName = null
	Long inReplyToStatusId = -1
	Long inReplyToUserId = -1
	Integer retweetCount = 0
	TwitterQueryResponse retweetedStatus
	/** From where the tweet was originated */
	String source
	Boolean possiblySensitive
	
	static hasMany = [userMentions: TwitterUserMention, hashtags: TwitterHashtag, urls: TwitterURL]
	
    static constraints = {
		createdAt nullable: false
		latitude nullable: true
		longitude nullable: true
		statusId nullable: false, unique: true
		favoriteCount nullable: false
		inReplyToScreenName nullable: true
		inReplyToStatusId nullable: true
		inReplyToUserId nullable: true
		lang nullable: false
		retweetCount nullable: false, min: 0
		retweetedStatus nullable: true
		source nullable: true
		text nullable: false
		twitterUser nullable: false
    }
}

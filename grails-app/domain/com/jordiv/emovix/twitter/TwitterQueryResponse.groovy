package com.jordiv.emovix.twitter

import java.util.Date;

/**
 * See http://twitter4j.org/javadoc/twitter4j/Status.html
 * 
 * @author Jordi Vilaplana
 *
 */
class TwitterQueryResponse {
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
	
	static belongsTo = [query: TwitterQuery]

    static constraints = {
		createdAt nullable: false
		latitude nullable: true
		longitude nullable: true
		statusId nullable: false
		favoriteCount nullable: false
		inReplyToScreenName nullable: true
		inReplyToStatusId nullable: true
		inReplyToUserId nullable: true
		lang nullable: false
		retweetCount nullable: false, min: 0
		retweetedStatus nullable: true
		source nullable: true
		text nullable: false
		statusId unique: 'query'
		twitterUser nullable: false
    }
}

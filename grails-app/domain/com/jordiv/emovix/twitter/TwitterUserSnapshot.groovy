package com.jordiv.emovix.twitter

import java.util.Date

class TwitterUserSnapshot {
	TwitterUser user
	Date dateCreated
	Date lastUpdated
	String biggerProfileImageURL
	String biggerProfileImageURLHttps
	String description
	Integer favouritesCount
	Integer followersCount
	Integer friendsCount
	String lang
	String location
	String miniprofileImageURL
	String miniProfileImageURLHttps
	String name
	String screenName
	Integer getStatusesCount
	String timeZone
	String url
	Boolean isDefaultProfile
	Boolean isDefaultProfileImage
	Boolean isGeoEnabled
	Boolean isProtected
	Boolean isVerified
	
	static belongsTo = [user: TwitterUser]
	
    static constraints = {
    }
}

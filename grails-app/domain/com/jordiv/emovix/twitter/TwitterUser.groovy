package com.jordiv.emovix.twitter

class TwitterUser {
	Date dateCreated
	Date lastUpdated
	String biggerProfileImageURL
	String biggerProfileImageURLHttps
	Date createdAt
	String description
	Integer favouritesCount
	Integer followersCount
	Integer friendsCount
	Long userId
	String lang
	String location
	String miniprofileImageURL
	String miniProfileImageURLHttps
	String name
	String screenName
	Integer statusesCount
	String timeZone
	String url
	Boolean isDefaultProfile
	Boolean isDefaultProfileImage
	Boolean isGeoEnabled
	Boolean isProtected
	Boolean isVerified
	
	static hasMany = [snapshots: TwitterUserSnapshot]
	
    static constraints = {
		description nullable: true, blank: true
		userId unique: true
		timeZone nullable: true, blank: true
		url nullable: true, blank: true
    }
	
	
	String toString() {
		screenName
	}
}

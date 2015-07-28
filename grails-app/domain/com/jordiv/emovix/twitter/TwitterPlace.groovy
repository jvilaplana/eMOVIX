package com.jordiv.emovix.twitter

class TwitterPlace {
	String boundingBoxType
	TwitterPlace containedWithIn
	String country
	String countryCode
	String fullName
	String geometryType
	String placeId
	String name
	String placeType
	String streetAddress
	String url
	
	static hasMany = [boundingBoxCoordinates: TwitterGeoLocation, geometryCoordinates: TwitterGeoLocation]
	
    static constraints = {
		boundingBoxType nullable: true
		containedWithIn nullable: true
		country nullable: true
		countryCode nullable: true
		fullName nullable: true
		geometryType nullable: true
		placeId nullable: true
		name nullable: true
		placeType nullable: true
		streetAddress nullable: true
		url nullable: true
    }
}

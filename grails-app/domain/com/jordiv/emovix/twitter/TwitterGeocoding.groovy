package com.jordiv.emovix.twitter

/**
 * Represents a Geocoding position obtained from MapQuest Geocoding API
 * @author jordi
 *
 */
class TwitterGeocoding {
	String location
	Double latitude
	Double longitude
	
	static hasMany = [users: TwitterUser]
	
    static constraints = {
		location nullable: false, unique: true
		latitude nullable: false
		longitude nullable: false
    }
}

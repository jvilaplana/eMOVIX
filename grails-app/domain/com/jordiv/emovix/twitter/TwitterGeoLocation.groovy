package com.jordiv.emovix.twitter

class TwitterGeoLocation {
	Double latitude
	Double longitude
	
    static constraints = {
		latitude nullable: false
		longitude nullable: false
    }
}

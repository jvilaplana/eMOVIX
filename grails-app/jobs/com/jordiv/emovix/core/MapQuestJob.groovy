package com.jordiv.emovix.core

import grails.plugins.rest.client.RestBuilder
import com.jordiv.emovix.twitter.TwitterGeocoding

class MapQuestJob {
    static triggers = {
      simple repeatInterval: 180000l // Execute job once in 3 minutes
    }

    def execute() {
		// Retrieve a stored location with null coordinates
		def twitterGeocoding = TwitterGeocoding.mongo.findByLatitudeAndLongitude(null, null)
		
		// If we have none, we are done
		if(twitterGeocoding == null) return
		
		// If we have some, there is work to be done
		def rest = new RestBuilder()
		def resp = null
		try {
			resp = rest.get(
				"http://open.mapquestapi.com/geocoding/v1/address?key=rV9y5rZVwaWwYwFWA4pOj2IkuvXsoC0u&callback=renderGeocode&location=" +
				twitterGeocoding.location + "&outFormat=csv&thumbMaps=false&maxResults=1")
		} catch(Exception e) {
			println "MapQuest error"
			return
		}
		
		// If the response is okay we extract the coordinates
		if(resp.status == 200) {
			def respText = resp.text
			respText = resp.text.replaceAll("\"", "")
			respText = resp.text.split(",")
			
			if(respText.size() < 23) return -1
			
			def latitude = Double.parseDouble(respText[21].replaceAll("\"", ""))
			def longitude = Double.parseDouble(respText[22].replaceAll("\"", ""))
			
			twitterGeocoding.latitude = latitude
			twitterGeocoding.longitude = longitude
			
			twitterGeocoding.mongo.save()
		}
    }
}

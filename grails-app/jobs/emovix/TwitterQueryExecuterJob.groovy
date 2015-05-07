package emovix

import java.util.Date;

import twitter4j.Query
import twitter4j.QueryResult
import twitter4j.Status
import twitter4j.Twitter
import twitter4j.TwitterFactory

import com.jordiv.emovix.TwitterQuery
import com.jordiv.emovix.TwitterQueryResponse
import com.jordiv.emovix.TwitterUser


class TwitterQueryExecuterJob {
    static triggers = {
      simple repeatInterval: 10000l // execute job once in 10 seconds
    }

    def execute() {
		/*
		def twitterQuerySearch = TwitterQuery.findByEnabledAndRunning(true, false, [sort: "priority", order: "desc"])
		def twitterQuery = TwitterQuery.get(twitterQuerySearch?.id)
		
		if(twitterQuery == null) return
		
		println "Running query " + twitterQuery.name + " ..."
		
		twitterQuery.running = true
		twitterQuery.save(flush: true)
		
		int resultsFound = 0
		
		try {
			Twitter twitter = TwitterFactory.getSingleton()
			Query query = new Query(twitterQuery.query)
			query.setCount(query.count)
			QueryResult result = null
			int i = 1
			while(query != null && twitterQuery?.enabled) {
				result = twitter.search(query)
				for (Status status : result.getTweets()) {
					resultsFound++
					
					def twitterQueryResponse = new TwitterQueryResponse(query: twitterQuery)
					twitterQueryResponse.createdAt = status.getCreatedAt()
					if(status.getGeoLocation() != null) {
						twitterQueryResponse.latitude = status.getGeoLocation().getLatitude()
						twitterQueryResponse.longitude = status.getGeoLocation().getLongitude()
					}
					twitterQueryResponse.statusId = status.getId()
					twitterQueryResponse.lang = status.getLang()
					twitterQueryResponse.text = status.getText()
					
					TwitterUser twitterUser = new TwitterUser()
					twitterUser.biggerProfileImageURL = status.getUser().getBiggerProfileImageURL()
					twitterUser.biggerProfileImageURLHttps = status.getUser().getBiggerProfileImageURLHttps()
					twitterUser.createdAt = status.getUser().getCreatedAt()
					twitterUser.description = status.getUser().getDescription()
					twitterUser.favouritesCount = status.getUser().getFavouritesCount()
					twitterUser.followersCount = status.getUser().getFollowersCount()
					twitterUser.friendsCount = status.getUser().getFriendsCount()
					twitterUser.userId = status.getUser().getId()
					twitterUser.lang = status.getUser().getLang()
					twitterUser.location = status.getUser().getLocation()
					twitterUser.miniprofileImageURL = status.getUser().getMiniProfileImageURL()
					twitterUser.miniProfileImageURLHttps = status.getUser().getMiniProfileImageURLHttps()
					twitterUser.name = status.getUser().getName()
					twitterUser.screenName = status.getUser().getScreenName()
					twitterUser.getStatusesCount = status.getUser().getStatusesCount()
					twitterUser.timeZone = status.getUser().getTimeZone()
					twitterUser.url = status.getUser().getURL()
					twitterUser.isDefaultProfile = status.getUser().isDefaultProfile()
					twitterUser.isDefaultProfileImage = status.getUser().isDefaultProfileImage()
					twitterUser.isGeoEnabled = status.getUser().isGeoEnabled()
					twitterUser.isProtected = status.getUser().isProtected()
					twitterUser.isVerified = status.getUser().isVerified()
					
					twitterUser.save flush: true, failOnError: true
					
					twitterQueryResponse.twitterUser = twitterUser
					
					twitterQueryResponse.screenName = status.getUser().getScreenName()
					twitterQueryResponse.favoriteCount = status.getFavoriteCount()
					twitterQueryResponse.inReplyToScreenName = status.getInReplyToScreenName()
					twitterQueryResponse.inReplyToStatusId = status.getInReplyToStatusId()
					twitterQueryResponse.inReplyToUserId = status.getInReplyToUserId()
					twitterQueryResponse.retweetCount = status.getRetweetCount()
					twitterQueryResponse.retweetedStatus = null
					twitterQueryResponse.source = status.getSource()
					twitterQueryResponse.possiblySensitive = status.isPossiblySensitive()
					
					twitterQueryResponse.save(flush: true, failOnError: true)
				}
				
				query = result.nextQuery()
				println "\tNew query:"
				println query
				println "\tGetting page " + i + " ..."
				i++
				Thread.sleep(5 * 1000);
				
				twitterQuery?.refresh()
				println "\t\tenabled = " + twitterQuery.enabled
			}
		} catch(Exception e) {
			println "[ERROR - TwitterQueryExecuterJob] Something went wrong!"
			println e.printStackTrace()
		} finally {
			twitterQuery.running = false
			twitterQuery.enabled = false
			twitterQuery.save(flush: true)
		}
		
		println "Results found: " + resultsFound
		println "-------------------"
		*/
    }
}

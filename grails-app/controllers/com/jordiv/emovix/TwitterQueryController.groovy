package com.jordiv.emovix

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import twitter4j.Query
import twitter4j.QueryResult
import twitter4j.RateLimitStatus
import twitter4j.Status
import twitter4j.Twitter
import twitter4j.TwitterException
import twitter4j.TwitterFactory
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN', 'ROLE_USER'])
class TwitterQueryController {
	
	def springSecurityService

    //static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	static allowedMethods = [save: "POST", update: "PUT"]
	
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		respond TwitterQuery.list(params), model:[twitterQueryInstanceCount: TwitterQuery.count()]
    }
	
	def dashboard(TwitterQuery twitterQueryInstance) {
		
		respond twitterQueryInstance, model:[]
	}
	
	def ajaxCheckTwitterUsername() {
		def username = params?.username?.replace('@', '')
		try {
			Twitter twitter = TwitterFactory.getSingleton()
			twitter.showUser(username)
			render 1
			return
		} catch(TwitterException e) {
			render 0
			return
		}
	}
	
	def ajaxReviewAction() {
		println params?.isBullying
		println params['response.id']
		
		
		render ""
	}

    def show(TwitterQuery twitterQueryInstance) {
		
		respond twitterQueryInstance, model:[]
    }

    def create() {
        respond new TwitterQuery(params)
    }

    @Transactional
    def save(TwitterQuery twitterQueryInstance) {
		
		if (twitterQueryInstance == null) {
            notFound()
            return
        }

        if (twitterQueryInstance.hasErrors()) {
            respond twitterQueryInstance.errors, view:'create'
            return
        }

        twitterQueryInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'twitterQuery.label', default: 'TwitterQuery'), twitterQueryInstance.id])
                //redirect twitterQueryInstance
				redirect action: "dashboard", id: twitterQueryInstance?.id
            }
            '*' { respond twitterQueryInstance, [status: CREATED] }
        }
    }

    def edit(TwitterQuery twitterQueryInstance) {
        respond twitterQueryInstance
    }

    @Transactional
    def update(TwitterQuery twitterQueryInstance) {
        if (twitterQueryInstance == null) {
            notFound()
            return
        }

        if (twitterQueryInstance.hasErrors()) {
            respond twitterQueryInstance.errors, view:'edit'
            return
        }

        twitterQueryInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TwitterQuery.label', default: 'TwitterQuery'), twitterQueryInstance.id])
                redirect action: "dashboard", id: twitterQueryInstance?.id
            }
            '*'{ respond twitterQueryInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TwitterQuery twitterQueryInstance) {

        if (twitterQueryInstance == null) {
            notFound()
            return
        }

        twitterQueryInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TwitterQuery.label', default: 'TwitterQuery'), twitterQueryInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }
	
	@Transactional
	def enable(TwitterQuery twitterQueryInstance) {
		if (twitterQueryInstance == null) {
			notFound()
			return
		}
		
		twitterQueryInstance.enabled = true
		twitterQueryInstance.save(flush: true)
		
		redirect action: "dashboard", id: twitterQueryInstance?.id
	}
	
	@Transactional
	def disable(TwitterQuery twitterQueryInstance) {
		if (twitterQueryInstance == null) {
			notFound()
			return
		}
		
		twitterQueryInstance.enabled = false
		twitterQueryInstance.save(flush: true)
		
		redirect action: "dashboard", id: twitterQueryInstance?.id
	}
	
	def run(TwitterQuery twitterQueryInstance) {
		if (twitterQueryInstance == null) {
			notFound()
			return
		}
		
		def results = []
		try {
			Twitter twitter = TwitterFactory.getSingleton()
			Query query = new Query(twitterQueryInstance.query)
			query.setCount(twitterQueryInstance.count)
			QueryResult result = null
			//result = twitter.search(query)
			while(query != null) {
				result = twitter.search(query)
				
				for (Status status : result.getTweets()) {
					println "------------"
					println "1: " + status.getContributors()
					println "2: " +  status.getCreatedAt()
					println "3: " +  status.getCurrentUserRetweetId()
					println "4: " +  status.getFavoriteCount()
					println "5: " +  status.getGeoLocation()
					println "6: " +  status.getId()
					println "7: " +  status.getInReplyToScreenName()
					println "8: " +  status.getInReplyToStatusId()
					println "9: " +  status.getInReplyToUserId()
					println "10: " +  status.getLang()
					println "11: " +  status.getPlace()
					println "12: " +  status.getRetweetCount()
					println "13: " +  status.getRetweetedStatus()
					println "14: " +  status.getScopes()
					println "15: " +  status.getSource()
					println "16: " +  status.getText()
					println "17: " +  status.getUser()
					println "18: " +  status.isFavorited()
					println "19: " +  status.isPossiblySensitive()
					println "20: " +  status.isRetweeted()
					println "21: " +  status.isRetweetedByMe()
					println "22: " +  status.isTruncated()
					println "------------"
					// http://twitter4j.org/javadoc/twitter4j/Status.html
					def geolocation = null
					if(status.getGeoLocation() != null) {
						geolocation = status.getGeoLocation().getLatitude() + "," + status.getGeoLocation().getLongitude()
					}
					results.add ([status.getUser().getScreenName() as String, status.getText() as String, geolocation, status.getId()])
				}
				
				query = result.nextQuery()
			}
		} catch(TwitterException te) {
			te.printStackTrace();
			System.out.println("Failed to get rate limit status: " + te.getMessage());
			flash.message = message(code: 'twitter.exception.label')
		}
		
		render(view: "run", model: [twitterQueryInstance: twitterQueryInstance, result: results])
	}
	
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'twitterQuery.label', default: 'TwitterQuery'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

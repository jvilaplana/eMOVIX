package com.jordiv.emovix.twitter



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TwitterMonitorUserController {
	def twitterService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TwitterMonitorUser.list(params), model:[twitterMonitorUserInstanceCount: TwitterMonitorUser.count()]
    }

    def show(TwitterMonitorUser twitterMonitorUserInstance) {
        respond twitterMonitorUserInstance
    }

    def create() {
        respond new TwitterMonitorUser(params)
    }

    @Transactional
    def save(TwitterMonitorUser twitterMonitorUserInstance) {
        if (twitterMonitorUserInstance == null) {
            notFound()
            return
        }
		
		def username = params?.userName
		
		if(twitterService.isTwitterUsername(username)) {
			def user = twitterService.getUser(username)
			twitterMonitorUserInstance?.user = user
		}
		else {
			flash.message = message(code: 'twitter.username.invalid')
			redirect action: "create", params: [twitterMonitorUserInstance: twitterMonitorUserInstance]
		}
		
		twitterMonitorUserInstance.save flush:true
		
        if (twitterMonitorUserInstance.hasErrors()) {
			println twitterMonitorUserInstance.errors
            respond twitterMonitorUserInstance.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'twitterMonitorUser.label', default: 'TwitterMonitorUser'), twitterMonitorUserInstance.id])
                redirect twitterMonitorUserInstance
            }
            '*' { respond twitterMonitorUserInstance, [status: CREATED] }
        }
    }

    def edit(TwitterMonitorUser twitterMonitorUserInstance) {
        respond twitterMonitorUserInstance
    }

    @Transactional
    def update(TwitterMonitorUser twitterMonitorUserInstance) {
        if (twitterMonitorUserInstance == null) {
            notFound()
            return
        }

        if (twitterMonitorUserInstance.hasErrors()) {
            respond twitterMonitorUserInstance.errors, view:'edit'
            return
        }

        twitterMonitorUserInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TwitterMonitorUser.label', default: 'TwitterMonitorUser'), twitterMonitorUserInstance.id])
                redirect twitterMonitorUserInstance
            }
            '*'{ respond twitterMonitorUserInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TwitterMonitorUser twitterMonitorUserInstance) {

        if (twitterMonitorUserInstance == null) {
            notFound()
            return
        }

        twitterMonitorUserInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TwitterMonitorUser.label', default: 'TwitterMonitorUser'), twitterMonitorUserInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'twitterMonitorUser.label', default: 'TwitterMonitorUser'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

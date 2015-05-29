package com.jordiv.emovix.twitter



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TwitterUserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TwitterUser.list(params), model:[twitterUserInstanceCount: TwitterUser.count()]
    }

    def show(TwitterUser twitterUserInstance) {
        respond twitterUserInstance
    }

    def create() {
        respond new TwitterUser(params)
    }

    @Transactional
    def save(TwitterUser twitterUserInstance) {
        if (twitterUserInstance == null) {
            notFound()
            return
        }

        if (twitterUserInstance.hasErrors()) {
            respond twitterUserInstance.errors, view:'create'
            return
        }

        twitterUserInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'twitterUser.label', default: 'TwitterUser'), twitterUserInstance.id])
                redirect twitterUserInstance
            }
            '*' { respond twitterUserInstance, [status: CREATED] }
        }
    }

    def edit(TwitterUser twitterUserInstance) {
        respond twitterUserInstance
    }

    @Transactional
    def update(TwitterUser twitterUserInstance) {
        if (twitterUserInstance == null) {
            notFound()
            return
        }

        if (twitterUserInstance.hasErrors()) {
            respond twitterUserInstance.errors, view:'edit'
            return
        }

        twitterUserInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TwitterUser.label', default: 'TwitterUser'), twitterUserInstance.id])
                redirect twitterUserInstance
            }
            '*'{ respond twitterUserInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TwitterUser twitterUserInstance) {

        if (twitterUserInstance == null) {
            notFound()
            return
        }

        twitterUserInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TwitterUser.label', default: 'TwitterUser'), twitterUserInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'twitterUser.label', default: 'TwitterUser'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

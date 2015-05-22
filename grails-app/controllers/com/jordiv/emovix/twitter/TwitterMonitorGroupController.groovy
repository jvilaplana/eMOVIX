package com.jordiv.emovix.twitter



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TwitterMonitorGroupController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TwitterMonitorGroup.list(params), model:[twitterMonitorGroupInstanceCount: TwitterMonitorGroup.count()]
    }

    def show(TwitterMonitorGroup twitterMonitorGroupInstance) {
        respond twitterMonitorGroupInstance
    }

    def create() {
        respond new TwitterMonitorGroup(params)
    }

    @Transactional
    def save(TwitterMonitorGroup twitterMonitorGroupInstance) {
        if (twitterMonitorGroupInstance == null) {
            notFound()
            return
        }

        if (twitterMonitorGroupInstance.hasErrors()) {
            respond twitterMonitorGroupInstance.errors, view:'create'
            return
        }

        twitterMonitorGroupInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'twitterMonitorGroup.label', default: 'TwitterMonitorGroup'), twitterMonitorGroupInstance.id])
                redirect twitterMonitorGroupInstance
            }
            '*' { respond twitterMonitorGroupInstance, [status: CREATED] }
        }
    }

    def edit(TwitterMonitorGroup twitterMonitorGroupInstance) {
        respond twitterMonitorGroupInstance
    }

    @Transactional
    def update(TwitterMonitorGroup twitterMonitorGroupInstance) {
        if (twitterMonitorGroupInstance == null) {
            notFound()
            return
        }

        if (twitterMonitorGroupInstance.hasErrors()) {
            respond twitterMonitorGroupInstance.errors, view:'edit'
            return
        }

        twitterMonitorGroupInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TwitterMonitorGroup.label', default: 'TwitterMonitorGroup'), twitterMonitorGroupInstance.id])
                redirect twitterMonitorGroupInstance
            }
            '*'{ respond twitterMonitorGroupInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TwitterMonitorGroup twitterMonitorGroupInstance) {

        if (twitterMonitorGroupInstance == null) {
            notFound()
            return
        }

        twitterMonitorGroupInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TwitterMonitorGroup.label', default: 'TwitterMonitorGroup'), twitterMonitorGroupInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'twitterMonitorGroup.label', default: 'TwitterMonitorGroup'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

package com.jordiv.emovix.twitter



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TwitterUserSnapshotController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TwitterUserSnapshot.list(params), model:[twitterUserSnapshotInstanceCount: TwitterUserSnapshot.count()]
    }

    def show(TwitterUserSnapshot twitterUserSnapshotInstance) {
        respond twitterUserSnapshotInstance
    }

    def create() {
        respond new TwitterUserSnapshot(params)
    }

    @Transactional
    def save(TwitterUserSnapshot twitterUserSnapshotInstance) {
        if (twitterUserSnapshotInstance == null) {
            notFound()
            return
        }

        if (twitterUserSnapshotInstance.hasErrors()) {
            respond twitterUserSnapshotInstance.errors, view:'create'
            return
        }

        twitterUserSnapshotInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'twitterUserSnapshot.label', default: 'TwitterUserSnapshot'), twitterUserSnapshotInstance.id])
                redirect twitterUserSnapshotInstance
            }
            '*' { respond twitterUserSnapshotInstance, [status: CREATED] }
        }
    }

    def edit(TwitterUserSnapshot twitterUserSnapshotInstance) {
        respond twitterUserSnapshotInstance
    }

    @Transactional
    def update(TwitterUserSnapshot twitterUserSnapshotInstance) {
        if (twitterUserSnapshotInstance == null) {
            notFound()
            return
        }

        if (twitterUserSnapshotInstance.hasErrors()) {
            respond twitterUserSnapshotInstance.errors, view:'edit'
            return
        }

        twitterUserSnapshotInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TwitterUserSnapshot.label', default: 'TwitterUserSnapshot'), twitterUserSnapshotInstance.id])
                redirect twitterUserSnapshotInstance
            }
            '*'{ respond twitterUserSnapshotInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TwitterUserSnapshot twitterUserSnapshotInstance) {

        if (twitterUserSnapshotInstance == null) {
            notFound()
            return
        }

        twitterUserSnapshotInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TwitterUserSnapshot.label', default: 'TwitterUserSnapshot'), twitterUserSnapshotInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'twitterUserSnapshot.label', default: 'TwitterUserSnapshot'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

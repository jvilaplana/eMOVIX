package com.jordiv.emovix



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TwitterQueryResponseController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
		max = 100
        params.max = Math.min(max ?: 10, 100)
		
		TwitterQuery query = TwitterQuery.get(params?.id)
		
		def twitterQueryResponses = TwitterQueryResponse.findAllByQuery(query, [max: params.max])
		def twitterQueryResponseInstanceCount = TwitterQueryResponse.findAllByQuery(query).size()
		
		if(query != null) {
			println query?.name
			render(view: "index", model: [twitterQueryResponseInstanceList: twitterQueryResponses, twitterQueryResponseInstanceCount: twitterQueryResponseInstanceCount])
		}
		else {
			respond TwitterQueryResponse.list(params), model:[twitterQueryResponseInstanceCount: TwitterQueryResponse.count()]
		}
    }

    def show(TwitterQueryResponse twitterQueryResponseInstance) {
        respond twitterQueryResponseInstance
    }

    def create() {
        respond new TwitterQueryResponse(params)
    }

    @Transactional
    def save(TwitterQueryResponse twitterQueryResponseInstance) {
        if (twitterQueryResponseInstance == null) {
            notFound()
            return
        }

        if (twitterQueryResponseInstance.hasErrors()) {
            respond twitterQueryResponseInstance.errors, view:'create'
            return
        }

        twitterQueryResponseInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'twitterQueryResponse.label', default: 'TwitterQueryResponse'), twitterQueryResponseInstance.id])
                redirect twitterQueryResponseInstance
            }
            '*' { respond twitterQueryResponseInstance, [status: CREATED] }
        }
    }

    def edit(TwitterQueryResponse twitterQueryResponseInstance) {
        respond twitterQueryResponseInstance
    }

    @Transactional
    def update(TwitterQueryResponse twitterQueryResponseInstance) {
        if (twitterQueryResponseInstance == null) {
            notFound()
            return
        }

        if (twitterQueryResponseInstance.hasErrors()) {
            respond twitterQueryResponseInstance.errors, view:'edit'
            return
        }

        twitterQueryResponseInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TwitterQueryResponse.label', default: 'TwitterQueryResponse'), twitterQueryResponseInstance.id])
                redirect twitterQueryResponseInstance
            }
            '*'{ respond twitterQueryResponseInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TwitterQueryResponse twitterQueryResponseInstance) {

        if (twitterQueryResponseInstance == null) {
            notFound()
            return
        }

        twitterQueryResponseInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TwitterQueryResponse.label', default: 'TwitterQueryResponse'), twitterQueryResponseInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'twitterQueryResponse.label', default: 'TwitterQueryResponse'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

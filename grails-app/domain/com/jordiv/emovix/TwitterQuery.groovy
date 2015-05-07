package com.jordiv.emovix

class TwitterQuery {
	String name
	String query
	/** Sets the number of tweets to return per page, up to a max of 100 */
	Integer count = 10
	/** If this query should be automatically executed */
	Boolean enabled = false
	/** If the query is currently being executed */
	Boolean running = false
	/** Priority to execute this query, where 0 is the least and 99 the most priority */
	Integer priority = 1
	/** If specified, returns tweets with since the given date. Date should be formatted as YYYY-MM-DD */
	String since
	/** If specified, returns tweets with generated before the given date. Date should be formatted as YYYY-MM-DD */
	String until
	
	static hasMany = [responses: TwitterQueryResponse]
	
    static constraints = {
		name nullable: false, blank: false
		query nullable: false, blank: false
		count nullable: false, min: 1, max: 100
		since nullable: true, blank: true
		until nullable: true, blank: true
		priority nullable: false, min: 0, max: 99
    }
	
	String toString() {
		return this.name
	}
}

package com.jordiv.emovix.facebook

class FacebookUser {
	Date dateCreated
	Date lastUpdated
	
	String userId
	String name
	String middleName
	String firstName
	String lastName
	String email
	String gender
	Date birthday
	String religion
	String political
	FacebookLocation address
	String displayCountry
	String language
	String relationshipStatus
	String website
	
	static hasMany = [
		groups: FacebookGroup,
		interests: String,
		languages: String,
		sports: String,
		athletes: String,
		educations: String,
		works: String
		]
	
    static constraints = {
    }
}

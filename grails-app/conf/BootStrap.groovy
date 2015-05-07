import com.jordiv.emovix.Role
import com.jordiv.emovix.TwitterQuery
import com.jordiv.emovix.User
import com.jordiv.emovix.UserRole

class BootStrap {

    def init = { servletContext ->
		
		def bootstrapEnabled = true
		
		if(bootstrapEnabled) {
			def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
			def userRole = new Role(authority: 'ROLE_USER').save(flush: true)
			User adminUser = new User(username: 'admin', fullName: 'Jordi Vilaplana', password: 'admin1', enabled: true, accountExpired: false, accountLocked: false, passwordExpired: false).save(flush: true)
			UserRole.create adminUser, adminRole
			
			def twitterQuery = TwitterQuery.findByName('Bullying')
			if(twitterQuery == null) {
				twitterQuery = new TwitterQuery(name: 'Bullying', query: 'school OR class OR bitch OR you OR your OR gay OR faggot OR dumb OR stupid OR fuck OR shit OR ass OR yourself OR die OR kill OR fruity OR queer OR fat lang:en', count: '100', enabled: false).save(flush: true)
			}
		}
    }
    def destroy = {
    }
}

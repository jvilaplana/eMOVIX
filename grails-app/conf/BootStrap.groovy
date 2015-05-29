import com.jordiv.emovix.core.Role
import com.jordiv.emovix.twitter.TwitterMonitorGroup
import com.jordiv.emovix.twitter.TwitterQuery
import com.jordiv.emovix.core.User
import com.jordiv.emovix.core.UserRole

class BootStrap {

    def init = { servletContext ->
		
		def bootstrapEnabled = true
		
		if(bootstrapEnabled) {
			def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
			def userRole = new Role(authority: 'ROLE_USER').save(flush: true)
			User adminUser = new User(username: 'admin', fullName: 'Jordi Vilaplana', password: 'admin1', enabled: true, accountExpired: false, accountLocked: false, passwordExpired: false).save(flush: true)
			UserRole.create adminUser, adminRole
			
			def socialMovementsGroup = new TwitterMonitorGroup(name: 'Moviments socials', description: '').save(flush: true)
			def politicalPartiesGroup = new TwitterMonitorGroup(name: 'Partits polítics', description: '').save(flush: true)
			def universitiesGroup = new TwitterMonitorGroup(name: 'Universitats', description: '').save(flush: true)
			def pressGroup = new TwitterMonitorGroup(name: 'Premsa', description: '').save(flush: true)
			def institutionsGroup = new TwitterMonitorGroup(name: 'Institucions', description: '').save(flush: true)
		}
    }
    def destroy = {
    }
}

import twitter4j.FilterQuery
import twitter4j.StallWarning
import twitter4j.Status
import twitter4j.StatusAdapter
import twitter4j.StatusDeletionNotice
import twitter4j.StatusListener
import twitter4j.TwitterStream
import twitter4j.TwitterStreamFactory

import com.jordiv.emovix.core.Role
import com.jordiv.emovix.core.User
import com.jordiv.emovix.core.UserRole
import com.jordiv.emovix.twitter.CustomStatusListener
import com.jordiv.emovix.twitter.TwitterMonitorGroup
import com.jordiv.emovix.twitter.TwitterMonitorUser

class BootStrap {
	def twitterService
	
    def init = { servletContext ->
		
		def bootstrapEnabled = true
		
		if(bootstrapEnabled) {
			def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
			def userRole = new Role(authority: 'ROLE_USER').save(flush: true)
			User adminUser = new User(username: 'admin', fullName: 'Jordi Vilaplana', password: 'admin1', enabled: true, accountExpired: false, accountLocked: false, passwordExpired: false).save(flush: true)
			UserRole.create adminUser, adminRole
			
			def socialMovementsGroup = new TwitterMonitorGroup(name: 'Moviments socials', description: '').save(flush: true)
			def associationsGroup = new TwitterMonitorGroup(name: 'Associacions i grups', description: '').save(flush: true)
			def politicalPartiesGroup = new TwitterMonitorGroup(name: 'Partits polítics', description: '').save(flush: true)
			def universitiesGroup = new TwitterMonitorGroup(name: 'Universitats', description: '').save(flush: true)
			def pressGroup = new TwitterMonitorGroup(name: 'Premsa', description: '').save(flush: true)
			def institutionsGroup = new TwitterMonitorGroup(name: 'Institucions', description: '').save(flush: true)
			
			monitorSocialMovements(socialMovementsGroup)
			monitorAssociations(associationsGroup)
			monitorUniversities(universitiesGroup)
			monitorPoliticalParties(politicalPartiesGroup)
			monitorPress(pressGroup)
			monitorInstitutions(institutionsGroup)
		}
		
		// Start the Twitter4j streaming
		twitterService.getStream()
    }
	
	/**
	 * Catalan social movements
	 *
	 * @param universitiesGroup
	 * @return
	 */
	def monitorSocialMovements(socialMovementsGroup) {
		def twitter_user
		def monitor_user
		
		twitter_user = twitterService.getUser("MareaGranate")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: socialMovementsGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("assemblea")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: socialMovementsGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("ancengland")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: socialMovementsGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("omnium")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: socialMovementsGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("esquerresxlaind")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: socialMovementsGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("esmareablanca")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: socialMovementsGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("mareablancall")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: socialMovementsGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("mareagroga")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: socialMovementsGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("LA_PAH")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: socialMovementsGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("marealilalleida")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: socialMovementsGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("UnitatvsRacisme")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: socialMovementsGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("Multireferendum")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: socialMovementsGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("OCMunicipal")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: socialMovementsGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("ParlaCiutada")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: socialMovementsGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("assembleadocent")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: socialMovementsGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("FSCat2014")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: socialMovementsGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("twitt_odg")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: socialMovementsGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("I_CSC")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: socialMovementsGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("fundipau")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: socialMovementsGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("RubiSolidari")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: socialMovementsGroup, followFollowers: true).save(flush: true)
	}
	/**
	 * Catalan groups and associations
	 * 
	 * @param associationsGroup
	 * @return
	 */
	def monitorAssociations(associationsGroup) {
		def twitter_user
		def monitor_user
		
		twitter_user = twitterService.getUser("UKCatalans")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: associationsGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("catalansalmon")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: associationsGroup, followFollowers: true).save(flush: true)
	}
	
	/**
	 * Catalan universities from:
	 * http://www.gencat.cat/economia/ur/ambits/universitats/sistema/universitat_catalanes/llista/
	 * 
	 * @param universitiesGroup
	 * @return
	 */
	def monitorUniversities(universitiesGroup) {
		def twitter_user
		def monitor_user
		
		twitter_user = twitterService.getUser("EPS_UdL")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: universitiesGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("udl_info")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: universitiesGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("ub_endirecte")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: universitiesGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("UAB_info")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: universitiesGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("barcelonatech")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: universitiesGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("univpompeufabra")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: universitiesGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("UnivGirona")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: universitiesGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("universitatURV")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: universitiesGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("uramonllull")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: universitiesGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("UOCuniversitat")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: universitiesGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("UICbarcelona")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: universitiesGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("UAOCEU")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: universitiesGroup, followFollowers: true).save(flush: true)
	}
	
	/**
	 * Catalan political parties from:
	 * http://ca.wikipedia.org/wiki/Llista_de_partits_pol%C3%ADtics_parlamentaris_catalans
	 *
	 * @param universitiesGroup
	 * @return
	 */
	def monitorPoliticalParties(politicalPartiesGroup) {
		def twitter_user
		def monitor_user
		
		twitter_user = twitterService.getUser("ciu")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: politicalPartiesGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("convergenciacat")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: politicalPartiesGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("esquerra_ERC")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: politicalPartiesGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("socialistes_cat")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: politicalPartiesGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("PPCatalunya")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: politicalPartiesGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("icveuia")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: politicalPartiesGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("cupnacional")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: politicalPartiesGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("podemosgb")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: politicalPartiesGroup, followFollowers: true).save(flush: true)
	}
	
	/**
	 * Catalan press from:
	 * http://ca.wikipedia.org/wiki/Llista_de_premsa_en_catal%C3%A0
	 *
	 * @param pressGroup
	 * @return
	 */
	def monitorPress(pressGroup) {
		def twitter_user
		def monitor_user
		
		twitter_user = twitterService.getUser("diariARA")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: pressGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("elpuntavui")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: pressGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("lesportiucat")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: pressGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("elperiodico_cat")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: pressGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("LaVanguardiaCAT")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: pressGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("diaridegirona")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: pressGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("bondia")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: pressGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("diariRegio7")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: pressGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("segrecom")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: pressGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("agenciaacn")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: pressGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("324cat")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: pressGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("revistacat")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: pressGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("eldiarioes")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: pressGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("Catalunya_Press")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: pressGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("catdialeg")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: pressGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("comunicacio21")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: pressGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("SentitCritic")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: pressGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("cultura_21")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: pressGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("dbalears")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: pressGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("directe")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: pressGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("enoticiescat")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: pressGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("EcoDiari")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: pressGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("EconoDigital")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: pressGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("DiariEducacio")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: pressGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("elmatidigital")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: pressGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("elpaiscat")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: pressGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("elsingular")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: pressGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("VilaWeb")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: pressGroup, followFollowers: true).save(flush: true)
	}
	
	/**
	 * Catalan institutions from:
	 * http://www.xtec.cat/~aguiu1/socials/cat82.htm
	 * http://ca.wikipedia.org/wiki/Categoria:Institucions_catalanes
	 * 
	 * @param institutionsGroup
	 * @return
	 */
	def monitorInstitutions(institutionsGroup) {
		def twitter_user
		def monitor_user
		
		twitter_user = twitterService.getUser("gencat")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: institutionsGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("parlament_cat")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: institutionsGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("DipuBcn")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: institutionsGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("barcelona_cat")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: institutionsGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("termcat")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: institutionsGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("dipta_cat")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: institutionsGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("diputaciogirona")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: institutionsGroup, followFollowers: true).save(flush: true)
		
		twitter_user = twitterService.getUser("paerialleida")
		monitor_user = new TwitterMonitorUser(user: twitter_user, group: institutionsGroup, followFollowers: true).save(flush: true)
		
	}
	
    def destroy = {
    }
	
}

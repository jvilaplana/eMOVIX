grails {
	mongo {
		//connectionString = "mongodb://emovix:em0v1x@localhost/emovix"
		host = "localhost"
		port = 27017
		//username = "admin"
		//password = "whyn0t"
		databaseName = "emovix"
	}
}
/*
environments {
	development {
	grails{
	mongo{
	host ="localhost"
	port ="27017"
	databaseName ="dev"
	}
	}
	
	}
	
	test {
	grails{
	mongo{
	host ="localhost"
	port ="27017"
	databaseName ="test"
	}
	}
	}
	}
	
	*/

dataSource {
    pooled = true
    jmxExport = true
    driverClassName = 'com.mysql.jdbc.Driver'
    url = 'jdbc:mysql://localhost:3306/emovix_project2?autoreconnect=true'
    username = "root"
    password = ""
}

hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
//    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
    cache.region.factory_class = 'org.hibernate.cache.ehcache.SingletonEhCacheRegionFactory' // Hibernate 4
    singleSession = true // configure OSIV singleSession mode
    flush.mode = 'manual' // OSIV session flush mode outside of transactional context
}

// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
        }
    }
    production {
		// https://devops.profitbricks.com/tutorials/install-mysql-on-centos-7/
		// http://tecadmin.net/steps-to-install-tomcat-server-on-centos-rhel/
        dataSource {
			dbCreate = "update"
			driverClassName = "com.myorg.jdbcDriverNotExists"
			url = "jdbc:mysql://localhost:3306/emovix?autoreconnect=true"
			username = "emovix"
			password = "em0v1x"
			
			//url = 'jdbc:mysql://localhost:3306/emovix_project?autoreconnect=true'
            //dbCreate = "update"
			//username = "bullying"
			//password = "cbully1"
			
            /*url = "jdbc:h2:prodDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
            properties {
               // See http://grails.org/doc/latest/guide/conf.html#dataSource for documentation
               jmxEnabled = true
               initialSize = 5
               maxActive = 50
               minIdle = 5
               maxIdle = 25
               maxWait = 10000
               maxAge = 10 * 60000
               timeBetweenEvictionRunsMillis = 5000
               minEvictableIdleTimeMillis = 60000
               validationQuery = "SELECT 1"
               validationQueryTimeout = 3
               validationInterval = 15000
               testOnBorrow = true
               testWhileIdle = true
               testOnReturn = false
               jdbcInterceptors = "ConnectionState"
               defaultTransactionIsolation = java.sql.Connection.TRANSACTION_READ_COMMITTED
            }
            */
        }
    }
}

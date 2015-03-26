import melistats.*

class BootStrap {

    def init = { servletContext ->

        def rol   = new Role(authority:'ROLE_USER').save(flush:true, failOnError: true)
        def test = new User(username:'test', password:'test').save(flush:true, failOnError: true)
        UserRole.create(test, rol, true)

    	def pref = [
    	new Preferencia(
    		 nombrePref : 'precio',
			 precioPref : 10,
			 envioPref  : 0,
			 reputacionPref : 0,

    		).save(flush:true,failOnError:true),
    	new Preferencia(
    		 nombrePref : 'rep',
			 precioPref : 0,
			 envioPref  : 0,
			 reputacionPref : 10,

    		).save(flush:true,failOnError:true),
    	new Preferencia(
    		 nombrePref : 'envio',
			 precioPref : 0,
			 envioPref  : 10,
			 reputacionPref : 0,

    		).save(flush:true,failOnError:true)]



    }
    def destroy = {
    }
}

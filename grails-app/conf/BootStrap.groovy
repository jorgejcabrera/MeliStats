import melistats.*

class BootStrap {

    def init = { servletContext ->

    	def pref = [
    	new Preferencia(
    		 nombrePref : 'test',
			 precioPref : 0,
			 envioPref  : 0,
			 reputacionPref : 0,

    		).save(flush:true,failOnError:true),
    	new Preferencia(
    		 nombrePref : 'hola',
			 precioPref : 0,
			 envioPref  : 0,
			 reputacionPref : 0,

    		).save(flush:true,failOnError:true),
    	new Preferencia(
    		 nombrePref : 'chau',
			 precioPref : 0,
			 envioPref  : 0,
			 reputacionPref : 0,

    		).save(flush:true,failOnError:true)]

    }
    def destroy = {
    }
}

package melistats

import grails.transaction.Transactional

@Transactional
class RegistrarService {

    def registrarUsuario(String user, String pass) {

    	try{


    		def usuario = new User(username:user, password:pass)
    		usuario.save(flush:true, failOnError: true)
        	UserRole.create(test, rol, true)

        	return [status: 'success']

    	}
    	catch(RuntimeException re)
    	{

    		return [status: 'failed']

    	}

    }
}

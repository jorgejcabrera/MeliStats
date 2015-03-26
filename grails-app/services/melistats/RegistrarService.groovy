package melistats

import grails.transaction.Transactional

@Transactional
class RegistrarService {

    def registrarUsuario(String user, String pass) {

    	try{

            Usuario.withTransaction{
    		
                def usuarioSpring = new User(username:user, password:pass)
        		usuarioSpring.save(flush:true, failOnError: true)
            	UserRole.create(usuarioSpring, Role.get(0), true)
                def usuarioPerfil = new Usuario(nombre:user, springUser:usuarioSpring)
                usuarioPerfil.save(flush: true, failOnError: true)
            }

        	return [status: 'success']

    	}
    	catch(RuntimeException re)
    	{

    		return [status: 'failed']

    	}

    }
}

package melistats

import grails.transaction.Transactional

@Transactional
class UsuarioService {

	def springSecurityService

    def usuarioActual() {

    	return Usuario.findBySpringUser(springSecurityService.currentUser)

    }
}

package melistats
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.*

@Secured(['permitAll'])
class RegistrarController {

	def registrarService

    def index() {}

    def registrarUsuario()
    {    	
<<<<<<< HEAD
    	flash.message = registrarService.registrarUsuario(params.nombre, params.cont, params.mail).status
    	redirect(action:"index")
=======
    	render registrarService.registrarUsuario(params.usuario, params.contrasenia,'asd') as JSON
>>>>>>> d3c9db6a539e815ba184a56e4f589b48e74a3d47
    }

}

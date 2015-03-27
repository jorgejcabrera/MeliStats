package melistats
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.*

@Secured(['permitAll'])
class RegistrarController {

	def registrarService

    def index() {}

    def registrarUsuario()
    {    	
    	flash.message = registrarService.registrarUsuario(params.nombre, params.cont, params.mail).status
    	redirect(action:"index")
    }

}

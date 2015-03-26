package melistats
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.*

@Secured(['permitAll'])
class RegistrarController {

	def registrarService

    def index() {}

    def registrarUsuario()
    {    	
    	render registrarService.registrarUsuario(params.usuario, params.contrasenia) as JSON
    }

}

package melistats

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.*

@Secured(['ROLE_USER'])
class BusquedaController {

	def busquedaService
    def usuarioService

    def index() { 

    	[preferencias:usuarioService.usuarioActual().preferencias]

    }

    def buscar()
    {
    	render busquedaService.buscar(params) as JSON
    }

}

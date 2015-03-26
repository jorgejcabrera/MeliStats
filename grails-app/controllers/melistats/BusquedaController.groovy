package melistats

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.*

@Secured(['permitAll'])
class BusquedaController {

	def busquedaService

    def index() { 

    	//leer el usuario cuando este configurado SpringSecurity,
    	//de ahi conseguir las preferencias.
    	[preferencias:Preferencia.list()]

    }

    def buscar()
    {
    	render busquedaService.buscar(params) as JSON
    }

}

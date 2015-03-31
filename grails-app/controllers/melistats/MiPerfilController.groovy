package melistats
import grails.plugin.springsecurity.annotation.*

@Secured(['ROLE_USER'])
class MiPerfilController {

	def usuarioService
	def preferenciaService
	def busquedaService

    def nuevaPref(){

    	flash.message = preferenciaService.nuevaPreferencia(params)
    	redirect(action: 'index')
	}

	def eliminarPref(){
		
		preferenciaService.eliminarPreferencia(params.idPreferencia)
		redirect(action: 'index')

	}


	def guardarCambiosPref(){
		
		preferenciaService.editarPreferencia(params)
		redirect(action:'index')
	}

	def eliminarBusq(){

		busquedaService.eliminarBusqueda(params.idBusqueda)
		redirect(action: 'index')

	}


    def index() {

    	[preferencias: preferenciaService.preferenciasOrdenadas(), busquedas: busquedaService.busquedasOrdenadas() ]
    
    }


}



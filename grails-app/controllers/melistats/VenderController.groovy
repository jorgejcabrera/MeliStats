package melistats
import grails.plugin.springsecurity.annotation.*
import grails.converters.JSON

@Secured(['ROLE_USER'])
class VenderController {


	def busquedaService
	def envioMailService
    def index() {}

	def posiblesCompradores(){
		def busqueda = params.busqueda
		def listaCompradores = busquedaService.posiblesCompradoresVender(busqueda)
		def result = [
			compradores: listaCompradores,
			busqueda: busqueda,
		]
		render result as JSON

	}

	def enviarMail(){
		//try
		def mail = params.mailComprador
		def producto = params.mailProducto
		envioMailService.enviarMail(mail, producto)
		flash.message="success"
		redirect(action:'index')
	}
}

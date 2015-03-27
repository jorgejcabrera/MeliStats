package melistats
import grails.plugin.springsecurity.annotation.*
import grails.converters.JSON

@Secured(['ROLE_USER'])
class VenderController {


	def busquedaService
	def envioMailService
    def index() {
		def unString = "hola"
		def listaEmpleados = ['jorge','ken','candelaria','guido']
		[unString:unString,listaEmpleados:listaEmpleados]
	}

	def posiblesCompradores(){
		def busqueda = params.nombreBusqueda
		def listaCompradores = busquedaService.posiblesCompradoresVender(busqueda)

		def result = [
			compradores: listaCompradores,
			busqueda: busqueda,
		]
		render result as JSON

	}

	def enviarMail(){
		def mail = params.mailComprador
		def producto = params.nombreProducto
		envioMailService.enviarMail(mail, producto)
	}
}

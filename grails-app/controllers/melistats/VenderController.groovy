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
		println params.busqueda
		def busqueda = params.busqueda

		def listaCompradores = busquedaService.posiblesCompradoresVender(busqueda)
		println listaCompradores

		def result = [
			compradores: listaCompradores,
			busqueda: busqueda,
		]
		render result as JSON

	}

	def enviarMail(){
		def mail = params.mailComprador
		def producto = params.mailProducto
		envioMailService.enviarMail(mail, producto)
	}
}

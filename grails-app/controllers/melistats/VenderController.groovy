package melistats
import grails.plugin.springsecurity.annotation.*

@Secured(['permitAll'])
class VenderController {

    def index() {
		def unString = "hola"
		def listaEmpleados = ['jorge','ken','candelaria','guido']
		[unString:unString,listaEmpleados:listaEmpleados]
	}
}

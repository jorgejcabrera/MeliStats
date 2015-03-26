package melistats
import grails.plugin.springsecurity.annotation.*

@Secured(['ROLE_USER'])
class VenderController {

    def index() {
		def unString = "hola"
		def listaEmpleados = ['jorge','ken','candelaria','guido']
		[unString:unString,listaEmpleados:listaEmpleados]
	}
}

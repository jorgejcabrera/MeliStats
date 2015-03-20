package melistats

class VenderController {

    def index() {
		def unString = "hola"
		def listaEmpleados = ['jorge','ken','candelaria','guido']
		[unString:unString,listaEmpleados:listaEmpleados]
	}
}

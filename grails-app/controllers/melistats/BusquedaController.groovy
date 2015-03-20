package melistats

class BusquedaController {

    def index() { 

    	[preferencias:Preferencia.list()]

    }

    def buscar()
    {

    	println params.busqueda + " " + params.preferencia

    }

}

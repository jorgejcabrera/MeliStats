package melistats

class BusquedaController {

    def index() { 

    	//leer el usuario cuando este configurado SpringSecurity,
    	//de ahi conseguir las preferencias.
    	[preferencias:Preferencia.list()]

    }

    def buscar()
    {
    }

}

package melistats

class MiPerfilController {

    def index() {
    	[preferencias:Preferencia.list()]
     }
}



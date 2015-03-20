package melistats

class PreferenciaController {

    def index() {
    	def pref1= new Preferencia(nombrePref:"electronica", precioPref:"50 pesos", envioPref:"Envio gratis", reputacionPref:"buena")
    	[preferencias:pref1] //[preferencias:Preferencia.list()]
    }
}


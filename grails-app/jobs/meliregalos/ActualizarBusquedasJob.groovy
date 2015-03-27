package meliregalos

class ActualizarBusquedasJob {

	def busquedaService

    static triggers = {
      simple repeatInterval: 60000l 
    }

    def execute() {
        // execute job
        busquedaService.actualizarBusquedas()
    }
}

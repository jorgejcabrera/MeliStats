package meliregalos

class ActualizarBusquedasJob {

	def busquedaService

    static triggers = {
      simple repeatInterval: 5000l // execute job once in 5 seconds
    }

    def execute() {
        // execute job
        busquedaService.actualizarBusquedas()
    }
}

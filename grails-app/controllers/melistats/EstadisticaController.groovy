package melistats

class EstadisticaController {

    def index(String busqueda) {
    	def busq = Busqueda.findByDescripcion("ipod")
    	def muestras = busq.getMuestras()
    	[muestras:muestras, nombreBusq:busq.getDescripcion()]
    }
}

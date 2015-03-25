package melistats

class EstadisticaController {

    def index(String busqueda) {
    	def busq = Busqueda.findByDescripcion(busqueda)
    	def muestras = busq.getMuestras()
    	muestras.sort{a,b -> a.fechaDeMuestra <=> b.fechaDeMuestra}
    	[muestras:muestras, nombreBusq:busq.getDescripcion()]
    }
}

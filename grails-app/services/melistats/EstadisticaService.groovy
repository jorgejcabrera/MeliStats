package melistats

import grails.transaction.Transactional

@Transactional
class EstadisticaService {

    def contenidoGraficos(String busqueda){
    	def busq = Busqueda.findByDescripcion(busqueda)
    	def muestras = busq.getMuestras()
    	return muestras.sort{a,b -> a.fechaDeMuestra <=> b.fechaDeMuestra}
    }
}

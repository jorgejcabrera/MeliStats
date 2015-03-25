package melistats

class EstadisticaController {

    def index(String busqueda) {
    	def busq = Busqueda.findByDescripcion(busqueda)
    	def muestras = busq.getMuestras()
    	muestras.sort{a,b -> a.fechaDeMuestra <=> b.fechaDeMuestra}


    	/*
    		['Mes de Muestra', 'Promedio de ventas', 'Precio Máximo'],
          	['2004',  1000,      400],
          	['2005',  1170,      460],
          	['2006',  660,       1120],
          	['2007',  1030,      540]
    	*/
    	[muestras:muestras, nombreBusq:busq.getDescripcion(), rectas: rectas]
    }
}

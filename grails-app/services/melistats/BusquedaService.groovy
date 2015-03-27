package melistats

import grails.transaction.Transactional
import groovy.json.JsonSlurper

import java.util.Date;
import java.util.List;

@Transactional
class BusquedaService {

	def endpointItems = 'https://api.mercadolibre.com/sites/MLA/search?limit=50&q='
	def slurper = new JsonSlurper()
    def muestraService
    def preferenciaService
    def usuarioService

	
	
    def getDatos(nombreBusqueda)
    {
        nombreBusqueda = nombreBusqueda.replaceAll(' ','%20')
        
    	def urlBusqueda = new URL(endpointItems+nombreBusqueda)
    	
    	def resultados = slurper.parse(urlBusqueda, requestProperties: [Accept:'application/json'])
    	
    	return resultados
    }

    /*
    * Recibe en params: 
    * textoBusuqeda, la consulta de busqueda
    * preferencia, la id de la preferencia seleccionada (o null si no se eligio)
    * guardarBusqueda, puede valer 'true' o 'false' e indica si guardar la busqueda
    * en el perfil del usuario
    */
    def buscar(params)
    {   	

        def consulta = params.textoBusqueda
        def datos = getDatos(consulta) // se queda con solo los productos

        // si el API no tiene resultados para la buqueda, devolver como estado 'no_results'
        if(datos.results == [] || datos == null )
        {
            return [status: 'no_results']
        }


        //si la busqueda ya existe se lee la previamente creada, de lo contrario se crea
        def busqueda = Busqueda.findByDescripcion(consulta)?: new Busqueda(descripcion: consulta, fechaInicioBusqueda: new Date()).save(flush:true)
        
        //si la busqueda se debe guardar en el perfil, 
        //se busca si existe ya en este usuario. Si existe, no se hace nada; de lo contrario
        //se guarda en el usuario actual.
        if(params.guardarBusqueda == "true")
        {
            guardarBusqueda(busqueda)            
        }

        //si no hay muestras muestraSerice.agregarMuestra() crea una, la agrega a la busqueda y la devuelve
        //si no lee la ultima
        def  muestra = busqueda.getUltimaMuestra()?: muestraService.agregarMuestra(busqueda, datos)       
       

        //agregar mejores resultados segun preferencia
        def prefId = params.preferencia
        def mejoresResultados = mejoresResultados(datos.results, muestra, prefId)       

    	return [status: 'success', muestra: muestra, mejoresResultados: mejoresResultados]

    }

    def guardarBusqueda(busqueda)
    {
        def actual = usuarioService.usuarioActual()
            
        actual.busquedas.find{it == busqueda}?: actual.addToBusquedas(busqueda)
        actual.save(flush:true, failOnError: true)
    }

    def mejoresResultados(productos, muestra, prefId)
    {
        if(prefId != 'null')
        {
            def preferencia = Preferencia.get(prefId)
            return preferenciaService.mejoresResultados(productos, muestra, preferencia)
        }
        else
        {
            return productos[0..4]
        }
    }

	def actualizarBusquedas()
	{
		for(busqueda in Busqueda.list())
		{
			def datos = getDatos(busqueda.descripcion)
			if( datos != null && datos.results != [])
			{
				muestraService.agregarMuestra(busqueda,datos)
			}
		}
	}

	def getUltimasRealizadas(){
		Date fechaActual = new Date()
		Date fechaReferencia = new Date()
		fechaReferencia.set(year: fechaActual.getAt(Calendar.YEAR), month: fechaActual.getAt(Calendar.MONTH), date: fechaActual.getAt(Calendar.DAY_OF_MONTH)-5)
		def ultimasBusquedasRealizadas = Busqueda.findAllByFechaInicioBusquedaBetween(fechaReferencia,fechaActual,[max: 3, sort: "fechaInicioBusqueda", order: "desc", offset: 0])
		return ultimasBusquedasRealizadas
	}

    def posiblesCompradoresVender(String busqueda){
        def busquedaU = busqueda
        def listaCompradores = Usuario.list().find{
            (it.busquedas.descripcion==busquedaU)
        }
        return listaCompradores
    }

}

package melistats

import grails.transaction.Transactional
import groovy.json.JsonSlurper

@Transactional
class BusquedaService {

	def endpointItems = 'https://api.mercadolibre.com/sites/MLA/search?limit=50&q='
	def slurper = new JsonSlurper()
    def muestraService
    def preferenciaService

    def getDatos(nombreBusqueda)
    {
        nombreBusqueda = nombreBusqueda.replaceAll(' ','%20')
        
    	def urlBusqueda = new URL(endpointItems+nombreBusqueda)
    	
    	def resultados = slurper.parse(urlBusqueda, requestProperties: [Accept:'application/json'])
    	
    	return resultados
    }

    def buscar(params)
    {
    	/*
    	-Precio promedio
    	-porcentaje con envio gratis y sin etc
    	- '' con mercado pago
    	-porcentaje de las ventas de los tipos de usuario(bronze, plata, oro, etc)
    	-porcentaje de ventas promedio por publicacion
    	*/

        def consulta = params.textoBusqueda
        def datos = getDatos(consulta)

        if(datos.results == [] || datos == null )
        {
            return [status: 'no_results']
        }


        //si la busqueda ya existe se lee la previamente creada
        def busqueda = Busqueda.findByDescripcion(consulta)?: new Busqueda(descripcion: consulta, fechaInicioBusqueda: new Date()).save(flush:true)
        

        if(params.guardarBusqueda == 'on')
        {
            //guardar la busqueda en el usuario actual
        }

        //si no hay muestras muestraSerice.agregarMuestra() crea una, la agrega a la busqueda y la devuelve
        def  muestra = busqueda.getUltimaMuestra()?: muestraService.agregarMuestra(busqueda, datos)       
       

        //agregar mejores resultados segun preferencia
        def mejoresResultados, pref = params.preferencia

        if(pref != 'null')
        {
            mejoresResultados = preferenciaService.mejoresResultados(datos.results, muestra, Preferencia.get(pref) )
        }
        else
        {
            mejoresResultados = datos.results[0..4]
        }

        if(params.checkout == 'on')
        {
            //usuario actual agregar a busqueda
        }

    	return [status: 'success', muestra: muestra, mejoresResultados: mejoresResultados]

    }

    def actualizarBusquedas()
    {
        for(busqueda in Busqueda.list())
        {
            def datos = getDatos(busqueda.descripcion)
            if( datos != null && datos.results != [] )
            {
                muestraService.agregarMuestra(busqueda,datos)
            }
        }
    }

}

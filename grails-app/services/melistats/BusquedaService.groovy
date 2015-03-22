package melistats

import grails.transaction.Transactional
import groovy.json.JsonSlurper

@Transactional
class BusquedaService {

	def endpointItems = 'https://api.mercadolibre.com/sites/MLA/search?limit=50&q='
	def slurper = new JsonSlurper()
    def muestraService

    def serviceMethod() {

    }

    def getDatos(nombreBusqueda)
    {
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

    	return [status: 'success', muestra: muestra]

    }

}

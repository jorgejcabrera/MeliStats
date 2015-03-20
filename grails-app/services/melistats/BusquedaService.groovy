package melistats

import grails.transaction.Transactional
import groovy.json.JsonSlurper

@Transactional
class BusquedaService {

	def endpointItems = 'https://api.mercadolibre.com/sites/MLA/search?q='
	def slurper = new JsonSlurper()

    def serviceMethod() {

    }

    def getProductos(nombreBusqueda)
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

    	def productos = getProductos(params.textoBusqueda)
    	
    	//placeholder
    	return [test:'test']

    }

}

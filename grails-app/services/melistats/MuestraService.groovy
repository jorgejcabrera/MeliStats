package melistats

import grails.transaction.Transactional

@Transactional
class MuestraService {

    def serviceMethod() {

    }

    def agregarMuestra(busqueda, datos)
    {

    	def productos = datos.results
    	def precios = productos.price.findAll{it != null}


    	def precioPromedio = precios.sum()  / precios.size()
    	def precioMax = precios.max()
    	def precioMin = precios.min()

    	def procentajeEnvioGratis = procentajeEnvioGratis(productos)
    	def ventasPorTipoVendedor = ventasPorRango(productos)
    	def ventasPromedio = ventasPromedio(productos)
    	print ventasPorTipoVendedor.values().class.name
		def muestra = new Muestra(
					fechaDeMuestra: new Date(), 
					precioPromedio: precioPromedio,
					precioMax: precioMax,
					precioMin: precioMin,
					procentajeEnvioGratis: procentajeEnvioGratis,
					ventasPorTipoVendedor: ventasPorTipoVendedor,
					ventasPromedio: ventasPromedio,
					busqueda: busqueda
					).save(flush: true, failOnError: true) 	

		busqueda.addToMuestras(muestra)
			
		return muestra

    }
  

    def procentajeEnvioGratis(productos)
    {
    	def prodEnvioGratis = productos.findAll{it.shipping.free_shipping}.size()
    	return prodEnvioGratis / productos.size() * 100
    }

    def ventasPorRango(productos)
    {
    	def ventasPorRango = [:]
    	for(item in productos)
    	{
    		def status = item.seller.power_seller_status
    		if(status != null)
    		{
    			ventasPorRango.put(status,Integer.toString(item.sold_quantity))
    		}
    	}

    	return ventasPorRango
    }

    def ventasPromedio(productos)
    {
    	return productos.collect{it.sold_quantity}.sum() / productos.size()
    }
   
}

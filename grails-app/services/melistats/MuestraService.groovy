package melistats

import grails.transaction.Transactional

@Transactional
class MuestraService {

    def agregarMuestra(busqueda, datos)
    {

    	def productos = datos.results
		def imagen = productos[1].thumbnail
    	def precios = productos.price.findAll{it != null}


    	def precioPromedio = precios.sum()  / precios.size()
    	def precioMax = precios.max()
    	def precioMin = precios.min()

    	def porcentajeEnvioGratis = porcentajeEnvioGratis(productos)
    	def ventasPorTipoVendedor = ventasPorRango(productos)
    	def ventasPromedio = ventasPromedio(productos)
    	
		def muestra = new Muestra(
					imagen: imagen,
					fechaDeMuestra: new Date(), 
					precioPromedio: precioPromedio,
					precioMax: precioMax,
					precioMin: precioMin,
					porcentajeEnvioGratis: porcentajeEnvioGratis,
					ventasPorTipoVendedor: ventasPorTipoVendedor,
					ventasPromedio: ventasPromedio,
					busqueda: busqueda
					).save(flush: true, failOnError: true) 	

		busqueda.addToMuestras(muestra)

		return muestra

    }
  

    def porcentajeEnvioGratis(productos)
    {
    	def prodEnvioGratis = productos.findAll{it.shipping.free_shipping}.size()
    	return ( (float)prodEnvioGratis / (float)productos.size() ) * 100f
    }

    def ventasPorRango(productos)
    {
    	def ventasPorRango = [:]
    	for(item in productos)
    	{
    		def status = item.seller.power_seller_status
    		if(status != null)
    		{
                if(ventasPorRango[status] == null)
                {
                    ventasPorRango.put(status,Integer.toString(item.sold_quantity))
                }
                else
                {
                    def ventasHastaAhora = Integer.parseInt(ventasPorRango.get(status))
                    ventasPorRango[status] = Integer.toString(item.sold_quantity + ventasHastaAhora)
                }
    			
    		}
    	}

    	return ventasPorRango
    }

    def ventasPromedio(productos)
    {
    	return productos.collect{it.sold_quantity}.sum() / productos.size()
    }
   
}

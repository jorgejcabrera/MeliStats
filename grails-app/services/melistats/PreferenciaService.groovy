package melistats

import grails.transaction.Transactional

@Transactional
class PreferenciaService {

    def usuarioService

	def mejoresResultados(productos, muestra, preferencia)
	{
       def ordenadosPorPreferencia = productos.sort{ puntaje(it, muestra, preferencia) }
       ordenadosPorPreferencia = ordenadosPorPreferencia.findAll{
                                    preferencia.condicionPref == 'any' ||
                                    it.condition == condidcionAEstado(preferencia.condicionPref) 
                                }
       def tamanio = ordenadosPorPreferencia.size()
       return ordenadosPorPreferencia[tamanio-5..tamanio-1] 
	} 

    def puntaje(producto, muestra, preferencia) {
        
    	if(preferencia == null)
    	{
    		return 0	
    	}

    	def envio = producto.shipping.free_shipping ? 1 : 0
    	envio *= preferencia.envioPref

    	def reputacion = puntajeTipoVendedor(producto.seller.power_seller_status)
    	reputacion *= preferencia.reputacionPref

    	float precio = 1 - ( (float)producto.price / (float) muestra.precioPromedio)
    	precio *= preferencia.precioPref

    	def puntaje =  envio + reputacion + precio 

    	return puntaje

    }

    def puntajeTipoVendedor(tipo)
    {

    	def puntaje

    	switch(tipo) {
    		case 'platinum':
    			puntaje =  10
    			break
    		case 'gold':
    			puntaje =  5
    			break
    		case 'silver':
    			puntaje =  3
    			break
    		default:
    			puntaje = 0
    	}

    	return puntaje

    }

    def condidcionAEstado(condicion)
    {
        
        if(condicion<4)
        {
            return 'used'
        }
        else if(condicion<7)
        {
            return 'any'
        }
        else 
        {
            return 'new'
        }

    }

    def preferenciasOrdenadas()
    {
        return usuarioService.usuarioActual().preferencias.sort{it.id}.reverse(true)
    }

    def nuevaPreferencia(mapaPreferencias){

        def actual = usuarioService.usuarioActual()

        if( actual.preferencias.find{it.nombrePref == mapaPreferencias.nombrePref} == null )
        {
            Preferencia p = new Preferencia(mapaPreferencias)
            p.save(failOnError:true)

            actual.addToPreferencias(p)
            actual.save(flush: true, failOnError: true)

            return "success"

        }
        else
        {
            return "error"
        }

    }

    def eliminarPreferencia(id){

        def pref = Preferencia.get(id as long)
        usuarioService.usuarioActual().removeFromPreferencias(pref)
        usuarioService.usuarioActual().save(flush:true)
        pref.delete(flush:true, failOnError:true)

    }


    def editarPreferencia(datos){

        def pref = Preferencia.get(datos.idPreferencia as long)

        pref.precioPref = Integer.parseInt(datos.precioPref)
        pref.envioPref = Integer.parseInt(datos.envioPref)
        pref.reputacionPref = Integer.parseInt(datos.reputacionPref)
        pref.condicionPref = Integer.parseInt(datos.condicionPref)

        pref.save(flush:true, failOnError:true)

    }    

}

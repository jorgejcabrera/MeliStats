package melistats

import java.util.Date;

class Muestra {
	
	String imagen
	Date fechaDeMuestra
	float precioPromedio
	float precioMax
	float precioMin
	float porcentajeEnvioGratis
	Map<String,String> ventasPorTipoVendedor
	float   ventasPromedio
	
	static constraints = {
	}

	static belongsTo = [busqueda:Busqueda]

}

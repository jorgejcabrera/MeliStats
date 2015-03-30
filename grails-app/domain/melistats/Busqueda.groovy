package melistats

class Busqueda {
	
	String descripcion
	Date fechaInicioBusqueda
	int frecuencia = 0
	
	static hasMany = [muestras: Muestra]
	
	static constraints = {
		descripcion unique: true
	}

	def getImagen(){
		muestras.last().imagen
	}
	
	def getUltimaMuestra(){
		if(muestras == null || muestras.size() == 0){
			return null
		}

		//devuelve la muestra mas reciente
		//se podria actualizar si esta ultima fuese muy vieja
		return muestras.last()
	}

	def getDescripcion()
	{
		return descripcion.capitalize()
	}

}

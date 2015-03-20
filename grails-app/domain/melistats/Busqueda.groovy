package melistats

class Busqueda {
	String descripcion
	static hasMany = [muestras: Muestra]
	static constraints = {
	}
}

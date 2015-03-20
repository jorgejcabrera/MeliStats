package melistats

class Busqueda {
	String descripcion
	Date fechaBusqueda
	static hasMany = [muestras: Muestra]
	static constraints = {
	}
}

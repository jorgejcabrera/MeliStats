package melistats

class Busqueda {
	String descripcion
	Date fechaInicioBusqueda
	static hasMany = [muestras: Muestra]
	static constraints = {
	}
}

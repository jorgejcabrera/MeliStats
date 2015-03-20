package melistats

class Usuario {
	String nombre
	String nombreUsuario
	static hasMany = [busquedas:Busqueda,preferencias:Preferencia]
	static constraints = { busquedas nullable: true;
		preferencias nullable: true
	}
}

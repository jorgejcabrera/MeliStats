package melistats

class Usuario {

	String nombre

	static hasMany = [busquedas:Busqueda,preferencias:Preferencia]
	static constraints = { busquedas nullable: true
		preferencias nullable: true
	}

	static belongsTo = [springUser:User]
}

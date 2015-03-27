import melistats.*

class BootStrap {

    def init = { servletContext ->
		Date fechaActual = new Date()
		Date fechaReferencia = new Date()
		Date otraFecha = new Date()
		def anio = fechaActual.getAt(Calendar.YEAR)
		def mes = fechaActual.getAt(Calendar.MONTH)
		def dia = fechaActual.getAt(Calendar.DAY_OF_MONTH)
		fechaReferencia.set(year: anio, month: mes, date: dia-1)
		otraFecha.set(year: anio, month: mes, date: dia-2)
		def unaBusqueda = new Busqueda(descripcion:"unaBusqueda",fechaInicioBusqueda:fechaReferencia).save(flush:true, failOnError: true)
		def otraBusqueda = new Busqueda(descripcion:"otraBusqueda",fechaInicioBusqueda:otraFecha).save(flush:true, failOnError: true)
		def rol   = new Role(authority:'ROLE_USER').save(flush:true, failOnError: true)
        
    }
    def destroy = {
    }
}

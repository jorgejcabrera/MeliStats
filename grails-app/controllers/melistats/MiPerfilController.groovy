package melistats
import grails.plugin.springsecurity.annotation.*

@Secured(['ROLE_USER'])
class MiPerfilController {

	def usuarioService

    def nuevaPref(){
     	if(Preferencia.findByNombrePref(params.nombrePref)==null){
     		def nombre = params.nombrePref
     		def precio = params.precioPref
     		def envio = params.envioPref
     		def reputacion = params.reputacionPref

     		Preferencia p1 = new Preferencia(nombrePref: nombre, precioPref: precio, envioPref: envio, reputacionPref: reputacion);
     		p1.save(failOnError:true)

     		def actual = usuarioService.usuarioActual()
     		actual.addToPreferencias(p1)
     		actual.save(flush: true, failOnError: true)

     		flash.message = "success"
     		redirect(action: 'index')
     	}else{
			flash.message = "error"
			redirect(action:'index')
		}
	}

	def eliminarPref(){
		def idPreferencia = params.idPreferencia
		def pref = Preferencia.get(idPreferencia as long)
		usuarioService.usuarioActual().removeFromPreferencias(pref)
		usuarioService.usuarioActual().save(flush:true)
		pref.delete(flush:true, failOnError:true)
		redirect(action:'index')

	}


	def guardarCambiosPref(){
		def idPreferencia = params.idPreferencia
		def pref = Preferencia.get(idPreferencia as long)
		pref.precioPref = Integer.parseInt(params.precioPref)
		pref.envioPref = Integer.parseInt(params.envioPref)
		pref.reputacionPref = Integer.parseInt(params.reputacionPref)
		pref.save(flush:true, failOnError:true)
		redirect(action:'index')
	}


    def index() {
    	[preferencias:usuarioService.usuarioActual().preferencias]
    }


}



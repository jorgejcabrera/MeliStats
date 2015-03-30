package melistats

import grails.transaction.Transactional

@Transactional
class EnvioMailService {

	def usuarioService
    def enviar(def mail, def producto) {
    	sendMail {
			to mailUser
			subject "MeliStats - Vendedor por publicar "+producto+''
			body 'El usuario '+usuarioService.usuarioActual().nombre+' está por publicar el producto '+producto+'. Para contactarlo, debe mandarle un mail a: '+usuarioService.usuarioActual().mail+'.'
	  }

    }
}

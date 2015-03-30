package melistats

import grails.transaction.Transactional

@Transactional
class EnvioMailService {

	def usuarioService
    def enviarMail(mail, producto) {
    	sendMail {
			to mail
			subject "MeliStats - Vendedor por publicar \""+producto+'\"'
			body 'El usuario \"'+usuarioService.usuarioActual().nombre+'\" está por publicar el producto \"'+producto+'\".'
	  }

    }
}

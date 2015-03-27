package melistats

import grails.transaction.Transactional

@Transactional
class EnvioMailService {

    def enviar() {


    	sendMail {
			to 
			subject "MeliStats - Vendedor por publicar "++''
			body 'El usuario '++'está por publicar el producto '++'. Para contactarlo, debe mandarle un mail a: '++'.'
	  }

    }
}

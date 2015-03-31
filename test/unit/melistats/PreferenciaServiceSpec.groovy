package melistats

import melistats.*
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(PreferenciaService)
class PreferenciaServiceSpec extends Specification {

    def setup() {
    	def nuevaPref = new Preferencia(nombrePref:"hola", precioPref:10, envioPref:30, reputacionPref:15, condicionPref:25)
    	mockDomain(Preferencia, [Preferencia])
    }

    def cleanup() {
    }


    void "Las prefencias se editan correctamente"() {
		given:
			def nombrePref = "NewName"
			def precioPref = "30"
			def envioPref = "40"
			def reputacionPref = "35"
			def condicionPref = "45"
			def idPreferencia = 0
			def datos = [nombrePref:nombrePref, precioPref:precioPref, envioPref:envioPref, reputacionPref:reputacionPref, condicionPref:condicionPref, idPreferencia: idPreferencia]
		
		when:
			def result = service.editarPreferencia(datos)
		
		then:
			result.nombrePref == "NewName"
			result.precioPref == 30
			result.envioPref == 40
			result.reputacionPref == 35
			result.condicionPref == 45
	}
}

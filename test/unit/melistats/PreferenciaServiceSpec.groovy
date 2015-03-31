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
    	mockDomain(Preferencia, [nuevaPref])
    }

    def cleanup() {
    }


    void "Las prefencias se editan correctamente"() {
		given:
			def nombrePref = "hola"
			def precioPref = "30"
			def envioPref = "40"
			def reputacionPref = "35"
			def condicionPref = "45"
			def id = 1
			def datos = [nombrePref:nombrePref, precioPref:precioPref, envioPref:envioPref, reputacionPref:reputacionPref, condicionPref:condicionPref, idPreferencia: id]
		
		when:
			def result = service.editarPreferencia(datos)
		
		then:
			assert result.nombrePref == "hola"
			assert result.precioPref == 30
			assert result.envioPref == 40
			assert result.reputacionPref == 35
			assert result.condicionPref == 45
	}

	void "Las preferencias se borran correctamente"() {
		given:
			def id = 1
			def usuarioServiceMock = [usuarioActual:{[save:{a -> true}, removeFromPreferencias: {a -> true}]}]
			service.usuarioService = usuarioServiceMock

		when:
			service.eliminarPreferencia(id)

		then:
			assert Preferencia.list() == []
	}
}

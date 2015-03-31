package melistats

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(BusquedaService)
class BusquedaServiceSpec extends Specification {

    def setup() {

    }

    def cleanup() {
    }

    void "El servicio se conecta con la API"() {
        given:

            String query = 'ipod'
        when:

            def resultados = service.getDatos(query)
        then:
            assert resultados != null
    }

    void "El servicio devuelve las busquedas ordenadas por mas reciente correctamente"()
    {
        given:

            mockDomain(Muestra, [])
            def busquedas = [
                    new Busqueda(descripcion: 'primera', fechaInicioBusqueda: new Date(), muestras: []),
                    new Busqueda(descripcion: 'segunda', fechaInicioBusqueda: new Date(), muestras: []),
                    new Busqueda(descripcion: 'tercera', fechaInicioBusqueda: new Date(), muestras: []),
            ]
            mockDomain(Busqueda, busquedas)
            def usuarioServiceMock = [ usuarioActual : {[busquedas: Busqueda.list()]} ]
            service.usuarioService = usuarioServiceMock

        when:
            def busquedasOrdenadas = service.busquedasOrdenadas() 

        then:
            assert busquedasOrdenadas == busquedas.reverse()        

    }

}

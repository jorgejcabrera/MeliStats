package melistats

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(MuestraService)
class MuestraServiceSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "El servicio devuelve una muestra con datos coherentes"()
    {
        given:
            
            def mockJSON = [

                            results: [

                                [                                 
                                  "seller": [power_seller_status: 'platinum'],
                                  "price": 4000,
                                  "available_quantity": 1,
                                  "sold_quantity": 1,
                                  condition: "new",                                  
                                  thumbnail: "a",
                                  accepts_mercadopago: true,
                                  shipping: [free_shipping: false, mode: 'not_specified']            
                                  
                                ],

                                [                                  
                                  "seller": [power_seller_status: 'silver'],
                                  "price": 2000,
                                  "available_quantity": 1,
                                  "sold_quantity": 3,
                                  condition: "new",
                                  thumbnail: "b",
                                  accepts_mercadopago: true,
                                  shipping: [free_shipping: false, mode: 'not_specified']
                                  
                                  
                                ],

                                [                                  
                                  "seller": [power_seller_status: 'gold'],
                                  "price": 3,
                                  "available_quantity": 4,
                                  "sold_quantity": 2,                                  
                                  condition: "new",
                                  thumbnail: "c",
                                  accepts_mercadopago: true,
                                  shipping: [free_shipping: true, mode: 'not_specified']                                  
                                  
                                ],

                                [                                  
                                  "seller": [power_seller_status: 'platinum'],
                                  "price": 2001,
                                  "available_quantity": 4,
                                  "sold_quantity": 32,                                  
                                  condition: "new",
                                  thumbnail: "c",
                                  accepts_mercadopago: true,
                                  shipping: [free_shipping: true, mode: 'not_specified']                                  
                                  
                                ]

                            ]            
                        ]

             
            mockDomain(Muestra, [])        
            def mockBusqueda = [addToMuestras: {muestra -> true}]
            
            def assertVentasPorTipo = [:]
            assertVentasPorTipo.put('platinum','33')
            assertVentasPorTipo.put('silver','3')
            assertVentasPorTipo.put('gold','2')

        when:
            def resultado = service.agregarMuestra(mockBusqueda, mockJSON)
        then:
            assert resultado.precioPromedio == 2001
            assert resultado.precioMax == 4000
            assert resultado.precioMin == 3

            //puntos flotantes no precisos, se truncan los valores a 2 decimales.
            //Ademas por algun motivo trunc(2) de procentajeEnvio devuelve Float,
            //pero trunc(2) de la divison y multiplicacion de floats devuelve Double; por eso el casteo.
            assert resultado.porcentajeEnvioGratis.trunc(2) ==  (float) ( (2f/4f) * 100f ).trunc(2)
    
    		//mismas consideraciones que antes
    		assert resultado.ventasPromedio.trunc(2) == (float) ( (38f/4f) ).trunc(2)

    		assert resultado.ventasPorTipoVendedor == assertVentasPorTipo

    }
}

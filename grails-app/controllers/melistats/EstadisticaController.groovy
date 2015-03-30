package melistats
import grails.plugin.springsecurity.annotation.*

@Secured(['permitAll'])
class EstadisticaController {

    def estadisticaService

    def index(String busqueda) {
      def muestras = estadisticaService.contenidoGraficos(busqueda)
      def busq=Busqueda.findByDescripcion(busqueda)
      def tamanioMuestras = muestras.size()
      def muestrasNuevas=[];
      if(tamanioMuestras<=10){
        for(int i=0; i<tamanioMuestras; i++){
          muestrasNuevas = muestrasNuevas + muestras[i]
          }
        } else if(tamanioMuestras<=20){

          for(int i=0; i<tamanioMuestras; i++){
            if(i%2==0){
              muestrasNuevas = muestrasNuevas + muestras[i]
              }
            }

          } else if(tamanioMuestras<=50){

                for(int i=0; i<tamanioMuestras; i++){
                  if(i%5==0){
                    muestrasNuevas = muestrasNuevas + muestras[i]
                    }
                  }

                } else if(tamanioMuestras<=100){

                  for(int i=0; i<tamanioMuestras; i++){
                    if(i%10==0){
                      muestrasNuevas = muestrasNuevas + muestras[i]
                      }
                    }

                  } else {
                    for(int i=0; i<tamanioMuestras; i++){
                      if(i%10==0){
                        muestrasNuevas = muestrasNuevas + muestras[i]
                      }
                    }
                  }
    	[muestras:muestrasNuevas, nombreBusq:busq.getDescripcion()]

    }
}

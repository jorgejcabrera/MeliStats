package melistats
import grails.plugin.springsecurity.annotation.*

@Secured(['permitAll'])
class PrincipalController {
	def busquedaService;
    def index() {
		def busquedasMasRecientes = busquedaService.getUltimasRealizadas()
		//def busquedasMasRealizadas = busquedaService.getMasPopulares();
		[busquedasMasRecientes:busquedasMasRecientes/*,busquedasMasRealizadas:busquedasMasRealizadas*/]
	}
}

package melistats
import grails.plugin.springsecurity.annotation.*

@Secured(['permitAll'])
class PrincipalController {
	def busquedaService;
    def index() {
		def busquedasMasRecientes = busquedaService.getUltimasRealizadas()
		//def busquedasMasRealizadas = busquedaService.getMasRealizadas()
		[busquedasMasRecientes:busquedasMasRecientes/*,busquedasMasRealizadas:busquedasMasRealizadas*/]
	}
}

package melistats
import grails.plugin.springsecurity.annotation.*

@Secured(['permitAll'])
class PrincipalController {
	def busquedaService;
    def index() {
		def busquedasMasRecientes = busquedaService.getUltimasRealizadas()
		println busquedasMasRecientes
		[busquedasMasRecientes:busquedasMasRecientes/*,busquedasMasRealizadas:busquedasMasRealizadas*/]
	}
}

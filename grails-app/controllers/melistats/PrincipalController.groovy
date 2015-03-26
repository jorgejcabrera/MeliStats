package melistats
import grails.plugin.springsecurity.annotation.*

@Secured(['permitAll'])
class PrincipalController {

    def index() { }
}

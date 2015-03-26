import melistats.*

class BootStrap {

    def init = { servletContext ->

        def rol   = new Role(authority:'ROLE_USER').save(flush:true, failOnError: true)
        
    }
    def destroy = {
    }
}

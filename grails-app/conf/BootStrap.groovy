import melistats.*

class BootStrap {

    def init = { servletContext ->

    	if( Role.findByAuthority('ROLE_USER') == null )
    	{
			def rol = new Role(authority:'ROLE_USER').save(flush:true, failOnError: true)
		}
        
    }
    def destroy = {
    }
}

class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/estadisticas/${busqueda}"{
        	controller = 'estadistica'
        	action = 'index'
        }

        "/"(controller:'Principal', action:"/index") 
        "500"(view:'/error')
	}
}

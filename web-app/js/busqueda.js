var endpoint = "/MeliStats/busqueda/buscar"

$(document).ready(function(){


	resetAlerta()

	$("#busqueda").keydown(
		
			function(event)
			{
    	
    			if(event.keyCode == 13){
        		
        			$("#buscar").click();
    			}
		
			}

	)

	

})

function ejecutarBusqueda()
{
	if($('#busqueda').val() == '')
	{
		return
	}

	resetAlerta()

	var jsonBusqueda = {

		textoBusqueda : $('#busqueda').val(),
		preferencia : $('#preferencia').val(),
		guardarBusqueda : $('#checkbox').val()

	}

	var promesa = $.post(endpoint, jsonBusqueda)
	promesa.done(mostrarResultados)
	promesa.fail(mostrarError)
}

function mostrarResultados(data)
{
	if($.isEmptyObject(data) || data.status == 'no_results')
	{
		alertar('alert-warning','No hay resultados.')
		return 
	}


	//mostrar estadisticas basicas y link a la pag. de estadisticas completa
	//mostrar los 5 productos mas optimos en relacion a la preferencia

}

function mostrarError()
{
	alertar('alert-danger','Ha ocurrido un error en la conexión.')
}

function resetAlerta()
{
	$('#alerta').empty()
	$('#alerta').hide()
}

function alertar(tipo, contenido)
{
	resetAlerta()
	$('#alerta').show()
	$('#alerta').append(contenido)
	$('#alerta').addClass(tipo)
}

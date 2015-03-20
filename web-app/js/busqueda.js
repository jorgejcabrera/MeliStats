var endpoint = "/MeliStats/busqueda/buscar"

function ejecutarBusqueda()
{
	if($('#busqueda').val() == '')
	{
		return
	}

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
	if($.isEmptyObject(data))
	{
		//mostrar que no hay resultados
		return 
	}

	//mostrar estadisticas basicas y link a la pag. de estadisticas completa
	//mostrar los 5 productos mas optimos en relacion a la preferencia

}

function mostrarError()
{
	alert('error')
}
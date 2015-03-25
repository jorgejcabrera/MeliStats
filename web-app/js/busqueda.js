var endpoint = "/MeliStats/busqueda/buscar"
var ultimabusqueda = ""

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
	resetEstadisticas()

	var jsonBusqueda = {

		textoBusqueda : $('#busqueda').val(),
		preferencia : $('#preferencia').val(),
		guardarBusqueda : $('#checkbox').val()

	}

	var promesa = $.post(endpoint, jsonBusqueda)
	ultimabusqueda = jsonBusqueda.textoBusqueda
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

	var precioPromedio = data.muestra.precioPromedio
	var porcentajeEnvioGratis = data.muestra.porcentajeEnvioGratis
	var ventasPorTipoVendedor = data.muestra.ventasPorTipoVendedor

	

	mostrarLinkEstadisticas()
	mostrarPrecioPromedio(precioPromedio)
	mostrarPorcentajeEnvio(porcentajeEnvioGratis)

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

function resetEstadisticas()
{
	$('#url-datos').empty()
	$('#precio-promedio').empty()
	$('#grafico-envio').empty()
}

function alertar(tipo, contenido)
{
	resetAlerta()
	$('#alerta').show()
	$('#alerta').append(contenido)
	$('#alerta').addClass(tipo)
}

function mostrarLinkEstadisticas()
{
	var link = '<h4><a href="/MeliStats/estadisticas/'+ultimabusqueda+'">Ver Estadsitcas Completas</a></h4>'
	$('#url-datos').append(link)
}

function mostrarPrecioPromedio(precio)
{
	$('#precio-promedio').append('<h4>Precio promedio: '+precio+'</h4>')
}

function mostrarPorcentajeEnvio(porcentaje)
{
	
    (function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['', ''],
          ['Gratis', porcentaje],
          ['Pago', (100-porcentaje)],
        ]);

        var options = {
          title: 'Tipos de Envio',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('grafico-envio'));
        chart.draw(data, options);
      })();


}

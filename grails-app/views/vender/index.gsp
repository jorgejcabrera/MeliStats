<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<meta name="layout" content="_layout" />
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
</head>
<body>
	<g:hiddenField id="offset" name="offset" value="0" />
	<g:hiddenField id="maxRows" name="maxRows" value="0" />
	<div style="  position: relative; top: 50px; left: 4px; width: 99%;">
		<section class="panel panel-primary">
			<header>
				<h2>¿Qué desea vender?</h2>
			</header>
			<p>Recomendaciones para la venta de ...</p>
		</section>
		<article>
			<section style="float: left; width: 65%; border: 0px solid">
				<div class="row">
					<div class="col-lg-6">
						<div class="input-group">
							<input type="text" class="form-control" id="textBusqueda"
								placeholder="sugerencias para:"> <span
								class="input-group-btn">
								<button class="btn btn-default" id="botonBuscador" type="button">Buscar</button>
							</span>
						</div>
					</div>
				</div>
				<div align="center" class="well well-sm" style="margin-top: 5px;">
				<div align="center" id="listado-resultado"></div>
				<div id="piechart" style="width: 700px; height: 300px;"></div>
				<div id="piechart2" style="width: 700px; height: 300px;"></div>
				<div id="piechart3" style="width: 700px; height: 300px;"></div>
				</div>
				
			</section>
			<aside
				style="font-style: arial; float: right; width: 34%; border: 0px solid">
				<h4>Posibles compradores</h4>
				<p style="height: 415px">
					<g:each in="${listaEmpleados}" var="unEmpleado">
						<ul style="width: 250px; margin-top: -130px;">
							<li>
								${unEmpleado}
								<button class="btn btn-default" type="button">Contactar</button>
							</li>
						</ul>
					</g:each>
				</p>
			</aside>
		</article>
	</div>
	<script type="text/javascript">
		/*la funcion calcular retorna una promesa, para ello se crea una variable global llamada deferred
		de tipo $.Deferred(), se necesito esto para que la suma total se agrege al contenido_tabla una vez 
		que termino la ULTIMA LLAMADA DE AJAX a la api de mercado libre para calcular la suma total de precios
		del conjunto de items correspondientes a una busquedea*/

		var deferred
		var cantidadItems = 1000
		var sumaTotal = 0
		var cantidadItemsConMP = 0.0
		var cantidadItemsVendidos = 0.0
		var cantidadItemsConMEGratis = 0.0
		var cantidadItemsPublicados = 0.0
		$("#listado-resultado").hide()
		$("#botonBuscador").click(accionBuscar)
		$("#textBusqueda").keypress(verificarEnter)

		function accionBuscar() {
			$("#listado-resultado").show()
			deferred = $.Deferred()
			var tabla = document.getElementById("listado-resultado")
			while (tabla.firstChild) {
				tabla.removeChild(tabla.firstChild)
				cantidadItems = 1000
				sumaTotal = 0
				cantidadItemsConMP = 0
				cantidadItemsVendidos = 0
				cantidadItemsConMEGratis = 0
				cantidadItemsPublicados = 0
			}
			calcular(0).done(
					function() {
						console.log("vendidos"+cantidadItemsVendidos)
						console.log("publicados"+cantidadItemsPublicados)
						var montoPromedio = ""
						var porcentajeArticulosConMp = ""
						var porcentajeArticulosConMe = ""
						var popularidadItem = ""
						montoPromedio += "<div align=center><h3>"
								+ "<span class='label label-info' >Precio sugerido: $" + (sumaTotal/ cantidadItems).toFixed(2) + "</h3></span></div>"
						drawChart(cantidadItemsConMP, cantidadItems)
						drawChart2(cantidadItemsConMEGratis, cantidadItems)
						drawChart3(cantidadItemsVendidos, cantidadItemsPublicados)
						//dibujarArticulosConMe(cantidadItemsConMEGratis / cantidadItems * 100)
						$("#listado-resultado").append(montoPromedio)
					});
		}

		function verificarEnter(event) {
			if (event.which == 13) {
				accionBuscar()
			}
		}

		//retorna false cuando se hizo la ultima llamada a la api de mercado libre
		function procesarEstadisticas(data) {
			console.log(data.paging)
			$.each(data.results, procesarItem)
			if (data.paging.offset + data.paging.limit < cantidadItems) {
				calcular(data.paging.offset + data.paging.limit)
				return true
			}
			return false
		}

		function calcular(offset) {
			var busqueda = $("#textBusqueda").val();
			var promise = $.get(
					"https://api.mercadolibre.com/sites/MLA/search", {
						q : busqueda,
						offset : offset,
						limit : 200
					});
			promise.done(function(data) {
				if (data.paging.total < cantidadItems)
					cantidadItems = data.paging.total
				var estadisticaTerminada = procesarEstadisticas(data)
				if (estadisticaTerminada == false)
					deferred.resolve() //si procesarEstadisticas devuelve false, la promesa se cumplio
			});
			promise.fail(mostrarError)
			return deferred.promise()
		}

		//los articulos que son subastas tienen una varianza en el precio muy grande con el promedio
		function procesarItem(index, item) {
			if (item.buying_mode != "auction") {
				sumaTotal += item.price
				cantidadItemsVendidos += item.sold_quantity
				cantidadItemsPublicados += item.available_quantity + item.sold_quantity
				if (item.accepts_mercadopago)
					cantidadItemsConMP++
				if (item.shipping.free_shipping)
					cantidadItemsConMEGratis++
			}
		}

		function mostrarError() {
			$("#respuesta_api").html("<li>Se produjo un errors</li>")
		}
		google.load("visualization", "1", {
			packages : [ "corechart" ]
		});
		google.setOnLoadCallback(drawChart);
		function drawChart(cantidadItemsConMP, cantidadItems) {
			var data = google.visualization.arrayToDataTable([
					[ 'MercadoPago', 'Porcentaje' ],
					[ 'Acepta', (cantidadItemsConMP) ],
					[ 'No Acepta', (cantidadItems - cantidadItemsConMP) ], ]);
			var options = {
				title : 'Articulos con mercado de pago'
			};
			var chart = new google.visualization.PieChart(document
					.getElementById('piechart'));
			chart.draw(data, options);
		}

		google.setOnLoadCallback(drawChart2);
		function drawChart2(cantidadItemsConMEGratis, cantidadItems) {
			var data = google.visualization.arrayToDataTable([
					[ 'MercadoEnvio', 'Porcentaje' ],
					[ 'Gratis', (cantidadItemsConMEGratis) ],
					[ 'Pago', (cantidadItems - cantidadItemsConMEGratis) ], ]);
			var options = {
				title : 'Articulos con mercado envío'
			};
			var chart = new google.visualization.PieChart(document
					.getElementById('piechart2'));
			chart.draw(data, options);
		}

		google.setOnLoadCallback(drawChart3);
		function drawChart3(cantidadItemsVendidos, cantidadItems) {
			var data = google.visualization.arrayToDataTable([
					[ 'Popularidad', 'Porcentaje' ],
					[ 'Vendidos', (cantidadItemsVendidos) ],
					[ 'Por Vender', (cantidadItems-cantidadItemsVendidos) ], ]);
			var options = {
				title : 'Flujo de ventas'
			};
			var chart = new google.visualization.PieChart(document
					.getElementById('piechart3'));
			chart.draw(data, options);
		}

		/*google.load("visualization", "1", {
			packages : [ "corechart" ]
		});
		google.setOnLoadCallback(dibujarArticulosConMe);
		function dibujarArticulosConMe(porcentajeArticulosConMe) {
			var data = google.visualization.arrayToDataTable([
					[ 'MercadoEnvio', 'Porcentaje' ],
					[ 'Acepta', (porcentajeArticulosConMe) ],
					[ 'No Acepta', (100 - porcentajeArticulosConMe) ], ]);
			var options = {
				title : 'Articulos con mercado de pago'
			};
			var chart = new google.visualization.PieChart(document
					.getElementById('piechart'));
			chart.draw(data, options);
		}*/
	</script>
</body>
</html>
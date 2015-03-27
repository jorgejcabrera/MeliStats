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
			<div>
			<h2 style="margin-left: 169px; margin-bottom: 7px;">¿Qué desea vender?</h2>
				<div class="row">
					<div class="col-lg-6"   style="margin-left: 461px;">
						<div class="input-group" style="margin-top: -38px; margin-left: 18px;">
							<input type="text" class="form-control" id="textBusqueda"
								placeholder="Escriba el producto para el cual quiera obtener sugerencias de venta"> <span
								class="input-group-btn">
								<button class="btn btn-danger" style="" id="botonBuscador" type="button">Buscar</button>
							</span>
						</div>
					</div>
				</div>
			</div>
		<article>
			<section style="float: left; width: 65%; border: 0px solid">
				<div align="center" class="well well-sm" style="margin-top: 11px; margin-left:74px">
				<div align="center" id="listado-resultado"></div>
				<div id="piechart" style="width: 700px; height: 300px;"></div>
				<div id="piechart2" style="width: 700px; height: 300px;"></div>
				<div id="piechart3" style="width: 700px; height: 300px;"></div>
				</div>
				
			</section>
			<aside style="font-style: arial; float: right; width: 34%; border: 0px solid">
				<h2 style="margin-left: 33px; margin-bottom: 25px; text-align: left; color: #000;"> <span class="label label-danger">Posibles compradores</h2>
				<div class="jumbotron" id="div-posibles-compradores" style="width: 275px; margin-left:31px; height: 20px; position: relative;">
					<div id="posible-comprador-template">
						<g:form method="POST" controller="vender" action="enviarMail">
							<div id="nombrePosibleComprador"> #nombreComprador </div>
							<input type="hidden" name="mailComprador" value="#mailComprador">
							<input type="hidden" name="mailProducto" value="#nombreProducto">
							<input type="submit" class="btn btn-default" style="margin-left:54px" value="Contactar">
						</g:form>
					</div>
					<div id="posible-comprador">
						<g:form method="POST" controller="vender" action="enviarMail">
							<div id="nombrePosibleComprador"> #nombreComprador </div>
							<input type="hidden" name="mailComprador" value="#mailComprador">
							<input type="hidden" name="mailProducto" value="#nombreProducto">
							<input type="submit" class="btn btn-default" style="margin-left:54px" value="Contactar">
						</g:form>
					</div>
				</div>
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
		var itemMasVendido = 0.0
		var descripcionItemMasVendido = ""
		$("#listado-resultado").hide()
		$("#posible-comprador").hide()
		$("#posible-comprador-template").hide()
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
				itemMasVendido = 0
			}
			calcular(0).done(
					function() {
						var montoPromedio = ""
						montoPromedio += "<div align=center><h3>"
								+ "<span class='label label-danger' >Precio sugerido: $" + (sumaTotal/ cantidadItems).toFixed(2) + "</h3></span></div>"
						drawChart(cantidadItemsConMP, cantidadItems)
						drawChart2(cantidadItemsConMEGratis, cantidadItems)
						drawChart3(cantidadItemsVendidos, cantidadItemsPublicados)
						$("#listado-resultado").append(montoPromedio)
						$("#listado-resultado").append(descripcionItemMasVendido)
					});
		}

		function posiblesCompradores(String busqueda){
			$("#div-posibles-compradores").empty()
			var descBusq = busqueda
			var promise = $.ajax({
						url: "${createLink(controller:'vender',action:'posiblesCompradores')}",
						method: "POST",
						contentType: "application/json; charset=utf-8",
						data: [nombreBusqueda: descBusq],
				});
			promise.done(mostrarCompradores)

		}

		function mostrarCompradores(data){
			$.each( data.results, agregarResultado )
		}

		function agregarResultado(index, item){
				var str=$("#posible-comprador-template").html();
        		str = str.replace("#nombreComprador", item.nombre);
        		str = str.replace("#mailComprador", item.mail);
        		str = str.replace("#nombreProducto", item.busqueda);
        		$("#posible-comprador").show();
        		$("#posible-comprador").append(str);
		}



		function verificarEnter(event) {
			if (event.which == 13) {
				accionBuscar()
				var busqueda = $("#textBusqueda").val()
				posiblesCompradores(busqueda)
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
				if(item.sold_quantity > itemMasVendido)
					crearDescripcionItemMasVendido(item)
				if (item.accepts_mercadopago)
					cantidadItemsConMP++
				if (item.shipping.free_shipping)
					cantidadItemsConMEGratis++
			}
		}

		function crearDescripcionItemMasVendido(item) {
			itemMasVendido = item.sold_quantity
			var aceptaMp = ""
			var envioGratisItemMasVendido = ""
			descripcionItemMasVendido = ""
			if (item.accepts_mercadopago)
				aceptaMp = "Acepta mercado de pago"
			else
				aceptaMp = "No acepta mercado de pago"
			if (item.shipping.free_shipping)
				envioGratisItemMasVendido = "Envio gratis"
			else
				envioGratisItemMasVendido = "Envio pago"
			descripcionItemMasVendido += "<div align=center><h3>"+ "Item mas vendido acorde a tu busqueda"+"</h3></div>"+
				"<div align=center><h5><a href='"+item.permalink+"'>"+item.title+"</a>"+"</h5></div>"+
				"<div align=center><h5> Precio: $ "+item.price+"</h5></div>"+
				"<div align=center><h5>"+item.sold_quantity+" ventas"+"</h5></div>"+
				"<div align=center><h5>"+aceptaMp+"</h5></div>"+
				"<div align=center><h5>"+envioGratisItemMasVendido+"</h5></div>"
		}

		function mostrarError() {
			$("#listado-resultado").html("<li>Se produjo un errors</li>")
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
			var data = google.visualization
					.arrayToDataTable([
							[ 'Popularidad', 'Porcentaje' ],
							[ 'Vendidos', (cantidadItemsVendidos) ],
							[ 'Por Vender',
									(cantidadItems - cantidadItemsVendidos) ], ]);
			var options = {
				title : 'Flujo de ventas'
			};
			var chart = new google.visualization.PieChart(document
					.getElementById('piechart3'));
			chart.draw(data, options);
		}
	</script>
</body>
</html>
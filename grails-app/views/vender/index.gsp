<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<meta name="layout" content="_layout" />
</head>
<body>
	<g:hiddenField id="offset" name="offset" value="0" />
	<g:hiddenField id="maxRows" name="maxRows" value="0" />
	<div style="position: relative; top: 50px; left: 0px">
		<section class="panel panel-primary">
			<header>
				<h2>¿Que desea vender?</h2>
			</header>
			<p>recomendaciones para la venta de ...</p>
		</section>
		<article>
			<section style="float: left; width: 65%; border: 0px solid">
				<div class="row">
					<div class="col-lg-6">
						<div class="input-group">
							<input type="text" class="form-control" id="textBusqueda" placeholder="sugerencias para:">
							<span class="input-group-btn">
								<button class="btn btn-default" id="botonBuscador" type="button">Buscar</button>
							</span>
						</div>
					</div>
				</div>
				<div  class="well well-sm" id="list-promedio">
				</div>
			</section>
			<aside
				style="font-style: arial; float: right; width: 34%; border: 0px solid">
				<h4> Posibles compradores</h4>	
				<p style="height:415px">
          				<g:each in="${listaEmpleados}" var="unEmpleado">
								<ul style="width:250px; margin-top:-130px;">
								<li>${unEmpleado} <button class="btn btn-default" type="button">Contactar</button></li>
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
		var montoTotal = 0
		var cantidadItems = 0
		$("#list-promedio").hide()		
		$("#botonBuscador").click(accionBuscar)
		$("#textBusqueda").keypress(verificarEnter)
		var deferred
		function accionBuscar(){
			$("#list-promedio").show()
			deferred = $.Deferred()
			var tabla = document.getElementById("list-promedio")
			while (tabla.firstChild) {
				tabla.removeChild(tabla.firstChild)
				montoTotal = 0
				cantidadItems = 0
			}
			calcular(0).done(function() {
				var html = ""
				html += "<h3>"+"El precio sugerido es " + montoTotal / cantidadItems +"</h3>"
				$("#list-promedio").append(html)
			});
		}
		function verificarEnter(event) {
			if (event.which == 13) { 
					accionBuscar()
			}
		}
		//retorna false cuando se hizo la ultima llamada a la api de mercado libre
		function sumaParcial(data) {
			console.log(data.paging)
			$.each(data.results,sumarMontoTotal)
			if(data.paging.offset + data.paging.limit < cantidadItems ){
				calcular(data.paging.offset+data.paging.limit)
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
					if(data.paging.total > 10000) cantidadItems = 1000
					else cantidadItems = data.paging.total
					var result = sumaParcial(data)
					if(result == false) deferred.resolve() 		//si sumaParcial devuelve false, la promesa se cumplio
				});
				promise.fail(mostrarError)
				return deferred.promise()
		}
		function sumarMontoTotal(index, item) {
			montoTotal += item.price;
			//console.log(montoTotal)
		}
		function mostrarError() {
			$("#respuesta_api").html("<li>Se produjo un errors</li>")
		}
		</script>
</body>
</html>
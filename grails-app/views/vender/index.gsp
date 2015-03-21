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
				<div id="list-empleado">
					<div id="textoRespuesta"></div>
					<table
						style="position: relative; top: 20px; left: 35px; width: 70%">
						<thead>
							<tr>
								<td>Descripcion</td>
								<td>Imagen</td>
								<td>Precio</td>
							</tr>
						</thead>
						<tbody id="contenido_tabla">

						</tbody>
					</table>
					<div style="position: relative; top: 100px; left:160px">
						<button class="btn btn-default" id="anterior" type="button">Anterior</button>
						<button class="btn btn-default" id="siguiente" type="button">Siguiente</button>
					</div>
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
		console.log("Punto 1");
		$("#list-empleado").hide();		
		$("#textoRespuesta").hide();
		$("#botonBuscador").click(buscar)
		$("#textBusqueda").keypress(verificarEnter)
		$("#siguiente").click(mostrarSiguientes)
		$("#anterior").click(mostrarAnteriores)
		function mostrarSiguientes() {
			var offset = parseInt($("#offset").val(),10);
			if (offset + 50 > $("#maxRows").val()) {
				console.log("se supero el max offset")

			} else {
				$("#offset").val(offset+50)
				buscar();
			}
		}
		function mostrarAnteriores() {
			var offset = parseInt($("#offset").val(),10);
			if (offset - 50 < 0) {
				console.log("se supero el min offset")
			} else {
				$("#offset").val(offset-50)
				buscar();
			}
		}
		function verificarEnter(event) {
			if (event.which == 13) { 				/*para que tome el enter. Se tiene que comparar con 13*/
				buscar();
			}
		}
		function mostrarResultado(data) {
			console.log("Punto 5");
			var infoRespuesta = document.getElementById("textoRespuesta");
			infoRespuesta.innerHTML = "<h1></h1>"
			$("#maxRows").val(data.paging.total);
			$.each(data.results, agregarResultado)
		}
		function buscar() {
			var divRespuesta = $("#textoRespuesta");
			divRespuesta.show();
			$("#list-empleado").show();
			var tabla = document.getElementById("contenido_tabla")
			while (tabla.firstChild) {
				tabla.removeChild(tabla.firstChild);
			}
			var busqueda = $("#textBusqueda").val();
			var offset = $("#offset").val();
			var promise = $.get(
					"https://api.mercadolibre.com/sites/MLA/search", {
						q : busqueda,
						offset : offset
					});
			//console.log("Punto 2");
			promise.done(mostrarResultado);
			//console.log("Punto 3");
			promise.fail(mostrarError);
			//console.log("Punto 4");
		}
		function agregarResultado(index, item) {
			//console.log(item.title);
			var html = "";
			if (index % 2 == 0) {
				html += "<tr class='even'>";
			} else {
				html += "<tr class='odd'>";
			}
			html += "<td>" 
					+ item.title +"</td>";
			html += "<td>"
					+ "<img src='"+item.thumbnail+"' height='42' width='42'>"
					+ "</td>"
			html += "<td>" + item.price + "</td>"

			html += "</tr>"
			$("#contenido_tabla").append(html);

		}
		function mostrarError() {
			console.log("Punto 6");
			$("#respuesta_api").html("<li>Se produjo un errors</li>");
		}
		//console.log("Punto 7");
	</script>
	
	
	
	
	
	
</body>
</html>
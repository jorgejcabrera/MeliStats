<!DOCTYPE HTML>
<html>
	<head>
		<meta name="layout" content="_layout"/>
		<title>Búsuqeda</title>
	</head>
	<body>
		<center>
			<div id="buscador" style="position:relative; top:100px; width:900px;">
				<g:form action="buscar" class="form-inline">
					<div class="form-group" id="contenedor-buscador" >
						<input class="form-control" type="search" name="busqueda" style="width:400px;" required> 
					</div>
					<div class="form-group" id="contenedor-preferencia">
						 <g:select class="form-control"  name="preferencia" from="${preferencias}"  optionValue="nombrePref" optionKey="id" noSelection="${[null:'Elija una Preferencia']}"/>
					</div>
					<div class="form-group" id="contenedor-buscar">
						<input class="form-control" type="submit" name="buscar" value="Buscar"> 
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox" name="guardar">Guardar Búsqueda
						</label>
					</div>
				</g:form>
			</div>
			<div id="items-stats-container">
				<div id="estadisticas" style="position:relative; top:200px; width: 400px;">
					<table class="table table-striped">
						<thead>
							<tr>
								<th style="text-align:center;">Estadísticas</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<div id="mejores-productos">
				</div>
			</div>
		</center>
	</body>
</html>
<!DOCTYPE HTML>
<html>
	<head>
		<meta name="layout" content="_layout"/>
		<title>Búsuqeda</title>
		<script type="text/javascript" src="${resource(dir:'js', file: 'busqueda.js')}"></script>
	</head>
	<body>
		<center>
			<div  id="alerta" class="alert alert-success" role="alert" style="position:relative;width:800px;top:100px;">
			</div>			
			<div id="buscador" style="position:relative; top:100px; width:900px;">
				<div class="form-inline">
					<div class="form-group" id="contenedor-buscador" >
						<input class="form-control" id="busqueda" type="text" name="busqueda" style="width:400px;"> 
					</div>
					<div class="form-group" id="contenedor-preferencia">
						 <g:select class="form-control"  id="preferencia" name="preferencia" from="${preferencias}"  optionValue="nombrePref" optionKey="id" noSelection="${[null:'Elija una Preferencia']}"/>
					</div>
					<div class="form-group" id="contenedor-buscar">
						<input class="form-control" id="buscar" type="button" onclick="ejecutarBusqueda()" name="buscar" value="Buscar"> 
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox" name="guardar" id="checkbox">Guardar Búsqueda
						</label>
					</div>
				</div>
			</div>
			<div id="items-stats-container" style="position:relative; top:200px; width:900px;">
				<div id="estadisticas-container" style="float:left;width:400px;">
					<table class="table table-striped">
						<thead>
							<tr>
								<th style="text-align:center;">Estadísticas</th>
							</tr>
						</thead>
						<tbody id="estadisticas">
							<!-- completar via jQuery.ajax() -->
						</tbody>
					</table>
				</div>
				<div id="productos-container" style="float:right;width:400px;">
					<table class="table table-striped">
						<thead>
							<tr>
								<th style="text-align:center;">Mejores Productos</th>
							</tr>
						</thead>
						<tbody id="productos">
							<!-- completar via jQuery.ajax() -->
						</tbody>
					</table>
				</div>
			</div>
		</center>
	</body>
</html>
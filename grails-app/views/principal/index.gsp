<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="_layout" />
<title>MeliStats</title>
</head>
<body>
	<div class="container" style="margin-top: 40px">
		<div>
			<h1 class="row col-md-12">
				<span class="label label-danger">Búsquedas más realizadas</span>
			</h1>
			<div class="row">
				<g:render template="busqueda" bean="${busquedasMasRealizadas[0]}" />
				<g:render template="busqueda" bean="${busquedasMasRealizadas[1]}" />
				<g:render template="busqueda" bean="${busquedasMasRealizadas[2]}" />
			</div>
		</div>

		<div>
			<h1 class="row col-md-12">
				<span class="label label-danger">Búsquedas recientes</span>
			</h1>
			<div class="row">
				<g:render template="busqueda" bean="${busquedasMasRecientes[0]}" />
				<g:render template="busqueda" bean="${busquedasMasRecientes[1]}" />
				<g:render template="busqueda" bean="${busquedasMasRecientes[2]}" />
			</div>
		</div>
	</div>
</body>
</html>
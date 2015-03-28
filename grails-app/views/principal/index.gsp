<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="_layout" />
<title>MeliStats</title>
</head>
<body>
	<div style="position: relative; top: 40px; left: 20px; width: 96%;">
		<h1>
			<span class="label label-success" style="background-color: #D9534F;">Búsquedas
				más realizadas</span>
		</h1>
		<div class="jumbotron"
			style="float: left; margin-left: 10px; width: 400px; height: 200px; margin-top: 20px; width: 400px; height: 200px;">
			<g:if test="${busquedasMasRealizadas[0] != null}">
				<div align=center class="alert alert-info" role="alert">
					<h4>
						<a
							href="/MeliStats/estadisticas/${busquedasMasRealizadas[0].descripcion}">
							${busquedasMasRealizadas[0].descripcion}
						</a>
					</h4>
					<div>
						<img src='${busquedasMasRealizadas[0].getImagen()}' height='80'
							width='80'>
					</div>
				</div>
			</g:if>
		</div>
		<div class="jumbotron"
			style="float: left; margin-left: 10px; width: 400px; height: 200px; margin-top: 20px;">
			<g:if test="${busquedasMasRealizadas[1] != null}">
				<div align=center class="alert alert-info" role="alert">
					<h4>
						<a
							href="/MeliStats/estadisticas/${busquedasMasRealizadas[1].descripcion}">
							${busquedasMasRealizadas[1].descripcion}
						</a>
					</h4>
					<div>
						<img src='${busquedasMasRealizadas[1].getImagen()}' height='80'
							width='80'>
					</div>
				</div>
			</g:if>
		</div>
		<div class="jumbotron"
			style="float: left; margin-left: 10px; width: 400px; height: 200px; margin-top: 20px;">
			<g:if test="${busquedasMasRealizadas[2] != null}">
				<div align=center class="alert alert-info" role="alert">
					<h4>
						<a
							href="/MeliStats/estadisticas/${busquedasMasRealizadas[2].descripcion}">
							${busquedasMasRealizadas[2].descripcion}
						</a>
					</h4>
					<div>
						<img src='${busquedasMasRealizadas[2].getImagen()}' height='80'
							width='80'>
					</div>
				</div>
			</g:if>
		</div>
	</div>


	<div style="position: relative; top: 40px; left: 20px; width: 96%;">
		<h1>
			<span class="label label-success" style="background-color: #D9534F;">Búsquedas
				recientes</span>
		</h1>
		<div class="jumbotron"
			style="float: left; margin-left: 10px; width: 400px; height: 200px; margin-top: 20px; width: 400px; height: 200px;">
			<g:if test="${busquedasMasRecientes[0] != null}">
				<div align=center class="alert alert-info" role="alert">
					<h4>
						<a
							href="/MeliStats/estadisticas/${busquedasMasRecientes[0].descripcion}">
							${busquedasMasRecientes[0].descripcion}
						</a>
					</h4>
					<div>
						<img src='${busquedasMasRecientes[0].getImagen()}' height='80'
							width='80'>
					</div>
				</div>
			</g:if>
		</div>
		<div class="jumbotron"
			style="float: left; margin-left: 10px; width: 400px; height: 200px; margin-top: 20px;">
			<g:if test="${busquedasMasRecientes[1] != null}">
				<div align=center class="alert alert-info" role="alert">
					<h4>
						<a
							href="/MeliStats/estadisticas/${busquedasMasRecientes[1].descripcion}">
							${busquedasMasRecientes[1].descripcion}
						</a>
					</h4>
					<div>
						<img src='${busquedasMasRecientes[1].getImagen()}' height='80'
							width='80'>
					</div>
				</div>
			</g:if>
		</div>
		<div class="jumbotron"
			style="float: left; margin-left: 10px; width: 400px; height: 200px; margin-top: 20px;">
			<g:if test="${busquedasMasRecientes[2] != null}">
				<div align=center class="alert alert-info" role="alert">
					<h4>
						<a
							href="/MeliStats/estadisticas/${busquedasMasRecientes[2].descripcion}">
							${busquedasMasRecientes[2].descripcion}
						</a>
					</h4>
					<div>
						<img src='${busquedasMasRecientes[2].getImagen()}' height='80'
							width='80'>
					</div>
				</div>
			</g:if>
		</div>
	</div>
</body>
</html>
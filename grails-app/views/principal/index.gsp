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
		</div>
		<div class="jumbotron"
			style="float: left; margin-left: 10px; width: 400px; height: 200px; margin-top: 20px;">
		</div>
		<div class="jumbotron"
			style="float: left; margin-left: 10px; width: 400px; height: 200px; margin-top: 20px;">
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
						<span> ${busquedasMasRecientes[0].descripcion}
						</span>
					</h4>
				</div>
			</g:if>
		</div>
		<div class="jumbotron"
			style="float: left; margin-left: 10px; width: 400px; height: 200px; margin-top: 20px;">
			<g:if test="${busquedasMasRecientes[1] != null}">
				<div align=center class="alert alert-info" role="alert">
					<h4>
						<span> ${busquedasMasRecientes[1].descripcion}
						</span>
					</h4>
				</div>
			</g:if>
		</div>
		<div class="jumbotron"
			style="float: left; margin-left: 10px; width: 400px; height: 200px; margin-top: 20px;">
			<g:if test="${busquedasMasRecientes[2] != null}">
				<div align=center class="alert alert-info" role="alert">
					<h4>
						<span> ${busquedasMasRecientes[2].descripcion}
						</span>
					</h4>
				</div>
			</g:if>
		</div>
	</div>
</body>
</html>
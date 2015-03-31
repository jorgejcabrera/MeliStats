<!DOCTYPE>
<html>
<head>
</head>
<body>
	<div class="col-md-4">
		<g:if test="${it != null}">
			<div class="alert alert-info text-center" style="height: 200px">
				<h3 style="margin-top: 2px;">
					<a
						href="${createLink(controller: 'estadistica', action: 'index', params: [busqueda: it.descripcion])}">
						${it.descripcion}
					</a>
				</h3>
				<div style="margin-top: 19px;">
					<img src='${it.getImagen()}' height='100' width='100'>
				</div>
			</div>
		</g:if>
		<g:else>
			<div class="alert" style="background-color: #B0B3B3; height: 200px">
			</div>
		</g:else>
	</div>
</body>
</html>
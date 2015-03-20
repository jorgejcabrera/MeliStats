<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="_layout" />
</head>
<body>
	<div style="position: relative; top: 50px; left: 0px">
		<section class="panel panel-primary">
			<header>
				<h2>¿Que desea vender?</h2>
			</header>
			<p>Indique un artículo que desea vender y le daremos algunas
				recomendaciones</p>
		</section>
		<article>
			<section style="float: left; width: 65%; border: 0px solid">
				<div class="row">
					<div class="col-lg-6">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="Busqueda">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button">Buscar</button>
							</span>
						</div>
					</div>
				</div>
			</section>
			<aside
				style="font-style: italic; float: right; width: 34%; border: 0px solid">
				<pre>
           			<h4>Posibles compradores</h4>	
          				<g:each in="${listaEmpleados}" var="unEmpleado">
							<div>${unEmpleado}</div>
          				</g:each>
           		</pre>
			</aside>
		</article>
	</div>
</body>
</html>
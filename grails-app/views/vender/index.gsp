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
			<p>recomendaciones para la venta de ...</p>
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
				<table style="position: relative; top: 20px; left: 35px;width: 70%">
					<thead>
						<tr>
							<td>Articulo</td>
							<td>Foto</td>
							<td>Descripcion</td>
						</tr>
					</thead>
					<tbody>
						<tr>

						</tr>
					</tbody>
				</table>
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
</body>
</html>
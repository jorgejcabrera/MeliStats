<!DOCTYPE html>


<html>
<head>
<meta name="layout" content="_layout" />
<title>Mi perfil</title>
</head>


<body>
	<div class="container" style="width: 92%">
		<div style="position: relative; top: 50px;">
			<aside style="font-style: arial; float: left; margin-left: 116px">
				<h1 style="margin-left: 8px; text-align: left; color: #000;">
					<span class="label label-danger">Mis preferencias</span>
				</h1>

				<input class="btn btn-danger"
					style="width: 42px; height: 41px; margin-top: -72px; margin-left: 261px; font-weight: bold; font-size: 20px;"
					type="button" value="+" data-toggle="modal" data-target="#myModal"></input>

				<!--<li class="active"><a href="#" data-toggle="modal" data-target="#myModal">Crear Preferencia <span class="sr-only">(current)</span></a></li> -->
				<div class="modal fade bs-example-modal-sm" id="myModal"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
								<h4 class="modal-title" style="text-align: center" id="myModal">Crear
									nueva preferencia</h4>
							</div>

							<div class="modal-body">
								<div class="container marketing"
									style="width: 80%; text-align: center">
									<div class="row featurette">
										<g:form controller="MiPerfil" action="nuevaPref" method="post">
											<div>
												<h4 class="featurette-heading">¿Qué nombre le quiere
													dar a la preferencia?</h4>
												<input type="text" placeholder="Ingrese el nombre elegido"
													id="campoNombre" style="width: 100%;" name="nombrePref"
													required>
											</div>
											<br>
											<div>
												<h4 class="featurette-heading">¿Cuánto le importa que
													el precio sea barato?</h4>
												<div>Poco &nbsp&nbsp Mucho</div>
												<input type="range" min="0"
													max"10" placeholder="Elija la importancia que le da al precio"
													id="campoPrecio" name="precioPref" value="">
											</div>
											<br>
											<div>
												<h4 class="featurette-heading">¿Cuánto le importa el
													envío gratis?</h4>
												<div>Poco &nbsp&nbsp Mucho</div>
												<input type="range" min="0"
													max"10" placeholder="Elija la importancia que le da al envío gratis"
													id="campoEnvio" name="envioPref" value="">
											</div>
											<br>
											<div>
												<h4 class="featurette-heading">¿Cuánto le importa la
													reputación del vendedor?</h4>
												<div>Poco &nbsp&nbsp Mucho</div>
												<input type="range" min="0"
													max"10" placeholder="Elija la importancia que le da a la reputación del vendedor"
													id="campoReputacion" name="reputacionPref" value="">
											</div>
											<br>
											<br>

											<button id="botonAgregarPreferencia" class="btn btn-danger"
												controller="MiPerfil" action="nuevaPref">
												<a style="color: white">Agregar</a>
											</button>
										</g:form>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>


				<!--				<g:if test="${preferencias=='[]'}">
						<div>CREATE UNA PREF</div>
					</g:if>
		-->

				<g:each in="${preferencias}" var="pref">
					<div class="jumbotron"
						style="width: 420px; height: 220px; position: relative; margin-left: -50px; margin-bottom: -11px;">
						<form id="formPref${pref.id}"
							action="${createLink(controller: 'miPerfil', action: 'guardarCambiosPref')}"
							method="post">
							<input type="hidden" name="idPreferencia" value="${pref.id}" />
							<div style="margin-top: -38px; margin-left: -5px;">
								<input type="hidden" id="campoNombre${pref.id}">
								${pref.nombrePref}
							</div>
							<div style="margin-left: -5px;">
								Importancia precio barato: <input type="range" min="0"
									max"10" id="campoPrecio${pref.id}" name="precioPref"
									value="${pref.precioPref}" disabled>
							</div>
							<div style="margin-left: -5px;">
								Importancia envío gratis: <input type="range" min="0"
									max"10" id="campoEnvio${pref.id}" name="envioPref"
									value="${pref.envioPref}" disabled>
							</div>
							<div style="margin-left: -5px;">
								Importancia reputación del vendedor: <input type="range" min="0"
									max"10" id="campoVendedor${pref.id}" name="reputacionPref"
									value="${pref.reputacionPref}" disabled>
							</div>

						</form>
						<script>
								function editarPreferencias${pref.id}(){
									$("#campoPrecio${pref.id}").removeAttr('disabled')
									$("#campoEnvio${pref.id}").removeAttr('disabled')
									$("#campoVendedor${pref.id}").removeAttr('disabled')
									$("#btnGuardar${pref.id}").removeAttr('disabled')
								}
							</script>

						<input type="submit" class="btn btn-danger"
							style="margin-left: -5px; margin-top: 10px;" value="Editar"
							id="btnEditar${pref.id}" onClick="editarPreferencias${pref.id}()"
							name="editar" />

						<script>
								function guardarCambios${pref.id}(){
									$("#formPref${pref.id}").submit()
								}
							</script>

						<input type="submit" class="btn btn-danger"
							style="margin-left: 90px; margin-top: 10px;"
							value="Guardar cambios" id="btnGuardar${pref.id}"
							onClick="guardarCambios${pref.id}()" name="guardarCambios"
							disabled />


						<g:form controller="MiPerfil" action="eliminarPref">
							<input type="hidden" name="idPreferencia" value="${pref.id}" />
							<input type="submit" class="btn btn-danger"
								style="margin-left: 66px; margin-top: -56px;" value="Eliminar"
								id="btnEliminarPref" controller="MiPerfil" action="eliminarPref"
								name="EliminarPref" />
						</g:form>
					</div>
					<br>
					<br>
				</g:each>
			</aside>
		</div>

		<div style="position: relative; top: 50px; left: 50px">
			<aside style="font-style: arial; float: right; margin-right: 180px">
				<h1
					style="text-align: center; margin-bottom: 29px; margin-left: -23px; color: #000;">
					<span class="label label-danger">Mis búsquedas</span>
				</h1>

				<g:each in="${busquedas}" var="busq">
					<div class="jumbotron"
						style="width: 446px; height: 80px; position: relative; margin-left: -23px; margin-bottom: 15px; margin-top: 18px;">
						<div style="margin-left: -37px; margin-top: -32px">
							Búsqueda:
							${busq.descripcion}
						</div>
						<div style="margin-left: -38px; margin-top: 6px;">
							Fecha en la que se realizó:
							${busq.fechaInicioBusqueda}
						</div>
						<a href="${createLink(controller: 'estadistica', action: 'index', params: [busqueda: busq.descripcion])}"
							style="margin-left: -38px; margin-top: -120px; color: #E03549">Ver
							estadísticas</a>
						<form
							action="${createLink(controller: 'miPerfil', action: 'eliminarBusq')}"
							method="post">
							<input type="hidden" name="idBusqueda" value="${busq.id}"
								id="idBusqueda" /> <input type="submit" class="btn btn-danger"
								value="Eliminar" id="btnEliminarBusq" controller="MiPerfil"
								action="eliminarBusq"
								style="margin-left: 289px; margin-top: -88px;" />
						</form>
					</div>
				</g:each>
			</aside>
		</div>
	</div>

</body>
</html>


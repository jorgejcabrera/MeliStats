<!DOCTYPE html>


<html>
	<head>
 	<meta name="layout" content="_layout"/>
	<title> Mi perfil</title>
	</head>
	

	<body>
		<div class="container" style="width:92%">
			<div style="position:relative; top:50px;"> 
				<aside style="font-style: arial; float: left; margin-left:70px">
					<h1 style="text-align:left; color: #000;"> <span class="label label-danger">Mis preferencias</span><input class="btn btn-danger" style="width: 42px; height: 41px; margin-top: 4px; margin-left: 12px; font-weight: bold; font-size: 20px;" type="button" value="+"></h1>
					<g:each in="${preferencias}" var="pref">
						<div class="jumbotron" style="width: 400px; height: 150px; position: relative; margin-top: 22px; margin-bottom: -11px;">
							<div style="margin-top: -38px;   margin-left: 10px;"> Nombre: ${pref.nombrePref}</div>
							<div style="margin-left: 10px;"> Precio: ${pref.precioPref}</div>
							<div style="margin-left: 10px;"> Envío; ${pref.envioPref}</div>
							<div style="margin-left: 10px;"> Reputación: ${pref.reputacionPref}</div>
							<input type="submit" class="btn btn-danger" style="margin-left: 10px; margin-top:10px;"value="Editar" id="btnEdit" onclick="" name="editar" />
							<input type="submit" class="btn btn-danger" style="margin-left: 10px;  margin-top:10px;" value="Eliminar" id="btnDelete" onclick="" name="eliminar"/>
						</div>
					</g:each>
				</aside>
			</div>
		
			<div style="position:relative; top:50px; left:50px"> 
				<aside style="font-style: arial; float: right; margin-right:450px">
					<h1 style="text-align:center; color: #000;"> <span class="label label-danger">Mis búsquedas</span></h1>
				</aside>
			</div>
		</div>

	</body>
</html>
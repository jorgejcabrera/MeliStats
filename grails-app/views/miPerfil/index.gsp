<!DOCTYPE html>


<html>
	<head>
 	<meta name="layout" content="_layout"/>
	<title> Mi perfil</title>
	</head>
	

	<body>
		<div style="position:relative; top:50px; left:50px"> 
			
		<h1 style="text-align:left; color: #000;"> <span class="label label-danger">Mis preferencias</span></h1>


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
		</div>

	</body>
</html>
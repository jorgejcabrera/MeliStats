<!DOCTYPE html>
<html>

<head>
 	<meta name="layout" content="_layout"/>
	<title>Registrarse!</title>
</head>

<body>
	<br><br><br><br>
	<div class="container" style="width:30%">
		<div class="form-group" style="text-align: center;">
				<g:form controller="registrar" action="registrarUsuario">
					<h3>Crea tu usuario de MeliStats</h3><br>
					<h5 style="margin-left:-176px"><strong>Elige tu nombre de usuario</strong></h5>
    				<input type="text" name="nombre" id="txtNombre" class="form-control" placeholder="Nombre de usuario" maxlength="15" required>
	    			<h5 style="margin-left:-217px"><strong>Elige una contraseña</strong></h5>
    				<input type="password" name="cont" id="txtCont" class="form-control" placeholder="Contraseña" maxlength="8" required>			
	    			<h5 style="margin-left:-230px"><strong>Correo electrónico</strong></h5>
	    			<input type="email" name="mail" id="txtNombre" class="form-control" placeholder="example@melistats.com" required><br><br>
    				<input type="submit" name="registrarse" id="registrarse" class="btn btn-danger" value="Registrarse" >

 				</g:form>
    			<g:if test="${flash.message=='failed'}">
					<h3 style="text-align:center; color: #000;" class="lead"><span class="label label-danger" style="margin-left: -25%;">Ya hay un usuario registrado con ese nombre de usuario.</span></h3>
				</g:if>
				<g:if test="${flash.message=='success'}">
					<h3 style="text-align:center; color: #000;" class="lead"><span class="label label-success" style="margin-left: -15%;">Usuario registrado correctamente.</span></h3>
				</g:if>

  			</div>
  	</div>
	
</body>


</html>
<html>
<head>
	<meta name='layout' content='_layout'/>
	<title><g:message code="springSecurity.login.title"/></title>
	
</head>

<body>
<div id='login'>
	<div>
		<h3 style="text-align:center;"><g:message code="springSecurity.login.header"/></h3>		
		<center style="position:relative; top:50px;">
			<h6 style="color:#d9534f">
				<g:if test="${flash.message != null}">
					Error en la autenticación. Usuario o contraseña inválidos.
				</g:if>
			</h6>
			<form action='${postUrl}' method='POST' id='loginForm' class='form-group' style="text-align:center; width:300px;"autocomplete='off'>
				<p class="form-group" style="text-align:left;">
					<input type='text' class='form-control' name='j_username' id='username' placeholder='Ingrese su usuario'/>
				</p>

				<p class="form-group">
					<input type='password' class='form-control' name='j_password' id='password' placeholder='Ingrese su contraseña'/>
				</p>

				<p id="remember_me_holder" class="form-group">
					<input type='checkbox' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
					<label for='remember_me'>Recordarme</label>
				</p>

				<p class="form-group">
					<input type='submit' class='btn btn-danger'id="submit" value='Login'/>
				</p>		
			</form>
			
		</center>
	</div>
</div>
<script type='text/javascript'>
	<!--
	(function() {
		document.forms['loginForm'].elements['j_username'].focus();
	})();
	// -->
</script>
</body>
</html>

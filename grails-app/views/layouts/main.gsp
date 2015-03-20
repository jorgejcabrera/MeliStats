<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Melistats</title>
</head>
<body>
	<header>
		<div align="center">
			<h1>
				<g:message code="MeliStats" />
			</h1>
			<span id='loginLink'> <a
				href="${createLink(controller:'Home',action:'index')}">Home</a> <a
				href="${createLink(controller:'Comprar',action:'index')}">Comprar</a>
				<a href="${createLink(controller:'Vender',action:'index')}">Vender</a>
			</span>	
		</div>
	</header>
</body>
</html>
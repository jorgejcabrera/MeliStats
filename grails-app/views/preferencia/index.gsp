<!DOCTYPE html>
<html>
	<head>
 	<meta name="layout" content="_layout"/>
	<title> Mis preferencias</title>
	</head>
	

	<body>
		<div style="position:relative; top:50px; left:50px"> 
			<g:each in="${preferencias}" var="pref">
					<div> ${pref.nombrePref}</div>
					<div> ${pref.precioPref}</div>
					<div> ${pref.envioPref}</div>
					<div> ${pref.reputacionPref}</div>
			</g:each>
		</div>

	</body>
</html>
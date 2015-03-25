<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="_layout"/>
	<title>Estadística de: ${nombreBusq}</title>
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Envío', 'Cantidad de publicaciones'],
          ['Gratis',     11],
          ['Pago',      2],
        ]);

        var options = {
          title: 'Porcentaje de publicaciones con envío gratis a lo largo del tiempo'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>
	<script type="text/javascript"
          src="https://www.google.com/jsapi?autoload={
            'modules':[{
              'name':'visualization',
              'version':'1',
              'packages':['corechart']
            }]
          }"></script>

    <script type="text/javascript">
      google.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Mes de Muestra', 'Promedio de ventas', 'Precio Máximo', 'Precio Mínimo', 'Precio Promedio',],
          [${muestras.fechaDeMuestra.minutes[1]},  ${muestras.ventasPromedio[1]}, ${muestras.precioMax[1]}, 100, 1000],
          [${muestras.fechaDeMuestra.minutes[2]},  ${muestras.ventasPromedio[2]}, ${muestras.precioMax[2]}, 200, 3000],
          [${muestras.fechaDeMuestra.minutes[3]},  ${muestras.ventasPromedio[3]}, ${muestras.precioMax[3]}, 300, 6000],
          [${muestras.fechaDeMuestra.minutes[4]},  ${muestras.ventasPromedio[4]}, ${muestras.precioMax[4]}, 400, 8000]
        ]);

        var options = {
          title: 'Estadísticas de la busqueda a lo largo del tiempo',
          
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    </script>
</head>
<body>
	<br><br>
	<div align="center"><h2><span class="label label-info">${nombreBusq}</span></h2></div><br><br>
	<div align="center">${muestras.fechaDeMuestra.minutes[20]}</div>
    <div id="curve_chart" style="position: relative; left: -25px; width: 700px; height: 250px"></div>
    <div id="piechart" style="position: relative; top: -250px; left: 650px; width: 550px; height: 250px;"></div>
</body>
</html>
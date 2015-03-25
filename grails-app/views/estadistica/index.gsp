<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="_layout"/>
	<title>Estadística de: ${nombreBusq}</title>
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script>
    google.load('visualization', '1', {packages: ['corechart']});
    google.setOnLoadCallback(drawChart);

    function drawChart() {

      var data = new google.visualization.DataTable();
      data.addColumn('string', 'Time of Day');
      data.addColumn('number', 'Envío Gratis');
      data.addColumn('number', 'Envío Pago');

      data.addRows([
        ['Enero', 82, 18],
        ['Febrero', 70, 30],
        ['Marzo', 67, 33],
        ['Abril', 72, 28],
        ['Mayo', 82, 18],
        ['Junio', 70, 30],
        ['Julio', 67, 33],
        ['Agosto', 72, 28],
        ['Septiem', 82, 18],
        ['Octubre', 70, 30],
      ]);

      var options = {
        width: 900,
        height: 263,
        hAxis: {
          title: 'Mes',
          
        },
        vAxis: {
          title: 'Porcentaje'
        }
      };

      var chart = new google.visualization.ColumnChart(
        document.getElementById('ex1'));

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
      google.setOnLoadCallback(drawChart)

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Mes de Muestra', 'Promedio de ventas', 'Precio Máximo'],
          ['2004',  1000,      400],
          ['2005',  1170,      460],
          ['2006',  660,       1120],
          ['2007',  1030,      540]
        ])

        var options = {
          title: 'Estadísticas de la busqueda a lo largo del tiempo',
          curveType: 'function',
          legend: { position: 'bottom' }
        }

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'))

        chart.draw(data, options)
      }
    </script>
</head>
<body>
	<br><br>
	<div align="center"><h2><span class="label label-info">${nombreBusq}</span></h2></div>
	<div id="ex1"></div>
    <div id="curve_chart" style="align:center; width: 700px; height: 250px;"></div>
</body>
</html>
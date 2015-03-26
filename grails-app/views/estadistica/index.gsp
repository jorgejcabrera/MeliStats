<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="_layout"/>
	<title>Estadística de: ${nombreBusq}</title>
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script>
    google.load('visualization', '1', {packages: ['corechart']})
    google.setOnLoadCallback(drawChart)

    function drawChart() {

      var data = new google.visualization.DataTable()
      data.addColumn('string', 'Time of Day')
      data.addColumn('number', 'Envío Gratis')
      data.addColumn('number', 'Envío Pago')

      data.addRows([
        <g:each in="${muestras}" var="muestra">
            ['',${muestra.porcentajeEnvioGratis}, (100-${muestra.porcentajeEnvioGratis})],
        </g:each>
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
        document.getElementById('ex1'))

      chart.draw(data, options)
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

    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script>
    google.load('visualization', '1', {packages: ['corechart']})
    google.setOnLoadCallback(drawChart)

    function drawChart() {

      var data = new google.visualization.DataTable()
      data.addColumn('string', 'Tipo de vendedor')
      data.addColumn('number', 'Gold')

      data.addRows([
        <g:each in="${muestras}" var="muestra">
            ['',${muestra.ventasPorTipoVendedor.ventas}],
        </g:each>
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
        document.getElementById('ex2'))

      chart.draw(data, options)
    }
    </script>
    <script type="text/javascript"
          src="https://www.google.com/jsapi?autoload={
            'modules':[{
              'name':'visualization',
              'version':'1',
              'packages':['corechart']
            }]
          }">
    </script>

    <script type="text/javascript">
      google.setOnLoadCallback(drawChart)

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Fecha', 'Promedio Precio', 'Precio Minimo', 'Precio Máximo'],
          <g:each in="${muestras}" var="muestra">
            ['',${muestra.precioPromedio}, ${muestra.precioMin}, ${muestra.precioMax}],
          </g:each>
        ]);

        var options = {
          title: 'Estadísticas de la busqueda a lo largo del tiempo',
          curveType: 'function',
          legend: { position: 'bottom' }
        }

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'))

        chart.draw(data, options)
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
          ['Fecha', 'Ventas Promedio'],
          <g:each in="${muestras}" var="muestra">
            ['',${muestra.ventasPromedio}],
          </g:each>
        ]);

        var options = {
          title: 'Estadísticas de la busqueda a lo largo del tiempo',
          curveType: 'function',
          legend: { position: 'bottom' }
        }

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart2'))

        chart.draw(data, options)
      }

    </script>
  </head>
  <body>
	 <br><br>
	 <div align="center"><h2><span class="label label-info">${nombreBusq}</span></h2></div>
	 <div id="ex1"></div>
   <div id="curve_chart" style="align:center; width: 700px; height: 250px;"></div>
   <div id="curve_chart2" style="align:center; width: 700px; height: 250px;"></div>
   <div id="ex2"></div>
  </body>
</html>
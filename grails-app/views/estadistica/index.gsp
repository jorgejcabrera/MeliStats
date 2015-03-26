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
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Tipo de Vendedor', 'Ventas'],
          ['Platinum',     ${muestras.ventasPorTipoVendedor.last()['platinum']?: 0}],
          ['Gold',      ${muestras.ventasPorTipoVendedor.last()['gold']?: 0}],
          ['Silver',  ${muestras.ventasPorTipoVendedor.last()['silver']?: 0}]
        ]);

        var options = {
          title: 'Ventas por Tipo de Vendedor'
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
          title: 'Ventas Promedio a lo largo del tiempo',
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
	 <div align="center"><h2><span class="label label-info">Estadísticas de: ${nombreBusq}</span></h2></div>
   <div align="center">
      <div id="ex1"></div>
      <div id="curve_chart" style="align:center; width: 1000px; height: 300px;"></div>
      <div id="curve_chart2" style="align:center; width: 1000px; height: 300px;"></div>
      <div id="piechart" style="width: 900px; height: 500px;"></div>
    </div>
  </body>
</html>
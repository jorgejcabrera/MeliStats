# MeliStats

*MeliStats* es un proyecto integrador de la  capacitación de **MeliAcademy**.
  Consiste en un sitio web que, a través de la **API de Mercadolibre**, obtiene
  **estadísticas** de los productos publicados, y genera información pertinente tanto para
  vendedores como compradores.
  
  Con los datos, *MeliStats* genera gráficos a lo largo del tiempo, los cuales pueden 
  ser consultados por los usuarios del sitio.
  Estos a su vez pueden ver las consultas que efectúen en su pefil para un más facil
  acceso, y **recibir recomendaciones** de productos en base a preferencias personalizadas.
  
  Para el desarrollo se utilizaron las tecnologías vistas en la capacitación; **Groovy** y **Grails** para el *back end*,
  **HTML**, **CSS** y **JavaScript** para el  *front end*. La base de datos utilizada es **MySQL**.
  
Configuracion
=============

Previo a poder ejecutar la aplicación, es necesario tener grails y mysql instalados.

Grails:
```bash
curl -s get.gvmtool.net | bash
gvm install grails
```

MySQL:

  [Sitio web de MySQL](http://www.mysql.com/downloads/)
  
  En Ubuntu/Debian: 
  ```
  sudo apt-get install mysql-server mysql-client
  ```
  
  Configurar posteriormente un usuario y contraseña. A continuación crear la base de datos del proyecto:
  ```
  mysql> create database melistats;
  ```
  
Una vez instalado Grails, se debe crear un archivo '**MeliStats-config.groovy**' en la carpeta **.grails**, 
que se encuentra en el home del usuario. Dentro del archivo se debe incluir lo siguiente:

```
dataSource.username = "<usuario>"
dataSource.password = "<contraseña>"

```
Donde <usuario> y <contraseña> corresponden al usuario y contraseña de su usuario de MySQL.

Ejecución
=========

En la carpeta del proyecto:

```
grails run-app
```

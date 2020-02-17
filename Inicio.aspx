<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Inicio.aspx.vb" Inherits="SARTI_FV2._0.Inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <!--META VIEWPORT -->
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
    <link rel="stylesheet" href="Bootstrap/css/bootstrap.css" />    <!-- ESTILOS BOOTSTRAP-->
    <link rel="stylesheet" href="Estilos_SARTI.css"/>    <!-- ESTILOS CREADOS -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">  <!-- ICONOS -->
     <!-- JS -->
     <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

    <title>Vigia | SARTI</title>
</head>
<body>
                <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="Inicio.aspx">Grupo Vigia | SARTI</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarText">
    <ul class="navbar-nav mr-auto">
        <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Administrador
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="RegistrarAdministrador.aspx">Registrar Administrador</a>
            <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="ModificarAdmin.aspx">Editar Administrador</a>          
          
          
        </div>
      </li>
        <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Empleado
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="RegistrarUsuario.aspx">Registrar Empleado</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="ReporteDeUsuarios.aspx">Empleados</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="InformacionAdicional.aspx">Información adicional</a>
      </li>
        <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Equipo
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="AgregarEquipo.aspx">Registar equipo</a>
          <div class="dropdown-divider"></div>       
          <a class="dropdown-item" href="ReporteDeEquipos.aspx">Equipos</a> 
          <div class="dropdown-divider"></div>       
          <a class="dropdown-item" href="Reporteador.aspx">Reportes</a> 
        </div>
      </li>  
         <li class="nav-item">
        <a class="nav-link" href="AsignarEquipo_Step1.aspx">Asignar equipo   </a>
      </li>
                 <li class="nav-item">
        <a class="nav-link" href="DesenlazarEquipo.aspx">Desenlazar equipo</a>
      </li>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <li class"nav-item">
            <a class="btn btn-primary" href="ReporteDeReemplazos.aspx" role="button">Equipos a reemplazo </a>
        </li>
        
       
    </ul>
   <a href="Default.aspx">
       <span class="navbar-text">
      <i class="fas fa-power-off"></i>
    </span>
       </a>
  </div>
</nav>
    <br> <!--MENU -->
   <div class="container">
        <div class="pb-2 mt-4 mb-2 border-bottom">
            <H2 class="texto">¡Bienvenido a SARTI!<br> </H2>            
        </div>
            <H2 class="texto"><small>Sistema para administracion de los recursos de TI.</small> </H2>  <br />
            <p>Con este sistema podras administrar diferentes ambitos como los siguientes:</p>
            <ul>
                <li>Registrar cada recurso que ingrese a la empresa.</li>
                <li>Ver el estato del bien.</li>
                <li>Obtener detalles como, usuario al que se asigno, condicion del equipo, fecha de entrega etc.</li>
            </ul>   
           <div class="texto  ">
               <h4>Informacion sobre los modulos.</h4><br />
           </div>
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                   <div class="card" style="width: 18rem;">
                      <div class="card-body">
                        <h5 class="card-title  texto "> Informacíon adicional</h5>
                        <p class="card-text">Genera la información necesaria para iniciar con los procesos de alta de usuario, registro de equipo y asignación de un equipo.</p>
                      </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                   <div class="card" style="width: 18rem;">
                      <div class="card-body">
                        <h5 class="card-title  texto ">Administrador</h5>                
                        <p class="card-text">Crea y administra los usuarios que administran la plataforma.</p>
                      </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                   <div class="card" style="width: 18rem;">
                      <div class="card-body">
                        <h5 class="card-title  texto ">Empleado</h5>                
                        <p class="card-text">Crea y administra los usuarios a los cuales se les asignaran los equipos existentes en el sistema.</p>
                      </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                   <div class="card" style="width: 18rem;">
                      <div class="card-body">
                        <h5 class="card-title  texto ">Equipo</h5>                
                        <p class="card-text">Registra, administra y visualiza reportes de los equipos registrados en el sistema.</p>
                      </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                   <div class="card" style="width: 18rem;">
                      <div class="card-body">
                        <h5 class="card-title  texto ">Asignar equipo</h5>                
                        <p class="card-text">Asigna a un empleado un equipo existente en Stock e imprime una responsiva con los datos de equipo y usuario como evidencia de la entrega.</p>
                      </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                   <div class="card" style="width: 18rem;">
                      <div class="card-body">
                        <h5 class="card-title  texto ">Desenlazar equipo</h5>                
                        <p class="card-text">Desenlaza un equipo asignado a un usuario y mandalo a stock.</p>
                      </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                   <div class="card" style="width: 18rem;">
                      <div class="card-body">
                        <h5 class="card-title  texto ">Equipos a reemplazo</h5>                
                        <p class="card-text">Visualiza un reporte de los equipos con un plazo de trabajo vencido (plazo de 3 años).</p>
                      </div>
                    </div>
                </div>
            </div>


       <br /><br /><br />
    </div>
</body>
</html>

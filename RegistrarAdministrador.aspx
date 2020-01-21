<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="RegistrarAdministrador.aspx.vb" Inherits="SARTI_FV2._0.RegistrarAdministrador" %>

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

    <script type="text/javascript">

        function VaidaPass() {
            var pass1 = document.getElementById('Contraseña').value;
            var pass2 = document.getElementById('ConfirmContraseña').value;
            if (pass1 == pass2) {
                return true ;
            } else {
                alert('Asegurate de que los campos de contraseña sean iguales.');
                return false;
            }
        }

    </script>
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
    <br><br>
    <div class="container">    
         <div class="pb-2 mt-4 mb-2 border-bottom">
            <H2 class="texto">Agregar administrador.</H2>
    </div>
   <br>
            
            <form action="RegistrarAdministrador.aspx" method="post">
            <div class="row texto">
                <div class="col-lg-6">
                    <p>Nombre</p>
            <input class="form-control" name="Nombre" placeholder="" type="text" required>
                </div>
                <div class="col-lg-6">
                    <p>Correo:</p>
            <input class="form-control" name="Correo" placeholder="" type="email" required>
                </div>            
            </div><br>
              <div class="row texto">
                <div class="col-lg-6">
                   <p>Contraseña:</p>
            <input class="form-control" name="Contraseña" placeholder="" type="password" id="Contraseña" required>
                </div>
                <div class="col-lg-6">
                     <p>Confirmar contraseña:</p>
            <input class="form-control" name="ConfirmContraseña" placeholder="" type="password" id="ConfirmContraseña" required><br>
                </div>            
            </div>
                <asp:Panel ID="Pnl_Exito" runat="server" Visible="False">
               <div class="alert alert-success" role="alert">
                   <asp:Label ID="Lbl_Exito" runat="server" Text="Label"></asp:Label>
</div><br></asp:Panel>
                <asp:Panel ID="Pnl_error" runat="server" Visible="False">
            <div class="alert alert-danger" role="alert">
                <asp:Label ID="Lbl_Error" runat="server" Text="Label"></asp:Label>
</div><br></asp:Panel>
            
            <button type="submit" class="btn btn-outline-primary" onclick="return VaidaPass()">Ingresar usuario</button><br><br>
             </form>
        </div>
</body>
</html>

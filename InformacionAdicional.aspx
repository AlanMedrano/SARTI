<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="InformacionAdicional.aspx.vb" Inherits="SARTI_FV2._0.InformacionAdicional" %>

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

        function MuestraDiv(div) {
            var Opcion = document.getElementById('ListInfoAd') ;

            var Departamento = document.getElementById('departamento');
            var Ubicación = document.getElementById('Ubicacion');
            var Tipequipo = document.getElementById('TipoEquipo');
            var Puesto = document.getElementById('Puesto');
            var Empresa = document.getElementById('Empresa');

            if (div.value == 1) {
                Departamento.style.display = 'block';
                Ubicación.style.display = 'none';
                Tipequipo.style.display = 'none';
                Puesto.style.display = 'none';
                Empresa.style.display = 'none';

            } else if (div.value == 2) {
                Ubicación.style.display = 'block';
                Departamento.style.display = 'none';
                Tipequipo.style.display = 'none';
                Puesto.style.display = 'none';
                Empresa.style.display = 'none';

            } else if (div.value == 3) {
                Tipequipo.style.display = 'block';
                Departamento.style.display = 'none';
                Puesto.style.display = 'none';
                Ubicación.style.display = 'none';
                Empresa.style.display = 'none';

            } else if (div.value == 4) {
                Puesto.style.display = 'block';
                Departamento.style.display = 'none';
                Tipequipo.style.display = 'none';
                Ubicación.style.display = 'none';
                Empresa.style.display = 'none';

            } else if (div.value == 5) {
                Empresa.style.display = 'block';
                Departamento.style.display = 'none';
                Tipequipo.style.display = 'none';
                Puesto.style.display = 'none';
                Ubicación.style.display = 'none';

            }
          
        } // function show and hide divs


        function ValidaDatos() {
            var Opcion = document.getElementById('ListInfoAd');
            var form_departamento = document.getElementById('form_departamento').value;
            var form_ubicacion = document.getElementById('form_ubicacion').value;
            var form_tipoequipo = document.getElementById('form_tipoequipo').value;
            var form_puesto = document.getElementById('form_puesto').value;
            var form_tiemporotacion = document.getElementById('form_tiemporotacion').value;
            var form_empresa = document.getElementById('form_empresa').value;
            var Estatus_Validacion = true

            switch (Opcion.value) {               
                case '1':
                    if (form_departamento == '') {
                       
                        alert('Por favor ingresa el campo Departamento');
                        return false;
                    } else {
                        return true;
                    }
                    break;
                case '2':
                    if (form_ubicacion == '') {
                        alert('Por favor asegurate de llenar el campo Ubicacion');
                        return false;
                    } else {
                        return true;
                    }
                    break;
                case '3':
                    if (form_tipoequipo == '') {
                        alert('Por favor asegurate de llenar el campo Tipo de Equipo.');
                        return false;
                    } else {
                        return true;
                    } 
                    break;
                case '4':
                    if (form_puesto == '' || form_tiemporotacion == '') {
                        alert('Por favor asegurate de llenar el campo Puesto y tiempo de rotacion.');
                        return false;
                    } else {
                        return true;
                    } 
                    break;
                case '5':
                    if (form_empresa == '') {
                        alert('Por favor asegurate de llenar el campo Empresa.');
                        return false;
                    } else {
                        return true;
                    }
                    break;

            } // fin case
          

        } // fin function ValidaDatos

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
        <H2 class="texto">Modulo de información adicional.</H2>
    </div> <br><br>
          <form action="InformacionAdicional.aspx" method="post" onsubmit="return ValidaDatos()">
            <div class="row" >
                <div class="col-lg">
            <b class="texto">Selecciona el modulo al que deseas agragar información:</b>    
                </div>
                <div class="col-lg">
                   
           <select id="ListInfoAd" name="ListInfoAd" class="form-control" onchange="MuestraDiv(this)" >               
               <option value="1">Departamento</option>
               <option value="2">Ubicación</option>
               <option value="3">Tipo de equipo</option>
               <option value="4">Puesto</option>
                <option value="5">Empresa</option>
            </select>  
                    
                </div>            
            </div> <br><br>
    <div id="departamento" class="texto " style="display:block">
        <p>Ingresa el departamento:</p>   
        <input class="form-control"  placeholder="Sistemas" name="departamento" id="form_departamento" /> <br>
            
            </div>        
    <div id="Ubicacion" class="texto" style="display:none">
            <p>Agregar ubicación:</p>
        <input class="form-control" name="Ubicacion" placeholder="Oficinas UU" id="form_ubicacion" /><br>
        <p>Link de la ubicación:</p>
            <input class="form-control" name="LinkUbicacion" placeholder="www.google.com/maps" id="form_LinkUbicacion" /> 
            
            </div>
    <div id="TipoEquipo" class="texto" style="display:none"><br>
        <p>Tipo de equipo:</p>
            <input class="form-control" name="TipoEquipo" placeholder="Laptop" id="form_tipoequipo"/>            
            </div>
    <div id="Puesto" class="texto" style="display:none"><br>           
        <div class="row">
            <div class="col-lg-8">
             <p>Puesto:</p>
        <input class="form-control" placeholder="Gerente de TI" name="Puesto" id="form_puesto"/>
            </div>
            <div class="col-lg-4">
             <p>Tiempo de rotación por año:</p>        
        <input class="form-control"  type="number" min="1" name="TiempoRotacion" id="form_tiemporotacion"/>            
            </div>       
        </div>        
            </div><br>            
            <div id="Empresa" style="display:none">
            <p class="texto">Nombre de empresa:</p>
            <input class="form-control" name="empresa" placeholder="SAVSA" id="form_empresa" />
            
            </div>
           <br> 
            <asp:Panel ID="Pnl_exito" runat="server" Visible="False">
               <div class="alert alert-success" role="alert">
                   <asp:Label ID="Lbl_Exito" runat="server" Text="Label"></asp:Label>
</div>
            </asp:Panel>

            <asp:Panel ID="Pnl_error" runat="server" Visible="False">
                               <div class="alert alert-danger" role="alert">
                   <asp:Label ID="Lbl_Error" runat="server" Text="Label"></asp:Label>
</div>
            </asp:Panel>

            <br />
         <button type="submit" class="btn btn-outline-primary" >Agregar</button>   <br><br>     
            </form>
    </div>
</body>
</html>

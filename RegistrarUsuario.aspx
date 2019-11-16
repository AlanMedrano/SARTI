<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="RegistrarUsuario.aspx.vb" Inherits="SARTI_FV2._0.RegistrarUsuario" %>

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

        function VaidaUsuario() {
            var puesto = document.getElementById('DDL_Puesto').value;
            var empresa = document.getElementById('DDL_Empresa').value;
            var departamento = document.getElementById('DDL_departamento').value;
            var ubicacion = document.getElementById('DDL_Ubicacion').value;

            if (puesto == 0) {
                alert('Por favor selecciona el puesto.');
                return false;                
            } else {
                if (empresa == 0) {
                    alert('Por favor selecciona la empresa.');
                    return false;
                } else {
                    if (departamento == 0) {
                        alert('Por favor selecciona el departamento.');
                        return false;
                    } else {
                        if (ubicacion == 0) {
                            alert('Por favor selecciona la ubicacion.');
                            return false;
                        } else {
                            return true;
                        }
                    }
                }
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
        <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Equipo
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="AgregarEquipo.aspx">Registar equipo</a>
          <div class="dropdown-divider"></div>       
          <a class="dropdown-item" href="ReporteDeEquipos.aspx">Equipos</a> 
        </div>
      </li>  
         <li class="nav-item">
        <a class="nav-link" href="InformacionAdicional.aspx">Información adicional</a>
      </li>
         <li class="nav-item">
        <a class="nav-link" href="AsignarEquipo_Step1.aspx">Asignar equipo   </a>
      </li>
                 <li class="nav-item">
        <a class="nav-link" href="DesenlazarEquipo.aspx">Desenlazar equipo</a>
      </li>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <li class"nav-item">
            <a class="btn btn-primary" href="ReporteDeReemplazos.aspx" role="button">Equipos a reemplazo <span class="badge badge-light">4</span></a>
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

     <div class="container texto"><br><br>
           <H2 class="texto">Registro de Empleado.</H2><br>
           
            <form action="RegistrarUsuario.aspx" method="post" runat="server" onsubmit="return VaidaUsuario()">
            <div class="row">
                <div class="col-lg-4">
                 <p>Nombre:</p>

            <input class="form-control" placeholder="" name="nombre" type="text" required>
                </div>
                <div class="col-lg-4">
                <p>Correo:</p>
            <input class="form-control" type="email" name="correo" required>
                </div>
                <div class="col-lg-4">
                     <p>Num empleado:</p>
                <input class="form-control" name="NEmpleado" type="number" required/>

                </div>
               
            </div><br>
            
            <div class="row">
                <div class="col-lg-6">
                  <p>Puesto:</p>

                    <asp:DropDownList ID="DDL_Puesto" name="DDL_Puesto" runat="server" CssClass="form-control" >
                        <asp:ListItem Value="0">Selecciona un puesto</asp:ListItem>
                    </asp:DropDownList>

                </div>
                <div class="col-lg-6">
                 <p>Empresa:</p>

                    <asp:DropDownList ID="DDL_Empresa" name="DDL_Empresa" runat="server" cssclass="form-control" >
                        <asp:ListItem Value="0">Selecciona una empresa</asp:ListItem>
                    </asp:DropDownList>

                </div>
            
            </div> <br>
             <div class="row">
                <div class="col-lg-6">
                    <p>Departamento:</p>

                    <asp:DropDownList ID="DDL_departamento" name="DDL_departamento" runat="server" CssClass="form-control">
                        <asp:ListItem Value="0">Selecciona un departamento</asp:ListItem>
                    </asp:DropDownList>

                </div>
                <div class="col-lg-6">
                    <p>Ubicación</p> 


                    <asp:DropDownList ID="DDL_Ubicacion" name="DDL_Ubicacion" runat="server" CssClass="form-control">
                        <asp:ListItem Value="0">Selecciona una ubicacion</asp:ListItem>
                    </asp:DropDownList>
<br>
                
                </div>
            
            </div>
         <asp:Panel ID="pnl_exito" runat="server" Visible="False">
              <div class="alert alert-success" role="alert">
                  <asp:Label ID="lbl_exito" runat="server" Text="Label"></asp:Label>
</div>
         </asp:Panel>
           
         <asp:Panel ID="pnl_error" runat="server" Visible="False">
             <div class="alert alert-danger" role="alert">
                 <asp:Label ID="lbl_error" runat="server" Text="Label"></asp:Label>
</div>
         </asp:Panel>
            
            
            <button class="btn btn-outline-primary" type="submit">Registrar usuario</button><br><br>
           </form> 
    </div>
</body>
</html>

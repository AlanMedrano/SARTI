<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ModificarUsuario.aspx.vb" Inherits="SARTI_FV2._0.ModificarUsuario" %>

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
    <script>
        $(document).ready(function () {
            $('#N_empleado').on('input', function () {
                this.value = this.value.replace(/[^0-9]/g, '');
            });
        });


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
     <div class="container"><br/>
                    <div class="pb-2 mt-4 mb-2 border-bottom">
        <H2 class="texto">Empleado.</H2>
    </div><br />
         <div class="row texto">
             <div class="col-lg-4">
                 <b>Nombre: </b><asp:Label ID="lbl_nombre" runat="server" Text="Label"></asp:Label>
             </div>
             <div class="col-lg-4">
                 <b>Correo: </b><asp:Label ID="lbl_correo" runat="server" Text="Label"></asp:Label>
             </div>
             <div class="col-lg-4">
                 <b>N° de empleado: </b><asp:Label ID="lbl_nempleado" runat="server" Text="Label"></asp:Label>
             </div>
         </div>
         <div class="row texto">
             <div class="col-lg-4">
                 <b>Departamento: </b><asp:Label ID="lbl_departamento" runat="server" Text="Label"></asp:Label>
             </div>
             <div class="col-lg-4">
                 <b >Empresa: </b><asp:Label ID="lbl_empresa" CssClass="texto" runat="server" Text="Label"></asp:Label>
             </div>
             <div class="col-lg-4">
                 <b>Puesto: </b><asp:Label ID="lbl_puesto" runat="server" Text="Label"></asp:Label>
             </div>
         </div>
         <div class="row">
             <div class="col-lg-4">
                 <b class="texto">Ubicacion: </b><asp:HyperLink  ID="lbl_ubicacion" runat="server" Target="_blank"></asp:HyperLink>            
                 
             </div>
             <div class="col-lg-4">
                 <b class="texto">Estatus: </b><asp:Label CssClass="texto" ID="lbl_Estatus" runat="server" Text=""></asp:Label>
             </div>
             <div class="col-lg-4"></div>
         </div>
         
         <br /><br />

          <asp:Panel ID="pnl_mensaje" runat="server" Visible="false">
              <div class="alert alert-success" role="alert">
                El usuario se modificado exitosamente.
                </div><br/>
          </asp:Panel>

         <asp:Panel ID="pnl_Relacionequipo" runat="server" Visible="false">
            <div class="alert alert-warning" role="alert">
            <strong><i class="fas fa-exclamation-triangle"></i>  </strong> Para inactivar un usuario es necesario que no tenga equipos asignados, por favor valida en la seccion <strong> Desenlazar equipo</strong> que el usuario no tenga equipos asignados.    
            </div>
         </asp:Panel>

    <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
    Actualizar información
  </button><br /><br />

         <form runat="server">

         <div class="collapse" id="collapseExample">
  <div class="card card-body">

             <div id="pnl_UpdateEmpleado">
            <div class="row texto">
                <div class="col-lg-6">
                 <p>Nombre:</p>
            <input class="form-control" placeholder="" name="nombre" type="text" >
                </div>
                <div class="col-lg-6">
                <p>Correo:</p>
            <input class="form-control" type="email" name="correo" >
                </div>
            
            </div><br>
            
            <div class="row texto">
                <div class="col-lg-6">
                  <p>Puesto:</p>
                    <asp:DropDownList ID="DDL_Puesto" name="DDL_Puesto" runat="server" CssClass="form-control" >
                        <asp:ListItem Value="">Selecciona un puesto</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-lg-6">
                 <p>Empresa:</p>
                    <asp:DropDownList ID="DDL_Empresa" name="DDL_Empresa" runat="server" cssclass="form-control" >
                        <asp:ListItem Value="">Selecciona una empresa</asp:ListItem>
                    </asp:DropDownList>
                </div>
            
            </div> <br>
            <div class="row texto">
                <div class="col-lg-6">
                    <p>Departamento:</p>
                    <asp:DropDownList ID="DDL_departamento" name="DDL_departamento" runat="server" CssClass="form-control">
                        <asp:ListItem Value="">Selecciona un departamento</asp:ListItem>
                    </asp:DropDownList>
                
                </div>
                <div class="col-lg-6">
                    <p>Ubicación</p> 
                    <asp:DropDownList ID="DDL_Ubicacion" name="DDL_Ubicacion" runat="server" CssClass="form-control">
                        <asp:ListItem Value="">Selecciona una ubicacion</asp:ListItem>
                    </asp:DropDownList><br>
                
                </div>
            
            </div>
            <div class="row texto">
                <div class="col-lg-6 ">
                    <p>Estatus:</p>
                    <asp:DropDownList ID="DDL_Estatus" name="DDL_Estatus" runat="server" CssClass="form-control">
                        <asp:ListItem Value="">Actualiza el estatus</asp:ListItem>
                        <asp:ListItem Value="Activo">Activo</asp:ListItem>
                        <asp:ListItem Value="Inactivo">Inactivo</asp:ListItem>
                    </asp:DropDownList><br>
                </div>
                <div class="col-lg-6"></div>
            </div><br>
            <div class="alert alert-primary" role="alert">
                <i class="fas fa-money-check"></i> Por favor ingresa solo los campos que deseas actualizar.
            </div>
 

            <button class="btn btn-outline-primary" type="submit">Modificar empleado</button><br><br>
       </div>
      </div>
             </div><br /><br />
         </form>

    </div>
</body>
</html>

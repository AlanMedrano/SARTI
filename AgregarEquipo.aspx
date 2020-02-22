<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AgregarEquipo.aspx.vb" Inherits="SARTI_FV2._0.AgregarEquipo" %>

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

    <script type="text/javascript" >

        function ValidaEquipo() {

            var USB = document.getElementById('usb').value;
            var HDMI = document.getElementById('hdmi').value;
            var VGA = document.getElementById('vga').value;
            var PuertoRed = document.getElementById('Puertod_red').value;
            var CD = document.getElementById('cd').value;
            var TiempoGarantia = document.getElementById('TiempoGarantia').value;
            var TipoDeEquipo = document.getElementById('DDL_TipoDeEquipo').value

            if (USB == '') {
                document.getElementById('usb').value = 0 ;
                
            }
            if (HDMI == '') {
                document.getElementById('hdmi').value = 0 ;
            }
            if (VGA == '') {
                VGA = document.getElementById('vga').value = 0 ;
            }
            if (PuertoRed == '') {
                PuertoRed = document.getElementById('Puertod_red').value = 0 ;
            }
            if (CD == '') {
                CD = document.getElementById('cd').value = 0 ;
            }
            if (TiempoGarantia == '' ) {
                TiempoGarantia = document.getElementById('TiempoGarantia').value = 0;
                // return false;
            } 
                if (TipoDeEquipo < 1) {
                    alert('Por favor selecciona un valor valido en "Tipo de equipo"');
                    return false;

                } else {
                    return true;
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
            <a class="btn btn-primary" href="ReporteDeReemplazos.aspx" role="button">Equipos a reemplazo  </a>
        </li>
        
       
    </ul>
   <a href="Default.aspx">
       <span class="navbar-text">
      <i class="fas fa-power-off"></i>
    </span>
       </a>
  </div>
</nav>
     <div class="container texto">
         <div class="pb-2 mt-4 mb-2 border-bottom">
        <H2 class="texto">Registro de nuevo equipo.</H2>
    </div><br>
                <form method="post" action="AgregarEquipo.aspx" onsubmit="return ValidaEquipo()" runat="server">       
            <div class="row">
               <div class="col-lg-4">
                <p>Modelo</p>
                <input class="form-control" name="modelo" placeholder="" type="text" required>
                
                </div>
                <div class="col-lg-3">
                <p>Marca</p>
                <input class="form-control" name="marca" placeholder="" type="text" required>
                
                </div>

                <div class="col-lg-3">
                    <p>Tipo de equipo:</p>
                    <asp:DropDownList CssClass="form-control" name="TipoDeEquipo" ID="DDL_TipoDeEquipo" runat="server" required>
                        <asp:ListItem Enabled="True" Selected="True" Value="0">Selecciona Tipo de Equipo</asp:ListItem>
                    </asp:DropDownList>
                </div>
               
                <div class="col-lg-2">
                <p>Fecha de compra</p>
                <input class="form-control" name="feccompra" placeholder="" type="date" required>
                
                </div>
            
            </div>
            <br>
            <div class="row">
            
            <div class="col-lg-6">
                <p>Empresa compradora</p>
                <asp:DropDownList ID="ddlEmpComp" runat="server" DataSourceID="dsEmpresas" DataTextField="Empresa" DataValueField="IdEmpresa" CssClass="form-control" required></asp:DropDownList><br />
                <p>Observaciones</p>
            <textarea class="form-control" rows="5" name="detalles"></textarea>
                
                </div>
            <div class="col-lg-6">
                <p>Falla</p>
            <textarea class="form-control" name="falla"></textarea><br>
                 <p>Num factura</p>
                
                <input class="form-control" name="nfactura"   required><br>
                <footer class="blockquote-footer"><i class="fas fa-file-image"></i>  Carga la factura del equipo <cite title="Source Title">(formatos .JPG, .PNG o .PDF).</cite></footer>
                <asp:FileUpload ID="FUpload_Factura" runat="server"  />
                <!--
                <div class="custom-file">
                    <input type="file" class="custom-file-input" id="Filefactura" name="Filefactura" accept="image/*" disabled>
                    <label class="custom-file-label" for="customFile">Cargar factura</label>
                </div>
                -->
                </div>            
            </div>            
            <br>
            <div class="row">
                <div class="col-lg-2">
                <p>Puerto USB</p>
            <input class="form-control" name="usb" placeholder="" type="number" min="0" id="usb" >
                
                </div>
                <div class="col-lg-2">
                <p>Puerto HDMI</p>
            <input class="form-control" name="hdmi" placeholder="" type="number" min="0" id="hdmi" >
                
                </div>
                <div class="col-lg-2">
                <p>VGA</p>
            <input class="form-control" name="vga" placeholder="" type="number" min="0" id="vga" >
                
                </div>
                <div class="col-lg-2">
                <p>Puertos de Red</p>
            <input class="form-control" name="Puertod_red" placeholder="" type="number" min="0" id="Puertod_red" >
                
                </div>
                <div class="col-lg-2">
                 <p>Unidad de CD</p>
            <input class="form-control" name="cd" placeholder="" type="number" min="0" id="cd" >
                </div>
                <div class="col-lg-2">
                    
                     <p>Meses de garantia</p>
            <input class="form-control" name="tiempogarantia" placeholder="" type="number" min="0" id="TiempoGarantia" >
                   
                </div>
            </div>
              <br>

            <div class="row">
                <div class="col-lg-3">
                    <p>N° de serie:</p>
                    <input class="form-control" name="NSerie" required/>
                </div>
                <div class="col-lg-3">
                    <p>Procesador:</p>
                    <input name="procesador" class="form-control"/>

                                 
                </div>
                <div class="col-lg-3">
                    <p>RAM:</p>
                    <input name="ram" placeholder="4 GB" class="form-control"/>

                </div>
                <div class="col-lg-3">
                    <p>Disco duro:</p>
                    <input name="discoduro" placeholder="500 GB" class="form-control"/>
                </div>

            </div><br />
                       <div class="custom-control custom-switch">
  <input type="checkbox" class="custom-control-input" id="inp_bluetooth" name="inp_bluetooth">
  <label class="custom-control-label" for="inp_bluetooth">Bluetooth</label>
</div>

<br />
         <asp:Panel ID="Pnl_exito" runat="server" Visible="False">
         <div class="alert alert-success">
  <strong><i class="far fa-check-square"></i> ¡Equipo agregado!</strong> <asp:Label ID="lbl_exito" runat="server" Text="Label"></asp:Label>
</div> 
         </asp:Panel>
          <asp:Panel ID="pnl_error" runat="server" Visible="False">
         <div class="alert alert-danger">
  <strong><i class="fas fa-exclamation-triangle"></i> ¡Vaya al parecer algo paso!</strong> <asp:Label ID="lbl_error" runat="server" Text="Label"></asp:Label>
</div> 
         </asp:Panel>
        <asp:Panel ID="pnl_errorImg" runat="server" Visible="false">
            <div class="alert alert-danger">
                <strong><i class="fas fa-exclamation-triangle"></i> ¡Vaya al parecer algo salio mal! </strong> <asp:Label ID="lbl_error_img" Text="" runat="server"></asp:Label>
            </div>  

        </asp:Panel>
    <button class="btn btn-outline-primary btn-lg" type="submit" text="Registrar">Registrar equipo</button><br><br> <br>
   
                    </form>
                    </div>
    <asp:SqlDataSource ID="dsEmpresas" runat="server" ConnectionString="<%$ ConnectionStrings:SARTIConn %>" SelectCommand="SELECT * FROM empresa"></asp:SqlDataSource>
</body>
</html>

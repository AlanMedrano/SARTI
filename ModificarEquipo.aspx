<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ModificarEquipo.aspx.vb" Inherits="SARTI_FV2._0.ModificarEquipo" %>

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
     <div class="container texto">
         <div class="pb-2 mt-4 mb-2 border-bottom">
        <H2 class="texto">Modificar equipo.</H2>
    </div><br/>
         <form method="post" action="ModificarEquipo.aspx" onsubmit="" runat="server">    
         <!-- AREA DE CONSULTA DE DATOS DEL EQUIPO -->
         <div class="row">
             <div class="col-lg-2">
                 <b>N° Serie: </b> <asp:Label id="lbl_NSerie" runat="server" Text=""></asp:Label>
             </div>
             <div class="col-lg-2">
                 <b>Modelo:</b>                 
                 <asp:Label ID="lbl_Modelo" runat="server" Text=""></asp:Label>
             </div>
             <div class="col-lg-2">
                 <b>Marca: </b>
                 <asp:Label ID="lbl_Marca" runat="server" Text=""></asp:Label>
             </div>
             <div class="col-lg-2">
                 <b>Tipo de equipo: </b>
                 <asp:Label ID="lbl_TipoEquipo" runat="server" Text=""></asp:Label>
             </div>
             <div class="col-lg-2">
                 <b>Fecha de compra: </b>
                 <asp:Label ID="lbl_FechaCompra" runat="server" Text=""></asp:Label>
             </div>
             <div class="col-lg-2">
                 <b>Procesador: </b>
                 <asp:Label ID="lbl_procesador" runat="server" Text=""></asp:Label>
             </div>
         </div><br />
         <div class="row">
             <div class="col-lg-2">
                <b>Puertos USB: </b><asp:Label ID="lbl_PuertosUSB" runat="server" Text=""></asp:Label><br />                                    
             </div>
             <div class="col-lg-2">
                 <b>Puertos HDMI: </b><asp:Label ID="lbl_PuertosHDMI" runat="server" Text=""></asp:Label>
             </div>
             <div class="col-lg-2">
                 <b>Puertos VGA: </b> <asp:Label ID="lbl_PuertosVGA" runat="server" Text=""></asp:Label>
             </div>
             <div class="col-lg-2">
                 <b>Puertos de Red: </b> <asp:Label ID="lbl_PuertosRed" runat="server" Text=""></asp:Label>
             </div>
             <div class="col-lg-2">
                 <b>Unidades CD: </b> <asp:Label ID="lbl_UnidadCD" runat="server" Text=""></asp:Label>
             </div>
             <div class="col-lg-2">
                 <b>Años de garantia: </b> <asp:Label ID="lbl_Garantia" runat="server" Text=""></asp:Label>
             </div>
         </div><br />
         <div class="row">
             <div class="col-lg-2">
                 <b>RAM: </b> <asp:Label ID="lbl_RAM" runat="server" Text=""></asp:Label>
             </div>
             <div class="col-lg-2">
                 <b>Disco duro: </b> <asp:Label ID="lbl_DiscoDuro" runat="server" Text=""></asp:Label>
             </div>
             <div class="col-lg-2">
                 <b>Num Factura: </b> <asp:Label ID="lbl_NumFactura" runat="server" Text=""></asp:Label>
             </div>
             <div class="col-lg-3">
                 <b>Fallas: </b> <asp:Label ID="lbl_fallas" runat="server" Text=""></asp:Label>
             </div>
             <div class="col-lg-3">
                 <b>Detalles: </b> <asp:Label ID="lbl_Detalles" runat="server" Text=""></asp:Label>
             </div>
         </div><br /><br />
           <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                Actualizar datos de equipo
            </button><br /><br />
         <div class="collapse" id="collapseExample">
            <div class="card card-body">
      <div class="row">
               <div class="col-lg-4">
                <p>Modelo</p>
                <input class="form-control" name="modelo" placeholder="" type="text" >
                
                </div>
                <div class="col-lg-3">
                <p>Marca</p>
                <input class="form-control" name="marca" placeholder="" type="text" >
                
                </div>

                <div class="col-lg-3">
                    <p>Tipo de equipo:</p>
                        <input class="form-control" name="TipoEquipo" placeholder="" readonly>
                </div>
               
                <div class="col-lg-2">
                <p>Fecha de compra</p>
                <input class="form-control" name="feccompra" placeholder="">
                
                </div>
            
            </div>
            <br>
            <div class="row">
            
            <div class="col-lg-6">
                <p>Detalles</p>
                <textarea class="form-control" rows="9" name="detalles"></textarea>
            </div>
            <div class="col-lg-6">
                <p>Falla</p>
            <textarea class="form-control" name="falla"></textarea><br>
                 <p>Num factura</p>
            <input class="form-control" name="nfactura"   ><br>
                <div class="custom-file">
                    <input type="file" class="custom-file-input" id="Filefactura" name="Filefactura" accept="image/*" disabled>
                    <label class="custom-file-label" for="customFile">Cargar factura</label>
                </div>
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
                    
                     <p>Años de garantia</p>
            <input class="form-control" name="tiempogarantia" placeholder="" type="number" min="0" id="TiempoGarantia" >
                   
                </div>
            </div>
              <br>

            <div class="row">
                <div class="col-lg-3">
                    <p>N° de serie:</p>
                    <input class="form-control" name="NSerie" />
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

            </div>
                <div class="row">
                    <div class="col-lg-4">
                        <br />
                        <div class="custom-control custom-switch">
                            <input type="checkbox" class="custom-control-input" id="inp_bluetooth" name="inp_bluetooth">
                            <label class="custom-control-label" for="inp_bluetooth">Bluetooth</label>
                        </div>
                    </div>
                    <div class="col-lg-4"></div>
                    <div class="col-lg-4">
                        
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4">
                        <br />
                        <button class="btn btn-primary" type="submit" text="">Actualizar equipo</button>
                    </div>
                </div>
            </div>
            </div> <br /><br />
         </form>
    </div>

</body>
</html>

<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AsignarEquipo_Step3.aspx.vb" Inherits="SARTI_FV2._0.AsignarEquipo_Step3" %>

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


    <!--LIBRERIAS PARA JQ IMPRESION -->
        <script   src="https://code.jquery.com/jquery-3.3.1.min.js"   integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="   crossorigin="anonymous"></script>
    <script src="https://unpkg.com/jspdf@latest/dist/jspdf.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>

    <title>Vigia | SARTI</title>

    <script>

        $(function () {
            $('#descargar').click(function () {
                var options = {
                };
                var pdf = new jsPDF('p', 'pt', 'a4');
                pdf.setDrawColor(255, 0, 0);
                pdf.addHTML($("#imprime_pdf"), 15, 15, options, function () {
                    pdf.save('responsiva.pdf');
                });
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
        <div class="container"><br><br>

            <asp:Panel ID="pnl_exito" runat="server" Visible="False">
                                                  <div class="pb-2 mt-4 mb-2 border-bottom">
        <H2 class="texto">A continuacion se muestra la responsiva a imprimir:</H2>
    </div>
           <br><br><br>
            <button id="descargar" class="btn btn-outline-info"><i class="far fa-file-pdf"></i>  descargar responsiva</button>
            <br><br>
           <div id="imprime_pdf" >

               <div class="card">
  <div class="card-body"><br /><br />
    
                                    <div class="row">
                   <div class="col-lg-6">
                       <h3 class="texto" id="header">Responsiva entrega de equipo</h3>
                   </div>
                   <div class="col-lg-6">
                       <img class="float-right img-fluid" src="Resources/VigiaLogo.png" width="160" height="100"/>
                   </div>

                       </div><br /> <hr>  <br /><br />     
                              
      <div class="row">
        <div class="col-lg-6">
             <b class="texto">Empleado:</b>
            <asp:Label ID="lbl_empleado" runat="server" Text="Label"></asp:Label><br />
          </div>
          <div class="col-lg-6">
            <b class="texto">Departamento:</b>
              <asp:Label ID="lbl_Departamento" runat="server" Text="Label"></asp:Label><br />
          </div>
      </div><br /><br />
      <div class="row">
        <div class="col-lg-6">
              <b class="texto">Numero de empleado:</b>
            <asp:Label ID="lbl_NEmpleado" runat="server" Text="Label"></asp:Label><br />
          </div>
          <div class="col-lg-6">
           <b class="texto">Ubicación:</b>
              <asp:Label ID="lbl_ubicacion" runat="server" Text="Label"></asp:Label>
          </div>
      </div><br /><br />  <hr> <br /><br /><br />
 
                             
                 <table class="table table-striped">
    <thead>
      <tr class="texto">
               
        <th>Modelo</th>
        <th>Marca</th>  
        <th>Tipo de equipo</th>
          <th>N° serie</th>
      </tr>
    </thead>
    <tbody>
      <tr>
       
        <td><asp:Label ID="lbl_modelo" runat="server" Text="Label"></asp:Label></td>
        <td><asp:Label ID="lbl_marca" runat="server" Text="Label"></asp:Label></td>
        <td><asp:Label ID="lbl_TipoEquipo" runat="server" Text="Label"></asp:Label></td>
        <td><asp:Label ID="lbl_NSerie" runat="server" Text="Label"></asp:Label></td>
      </tr>  
    </tbody>
  </table>  <br/><br/>
      
      <p>
      <b class="texto" >Detalles:</b> <asp:Label ID="lbl_detalles" runat="server" Text="Label"></asp:Label> </p><br/>
      <b class="texto" >Falla:</b> <asp:Label ID="lbl_falla" runat="server" Text="Label"></asp:Label> </p><br/>
              <hr> 
               <br /><br /><br />
      <h5 class="texto">Politicas aplicadas a este formato:</h5><br />

<ol>
  <li>El usuario que se describe en este formato es el responsable absoluto y directo de los daños que se le ocasionen a el equipo y/o material que se le entrega</li>
  <li>En caso de extravio, daños, mal trato y mal uso del equipo y/o material que se entrega, el Dpto. de RH aplicara el reglamento correspondiente.</li>
  <li>El equipo y/o material son para uso exclusivo de empresas grupo Vigia y se debe de utilizar como herramienta de trabajo.</li>
  <li>El Departamento de Sistemas tendra la libertad de retirar el equipo y/o material en caso de que se le este dando mal uso y se le reportara con su jefe directo.</li>  
  <li>El empleado firma de conformidad de las políticas anteriores.</li>
</ol>       <br /><br /><br /><br /><br />   
            <div class="row texto">
                 <div class="col-lg-6">
                     <b>Firma de conformidad:  _________________________</b>
                 </div>
                 <div class="col-lg-6">
                     <b>Fecha de entrega:  ____________________________________</b>
                 </div>

            </div><br /><br /><br /><br /><br />
                           <div class="row texto">
                 <div class="col-lg-6">
                     <b>Entregado por:  _________________________________</b>
                 </div>
                 <div class="col-lg-6">
                     <b>Fecha de regreso (si aplica):  _________________________</b>
                 </div><br /><br /><br /><br /><br />

            </div>    
  </div>
</div>
      
            </div> <br><br><br>         
         <br /><br />  


            </asp:Panel>


            <asp:Panel ID="pnl_error" runat="server" Visible="False">
                    <div class="alert alert-danger" role="alert">
  <asp:Label ID="lbl_error" runat="server"></asp:Label>
</div>
         
            </asp:Panel>

    </div>
</body>
</html>

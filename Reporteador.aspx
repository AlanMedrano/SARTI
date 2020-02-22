<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Reporteador.aspx.vb" Inherits="SARTI_FV2._0.Reporteador" %>

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
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="LibreryDescargaExcel/js-xlsx-master/xlsx.core.js"></script>
    <script src="LibreryDescargaExcel/Blob.js-master/Blob.js"></script>
    <script src="LibreryDescargaExcel/FileSaver/FileSaver.min.js"></script>
    <script src="LibreryDescargaExcel/TableExport/dist/js/tableexport.min.js"></script>    
    <title>Vigia | SARTI</title>
</head>
<body>
    <form id="form1" runat="server">
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
        <div class="container"><br />
            <div class="pb-2 mt-4 mb-2 border-bottom">
                <H2 class="texto">Reporteador de equipos. <small class="text-muted">(<asp:Label ID="lbl_reporte" runat="server" Text="Equipos asignados"></asp:Label>)</small></H2>
            </div>
            <div id="divConsulta">
                <br />
                <div class="row">
                    <div class="col-lg-2"><br />
                        <b class="texto">Consultar:</b><br>
                    </div>
                    <div class="col-lg-4"><br />
                        <asp:DropDownList CssClass="form-control" ID="ddl_consulta" runat="server" AutoPostBack="true">
                            <asp:ListItem Value="">Selecciona</asp:ListItem>
                            <asp:ListItem Value="1">En stock</asp:ListItem>
                            <asp:ListItem Value="2">Asignadas</asp:ListItem>                            
                            <asp:ListItem Value="3">Dañada</asp:ListItem>
                            <asp:ListItem Value="4">Trash</asp:ListItem>
                            <asp:ListItem Value="5">Todos los equipos</asp:ListItem>
                        </asp:DropDownList>                          
                    </div>
                    <div class="col-lg-6"><br /></div>
                </div>
            </div><br /><br />

                <div class="table-responsive">
                    <asp:GridView ID="DGV_Equipos" runat="server" AllowSorting="True" DataSourceID="DS_Equipos" EnableModelValidation="True" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" >
                        <Columns>
                            <asp:BoundField DataField="Definicion" HeaderText="Tipo Equipo" SortExpression="Definicion"></asp:BoundField>
                            <asp:BoundField DataField="Marca" HeaderText="Marca" SortExpression="Marca"></asp:BoundField>
                            <asp:BoundField DataField="Modelo" HeaderText="Modelo" SortExpression="Modelo"></asp:BoundField>
                            <asp:BoundField DataField="Detalles" HeaderText="Observaciones" SortExpression="Detalles"></asp:BoundField>
                            <asp:BoundField DataField="FechaCompra" HeaderText="Fecha compra" SortExpression="FechaCompra"></asp:BoundField>
                            <asp:BoundField DataField="TiempoGarantia" HeaderText="Meses garantia" SortExpression="TiempoGarantia"></asp:BoundField>
                            <asp:BoundField DataField="PuertoUSB" HeaderText="Puerto USB" SortExpression="PuertoUSB"></asp:BoundField>
                            <asp:BoundField DataField="PuertoHDMI" HeaderText="Puerto HDMI" SortExpression="PuertoHDMI"></asp:BoundField>
                            <asp:BoundField DataField="PuertoVGA" HeaderText="Puerto VGA" SortExpression="PuertoVGA"></asp:BoundField>
                            <asp:BoundField DataField="PuertoRed" HeaderText="Puerto red" SortExpression="PuertoRed"></asp:BoundField>
                            <asp:BoundField DataField="UnidadCD" HeaderText="Unidad CD" SortExpression="UnidadCD"></asp:BoundField>
                            <asp:BoundField DataField="N_Serie" HeaderText="N° Serie" SortExpression="N_Serie"></asp:BoundField>
                            <asp:BoundField DataField="ram" HeaderText="RAM" SortExpression="ram"></asp:BoundField>
                            <asp:BoundField DataField="DiscoDuro" HeaderText="Disco duro" SortExpression="DiscoDuro"></asp:BoundField>
                            <asp:BoundField DataField="procesador" HeaderText="Procesador" SortExpression="procesador"></asp:BoundField>
                            <asp:BoundField DataField="Empresa_Comp" HeaderText="Empresa comp." ReadOnly="True" SortExpression="Empresa_Comp" />
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="table-responsive">
                    <asp:GridView ID="DGV_EquiposAsignados" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="DS_EquiposAsignados" EnableModelValidation="True" CssClass="table table-striped table-bordered table-hover" Visible="False">
                        <Columns>
                            <asp:BoundField DataField="Marca" HeaderText="Marca" SortExpression="Marca" />
                            <asp:BoundField DataField="Modelo" HeaderText="Modelo" SortExpression="Modelo" />
                            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                            <asp:BoundField DataField="Correo" HeaderText="Correo" SortExpression="Correo" />
                            <asp:BoundField DataField="Detalles" HeaderText="Observaciones" SortExpression="Detalles" />
                            <asp:BoundField DataField="FechaCompra" HeaderText="Fecha compra" SortExpression="FechaCompra" />
                            <asp:BoundField DataField="TiempoGarantia" HeaderText="Meses Garantia" SortExpression="TiempoGarantia" />
                            <asp:BoundField DataField="PuertoUSB" HeaderText="Puerto USB" SortExpression="PuertoUSB" />
                            <asp:BoundField DataField="PuertoHDMI" HeaderText="Puerto HDMI" SortExpression="PuertoHDMI" />
                            <asp:BoundField DataField="PuertoVGA" HeaderText="Puerto VGA" SortExpression="PuertoVGA" />
                            <asp:BoundField DataField="PuertoRed" HeaderText="Puerto Red" SortExpression="PuertoRed" />
                            <asp:BoundField DataField="UnidadCD" HeaderText="Unidad CD" SortExpression="UnidadCD" />
                            <asp:BoundField DataField="N_Serie" HeaderText="N° Serie" SortExpression="N_Serie" />
                            <asp:BoundField DataField="ram" HeaderText="RAM" SortExpression="ram" />
                            <asp:BoundField DataField="DiscoDuro" HeaderText="Disco Duro" SortExpression="DiscoDuro" />
                            <asp:BoundField DataField="procesador" HeaderText="Procesador" SortExpression="procesador" />
                            <asp:BoundField DataField="Empresa_Comp" HeaderText="Empresa Comp." ReadOnly="True" SortExpression="Empresa_Comp" />
                        </Columns>
                    </asp:GridView>
                </div>

            <asp:SqlDataSource ID="DS_EquiposAsignados" runat="server" ConnectionString="<%$ ConnectionStrings:SARTIConn %>" SelectCommand="SELECT E.Marca, E.Modelo, u.Nombre, u.Correo, E.Detalles, E.FechaCompra, E.TiempoGarantia, E.PuertoUSB, E.PuertoHDMI, E.PuertoVGA, E.PuertoRed, E.UnidadCD, E.N_Serie, E.ram, E.DiscoDuro, E.procesador, IIF(E.EmpresaCompradora IS NULL , 'Sin empresa', EMP.Empresa) AS Empresa_Comp FROM dominio_equipo AS DE INNER JOIN Equipo AS e ON e.IdEquipo = de.IdEquipo INNER JOIN Usuario AS u ON u.IdUsuario = de.IdUsuario LEFT JOIN Empresa AS EMP ON EMP.IdEmpresa = E.EmpresaCompradora WHERE de.Estatus = 1 "></asp:SqlDataSource>
            <asp:SqlDataSource ID="DS_Equipos" runat="server" ConnectionString="<%$ ConnectionStrings:SARTIConn %>" SelectCommand="getReporteEquipo" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddl_consulta" Name="CONSULTA" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
          <br>                
          
        </div>
    </form>
    <script>
        $('table').tableExport({
            formats: ["xlsx"],
            position: 'button',
            bootstrap: false,
            filename: "SARTI_Reporte"
        });


        $('.xlsx').addClass('btn btn-success');
        $('.xlsx').text('Exportar a Excel');
    </script>
</body>
</html>

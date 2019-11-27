<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CargaResponsiva.aspx.vb" Inherits="SARTI_FV2._0.CargaResponsiva" %>

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
    
      </div>
    </nav>
       
    <div class="container"><br>
        <form runat="server">        
            <div class="pb-2 mt-4 mb-2 border-bottom">
                <H2 class="texto">Carga de responsiva</H2>
            </div><br /><br />
             <div class="row">
                 <div class="offset-lg-4 col-lg-4 offset-md-4 col-md-4">
                     <asp:FileUpload ID="fU_Responsiva" runat="server" />
                 </div>
                 <div class="col-lg-4"></div>
             </div>
        </form>
    </div>
</body>
</html>

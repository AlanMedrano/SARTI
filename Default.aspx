<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="SARTI_FV2._0._Default" %>

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

    <title>Vigia | SARTI </title>
</head>
<body>

      <nav class="navbar navbar-dark bg-dark">
            <a class="navbar-brand" href="#">
                Grupo Vigia | SARTI       
            </a>
             
        </nav>
        <div class="container"><br><br>
        <div class="mx-auto" style="width: 300px;">
        <form action="Default.aspx" method="post" runat="server" >
            <br/>
            <div class="text-center">
             <img src="Resources/lock.png" width="150" height="" class="rounded "/><br/><br/><br>
            </div>
                <label for="exampleInputEmail1" class="texto">Correo</label>
                <input class="form-control" name="User"  placeholder="ejemplo@vigia.com.mx" required />
                <label for="exampleInputPassword1" class="texto">Contraseña</label>
                <input type="password" class="form-control"  name="Pass" placeholder="Contraseña" required />
                <small class="form-text text-muted"><a href="#" >¿Problemas?</a></small><br/>
                 
            <asp:Panel ID="PanelError" runat="server" Visible="False">
                <div class='alert alert-warning alert-dismissible fade show' role='alert' >
                    <asp:Label ID="lbl_error" runat="server" Text="Label"></asp:Label>
                            
                        </div>
            </asp:Panel>
            <button type="submit" class="btn btn-outline-primary btn-lg btn-block">Iniciar Sesion</button><br/>
        </form>
        </div>    
        </div>
</body>
</html>

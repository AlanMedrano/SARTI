Public Class CargaResponsiva
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Correo") = "" Then ' Valido usuario logeado.
            Response.Redirect("Default.aspx")
        End If

        Dim equipo, nSerie, user, extension As String

        equipo = Page.Request.QueryString("Equipo")
        nSerie = Page.Request.QueryString("nSerie")
        user = Page.Request.QueryString("User")
        Dim userReturn As String
        lbl_equipo.Text = nSerie
        lbl_usuario.Text = user

        If (IsPostBack) Then
            userReturn = lbl_usuario.Text
            If (fU_Responsiva.HasFile) Then
                extension = System.IO.Path.GetExtension(fU_Responsiva.FileName).ToLower
                ' VALIDAMOS QUE EL ARCHIVO CARGADO SEA DE TIPO '.pdf - .jpg - .pdf '
                If (extension = ".png" Or extension = ".jpg" Or extension = ".pdf") Then
                    Try
                        fU_Responsiva.SaveAs(Server.MapPath("~/Responsivas_Equipos/" & "RESPONSIVA_nSerie_" & nSerie & "user_" & user & "Equipo_" & equipo & extension))
                        Response.Redirect("ModificarUsuario.aspx?empleado=" & userReturn)
                    Catch ex As Exception
                        lbl_MensajeError.Text = "<strong> <i class='fas fa-unlink'></i> ¡Vaya! </strong> - Al parecer hubo un problema al llegar al servidor, por favor intentalo mas tarde."
                        pnl_ErrorCarga.Visible = True
                    End Try


                Else
                    lbl_MensajeError.Text = "<strong> <i class='fas fa-exclamation'></i> </strong> - Recuerda que solamente se permiten archivos de tipo <strong>.pdf</strong>, <strong> .jpg</strong> o <strong>.png</strong>, por favor intentalo nuevamente."
                    pnl_ErrorCarga.Visible = True
                End If
            Else
                lbl_MensajeError.Text = "<strong> <i class='fas fa-exclamation'></i> </strong> Por favor selecciona un Archivo para poder continuar."
                pnl_ErrorCarga.Visible = True
            End If


        End If


    End Sub

End Class
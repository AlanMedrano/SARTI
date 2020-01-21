Imports System.Data.SqlClient

Public Class CargaResponsiva
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Correo") = "" Then ' Valido usuario logeado.
            Response.Redirect("Default.aspx")
        End If

        Dim equipo, nSerie, user, extension As String
        Dim idMax As Integer
        equipo = Page.Request.QueryString("Equipo")
        nSerie = Page.Request.QueryString("nSerie")
        user = Page.Request.QueryString("User")
        Dim userReturn As String
        lbl_equipo.Text = nSerie
        lbl_usuario.Text = user

        'VALIDAR EXISTENCIA DE RESPONSIVA
        Dim registro As SqlDataReader
        Dim conn As New SqlConnection(System.Configuration.ConfigurationManager.AppSettings("Sistema_SARTI"))
        conn.Open()
        Dim cmd As SqlCommand = New SqlCommand("GEtResponsivaEquipo", conn)
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Parameters.AddWithValue("@EQUIPO", equipo)
        cmd.Parameters.AddWithValue("@USUARIO", user)
        registro = cmd.ExecuteReader()

        If (registro.Read() = True) Then
            If (registro("Responsiva") = "Si") Then
                pnl_LoadFile.Visible = False
                lbl_MensajeError.Text = "<strong><i class='fas fa-clipboard-check'></i>  </strong>  Al parecer ya se ha cargado la responsiva de este equipo, si tienes algun problema consulta con el administrador del sistema"
                pnl_ErrorCarga.Visible = True
            Else
                pnl_ErrorCarga.Visible = False
                pnl_LoadFile.Visible = True
            End If
        End If
        conn.Close()        ' FIN VALIDACION EXISTENCIA DE RESPONSIVA



        If (IsPostBack) Then
            userReturn = lbl_usuario.Text
            If (fU_Responsiva.HasFile) Then
                extension = System.IO.Path.GetExtension(fU_Responsiva.FileName).ToLower
                ' VALIDAMOS QUE EL ARCHIVO CARGADO SEA DE TIPO '.pdf - .jpg - .pdf '
                If (extension = ".png" Or extension = ".jpg" Or extension = ".pdf") Then
                    Try
                        idMax = GetIdDominioEquipo(user, equipo)

                        fU_Responsiva.SaveAs(Server.MapPath("~/Responsivas_Equipos/" & "RESPONSIVA_ID_" & idMax & "user_" & user & "Equipo_" & equipo & extension))
                        ' ACTUALIZAMOS EL REGISTRO DE RESPONSIVA EN DB
                        conn.Open()
                        cmd = New SqlCommand("UpdateResponsiva", conn)
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.AddWithValue("@EQUIPO", CInt(equipo))
                        cmd.Parameters.AddWithValue("@USUARIO", CInt(user))
                        registro = cmd.ExecuteReader()
                        conn.Close()

                        pnlResponsivaCargada.Visible = True
                        pnl_LoadFile.Visible = False
                        ' REDIRECCIONAMOS A LA PAGINA ModificarUsuario.aspx
                        ' Response.Redirect("ModificarUsuario.aspx?empleado=" & userReturn)
                    Catch ex As Exception
                        lbl_MensajeError.Text = "<strong> <i class='fas fa-unlink'></i> ¡Vaya! </strong> - Al parecer hubo un problema al llegar al servidor, por favor intentalo mas tarde."
                        pnl_ErrorCarga.Visible = True
                        pnlResponsivaCargada.Visible = False
                    End Try


                Else
                    lbl_MensajeError.Text = "<strong> <i class='fas fa-exclamation'></i> </strong> - Recuerda que solamente se permiten archivos de tipo <strong>.pdf</strong>, <strong> .jpg</strong> o <strong>.png</strong>, por favor intentalo nuevamente."
                    pnl_ErrorCarga.Visible = True
                    pnlResponsivaCargada.Visible = False
                End If
            Else
                lbl_MensajeError.Text = "<strong> <i class='fas fa-exclamation'></i> </strong> Por favor selecciona un Archivo para poder continuar."
                pnl_ErrorCarga.Visible = True
                pnlResponsivaCargada.Visible = False
            End If


        End If


    End Sub
    'FUNCTION TO GET ID MAX FROM DB IN TABLE "DOMINIO_EQUIPO"...
    Public Function GetIdDominioEquipo(usuario, equipo)
        Dim ID As Integer
        Dim registro As SqlDataReader
        Dim conn As New SqlConnection(System.Configuration.ConfigurationManager.AppSettings("Sistema_SARTI"))
        conn.Open()
        Dim cmd As SqlCommand = New SqlCommand("SELECT idDominioEquipo FROM Dominio_Equipo WHERE Estatus = 1 and IdUsuario= " & usuario & " and IdEquipo = " & equipo, conn)
        'cmd.CommandType = CommandType.StoredProcedure
        registro = cmd.ExecuteReader()
        If (registro.Read() = True) Then
            ID = registro("idDominioEquipo")
        End If
        conn.Close()
        Return ID
    End Function

End Class
Imports System.Data.SqlClient
Public Class RegistrarAdministrador
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Correo") = "" Then ' Valido usuario logeado.
            Response.Redirect("Default.aspx")
        Else
            If Session("t_user") = "maestro" Then
                Pnl_error.Visible = False
                pnlregistraU.Visible = True
            Else
                Pnl_error.Visible = True
                Lbl_Error.Text = "Lo sentimos, no cuentas con permisos para agregar un Administrador."
                pnlregistraU.Visible = False
            End If
        End If

        Dim Name As String = Request.Form.Item("Nombre")
        Dim Email As String = Request.Form.Item("Correo")
        Dim Password As String = Request.Form.Item("Contraseña")

        If (Name <> "" And Password <> "" And Email <> "" And Session("t_user") = "maestro") Then
            Dim dt As New DataTable
            Dim registro As SqlDataReader
            Dim conn As New SqlConnection(System.Configuration.ConfigurationManager.AppSettings("Sistema_SARTI"))
            conn.Open()
            Dim cmd As SqlCommand = New SqlCommand("RegistrarAdministrador", conn)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@Name", Name)
            cmd.Parameters.AddWithValue("@Email", Email)
            cmd.Parameters.AddWithValue("@Password", Password)

            registro = cmd.ExecuteReader()
            If registro.Read() = True Then
                If registro("TIPO_MENSAJE") = "EXITO" Then
                    Pnl_Exito.Visible = True
                    Lbl_Exito.Text = registro("MENSAJE")
                Else
                    Pnl_error.Visible = True
                    Lbl_Error.Text = registro("MENSAJE")
                End If
            End If
            conn.Close()
        End If
    End Sub

End Class
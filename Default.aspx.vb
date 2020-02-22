Imports System.Data.SqlClient
Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("Correo") = ""
        If IsPostBack Then
            Dim User As String = Request.Form.Item("User")
            Dim Pass As String = Request.Form.Item("Pass")
            Dim dt As New DataTable
            Dim registro As SqlDataReader
            Dim conn As New SqlConnection(System.Configuration.ConfigurationManager.AppSettings("Sistema_SARTI"))
            conn.Open()
            Dim cmd As SqlCommand = New SqlCommand("ValidaUser", conn)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@Correo", User)
            cmd.Parameters.AddWithValue("@Password", Pass)

            registro = cmd.ExecuteReader()
            If registro.Read() = True Then
                If registro("estatus") = "Activo" Then
                    Session("Correo") = registro("Correo")
                    Session("t_user") = registro("type_admin")
                    Response.Redirect("Inicio.aspx")
                Else
                    Session("Correo") = ""
                    Session("t_user") = ""
                    PanelError.Visible = True
                    lbl_error.Text = "Usuario sin acceso al sistema"
                End If

            Else
                Session("Correo") = ""
                Session("t_user") = ""
                PanelError.Visible = True
                lbl_error.Text = "<strong>¡Vaya!</strong> al parecer uno de los datos son incorrectos, intentalo de nuevo."
            End If
            conn.Close()
        End If
    End Sub

End Class
Imports System.Data.SqlClient
Public Class InformacionAdicional
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Correo") = "" Then ' Valido usuario logeado.
            Response.Redirect("Default.aspx")
        End If

        Dim Opcion As String = Request.Form.Item("ListInfoAd")
        Dim departamento As String = Request.Form.Item("departamento")
        Dim ubicacion As String = Request.Form.Item("Ubicacion")
        Dim LinkUbicacion As String = Request.Form.Item("LinkUbicacion")
        Dim TipoEquipo As String = Request.Form.Item("TipoEquipo")
        Dim Puesto As String = Request.Form.Item("Puesto")
        Dim Tiporotacion As String = Request.Form.Item("TiempoRotacion")
        Dim Empresa As String = Request.Form.Item("empresa")

        If (Opcion <> 0 Or Opcion <> Nothing) Then
            Dim dt As New DataTable
            Dim registro As SqlDataReader
            Dim conn As New SqlConnection(System.Configuration.ConfigurationManager.AppSettings("Sistema_SARTI"))
            conn.Open()
            Dim cmd As SqlCommand = New SqlCommand("RegistraInformacionAdicional", conn)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@Opcion", Opcion)
            cmd.Parameters.AddWithValue("@departamento", departamento)
            cmd.Parameters.AddWithValue("@ubicacion", ubicacion)
            cmd.Parameters.AddWithValue("@LinkUbicacion", LinkUbicacion)
            cmd.Parameters.AddWithValue("@TipoEquipo", TipoEquipo)
            cmd.Parameters.AddWithValue("@Puesto", Puesto)
            cmd.Parameters.AddWithValue("@tiempoRotacion", Tiporotacion) ' convertir a INT
            cmd.Parameters.AddWithValue("@Empresa", Empresa)

            registro = cmd.ExecuteReader()
            If registro.Read() = True Then
                If (registro("MENSAJE") = "ERROR") Then
                    Pnl_error.Visible = True
                    Lbl_Error.Text = "Al parecer el dato que intentas ingresar ya existe en las bases de datos, por favor intenta nuevamente."
                Else
                    Pnl_exito.Visible = True
                    Lbl_Exito.Text = registro("MENSAJE")
                End If

            Else
                Pnl_error.Visible = True
                Lbl_Error.Text = "Al parecer algo salio mal, por favor intentalo nuevamente mas tarde."
            End If
            conn.Close()
        End If
    End Sub

End Class
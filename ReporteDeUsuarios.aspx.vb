Imports System.Data.SqlClient
Public Class ReporteDeUsuarios
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Correo") = "" Then ' Valido usuario logeado.
            Response.Redirect("Default.aspx")
        End If

        Dim registro As SqlDataReader
        Dim conn As New SqlConnection(System.Configuration.ConfigurationManager.AppSettings("Sistema_SARTI"))
        conn.Open()
        Dim cmd As SqlCommand = New SqlCommand("Get_totalEmpleados", conn)
        cmd.CommandType = CommandType.StoredProcedure

        registro = cmd.ExecuteReader()

        If (registro.Read() = True) Then
            lbl_UsuariosCont.Text = registro("total_usuarios")
        End If
        conn.Close()

        Dim ds As New DataSet
        Dim da As New SqlDataAdapter("Get_Empleados", System.Configuration.ConfigurationManager.AppSettings("Sistema_SARTI"))

        ds.Tables.Add("Tabla")
        da.Fill(ds.Tables("Tabla"))
        If ds.Tables("Tabla").Rows.Count() > 0 Then
            dgv_empleados.DataSource = ds.Tables("Tabla")
            dgv_empleados.DataBind()
        End If


    End Sub

End Class
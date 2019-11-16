Imports System.Data.SqlClient
Public Class ModificarAdmin
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Correo") = "" Then ' Valido usuario logeado.
            Response.Redirect("Default.aspx")
        End If

        Dim ds As New DataSet
        Dim da As New SqlDataAdapter("Get_Administradores", System.Configuration.ConfigurationManager.AppSettings("Sistema_SARTI"))

        ds.Tables.Add("Tabla")
        da.Fill(ds.Tables("Tabla"))



        If ds.Tables("Tabla").Rows.Count() > 0 Then
            dgv_administrador.DataSource = ds.Tables("Tabla")
            dgv_administrador.DataBind()
        End If

    End Sub

End Class
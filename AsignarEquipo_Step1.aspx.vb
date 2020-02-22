Imports System.Data.SqlClient
Public Class AsignarEquipo_Step1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Correo") = "" Then ' Valido usuario logeado.
            Response.Redirect("Default.aspx")
        Else
            If Session("t_user") = "maestro" Then
                pnlAsigna.Visible = True
                pnlNoaccess.Visible = False
            Else
                pnlAsigna.Visible = False
                pnlNoaccess.Visible = True
            End If
        End If

        If IsPostBack Then
            Dim correo As String = Page.Request.Form.Item("correo")
            Dim ds As New DataSet
            Dim dt As New DataTable
            Dim Query As String = "SELECT 'AsignarEquipo_Step2.aspx?User='+ convert(varchar(80), IdUsuario) AS Link, Nombre, Correo,  Empresa.Empresa FROM Usuario INNER JOIN Empresa ON Empresa.IdEmpresa = Usuario.Empresa WHERE Correo ='" & correo & "'"
            Dim da As New SqlDataAdapter(Query, System.Configuration.ConfigurationManager.AppSettings("Sistema_SARTI"))

            ds.Tables.Add("Tabla")
            da.Fill(ds.Tables("Tabla"))
            If ds.Tables("Tabla").Rows.Count() > 0 Then
                tableusers.DataSource = ds.Tables("Tabla")
                tableusers.DataBind()
                pnl_tabla.Visible = True
                pnl_Nodata.Visible = False
            Else
                pnl_tabla.Visible = False
                pnl_Nodata.Visible = True
            End If


        End If
    End Sub

End Class
Imports System.Data.SqlClient
Public Class AsignarEquipo_Step2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Correo") = "" Then ' Valido usuario logeado.
            Response.Redirect("Default.aspx")
        End If

        Dim usuario As Integer = Page.Request.QueryString("User")
        Dim ds As New DataSet
        Dim dt As New DataTable
        Dim Query As String = "select 'AsignarEquipo_Step3.aspx?User=" & usuario & "&Equipo=' + convert(varchar(20),IdEquipo) as link, Modelo, Marca, Tipo_Equipo.Definicion, N_Serie from Equipo inner join Tipo_Equipo on equipo.IdTipoEquipo = Tipo_Equipo.IDTipoEquipo where IdEstatus = 1 ORDER BY Modelo"
        Dim da As New SqlDataAdapter(Query, System.Configuration.ConfigurationManager.AppSettings("Sistema_SARTI"))

        ds.Tables.Add("Tabla")
        da.Fill(ds.Tables("Tabla"))

        If ds.Tables("Tabla").Rows.Count() > 0 Then
            DGV_Equipos.DataSource = ds.Tables("Tabla")
            DGV_Equipos.DataBind()

            PNL_tabla.Visible = True
            Pnl_Mensaje.Visible = False
        Else
            PNL_tabla.Visible = False
            Pnl_Mensaje.Visible = True
        End If
    End Sub

End Class
Imports System.Data.SqlClient
Public Class ReporteDeEquipos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Correo") = "" Then ' Valido usuario logeado.
            Response.Redirect("Default.aspx")
        End If

        Dim ds As New DataSet
        Dim dt As New DataTable
        Dim da As New SqlDataAdapter("select e.modelo, e.Marca, e.N_Serie, 'ModificarEquipo.aspx?Equipo=' + CONVERT(VARCHAR(20),e.IdEquipo) AS LINK, eq.DescEstatus as estatus from Equipo e inner join Estatus_equipo eq on eq.IDEstatus = e.IdEstatus order by e.Modelo", System.Configuration.ConfigurationManager.AppSettings("Sistema_SARTI"))

        ds.Tables.Add("Tabla")
        da.Fill(ds.Tables("Tabla"))
        If ds.Tables("Tabla").Rows.Count() > 0 Then
            dgv_ReporteEquipos.DataSource = ds.Tables("Tabla")
            dgv_ReporteEquipos.DataBind()
            pnl_equipos.Visible = True
            pnl_NoEquipos.Visible = False
        Else
            pnl_equipos.Visible = False
            pnl_NoEquipos.Visible = True
        End If


    End Sub

End Class
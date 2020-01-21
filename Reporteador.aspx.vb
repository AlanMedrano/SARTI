Public Class Reporteador
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim consulta As Integer
        If (IsPostBack) Then
            consulta = Page.Request.Form("ddl_consulta")
            If (consulta = 1) Then
                DGV_EquiposAsignados.DataSourceID = "DS_EquiposNOAsignados"
                lbl_reporte.Text = "En Stock"
            ElseIf (consulta = 2) Then
                DGV_EquiposAsignados.DataSourceID = "DS_EquiposAsignados"
                lbl_reporte.Text = "Equipos asignados"
            ElseIf (consulta = 3) Then
                DGV_EquiposAsignados.DataSourceID = "DS_EquiposDañados"
                lbl_reporte.Text = "Equipos dañados"
            ElseIf (consulta = 4) Then
                DGV_EquiposAsignados.DataSourceID = "DS_EquiposTrash"
                lbl_reporte.Text = "Trash"
            ElseIf (consulta = 5) Then
                DGV_EquiposAsignados.DataSourceID = "DS_TotalEquipos"
                lbl_reporte.Text = "Todos los equipos"

            End If
        End If

    End Sub

End Class
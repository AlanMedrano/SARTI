Public Class Reporteador
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim consulta As Integer
        If (IsPostBack) Then
            consulta = Page.Request.Form("ddl_consulta")
            If (consulta = 1) Then
                DGV_EquiposAsignados.DataSourceID = "DS_EquiposNOAsignados"
            ElseIf (consulta = 2) Then
                DGV_EquiposAsignados.DataSourceID = "DS_EquiposAsignados"
            ElseIf (consulta = 3) Then
                DGV_EquiposAsignados.DataSourceID = "DS_EquiposDañados"
            ElseIf (consulta = 4) Then
                DGV_EquiposAsignados.DataSourceID = "DS_EquiposTrash"
            ElseIf (consulta = 5) Then
                DGV_EquiposAsignados.DataSourceID = "DS_TotalEquipos"

            End If
        End If

    End Sub

End Class
Imports System.IO

Public Class Reporteador
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Correo") = "" Then ' Valido usuario logeado.
            Response.Redirect("Default.aspx")
        End If
        Dim consulta As Integer
        If (IsPostBack) Then
            consulta = Page.Request.Form("ddl_consulta")
            If (consulta = 1) Then
                lbl_reporte.Text = "En Stock"
                DGV_EquiposAsignados.Visible = False
                DGV_Equipos.Visible = True
            ElseIf (consulta = 2) Then
                lbl_reporte.Text = "Asignados"
                DGV_EquiposAsignados.Visible = True
                DGV_Equipos.Visible = False
            ElseIf (consulta = 3) Then
                lbl_reporte.Text = "Equipos dañados"
                DGV_EquiposAsignados.Visible = False
                DGV_Equipos.Visible = True
            ElseIf (consulta = 4) Then
                lbl_reporte.Text = "Trash"
                DGV_EquiposAsignados.Visible = False
                DGV_Equipos.Visible = True
            ElseIf (consulta = 5) Then
                lbl_reporte.Text = "Todos los equipos"
                DGV_EquiposAsignados.Visible = False
                DGV_Equipos.Visible = True

            End If
        End If
    End Sub

End Class
Imports System.IO

Public Class Reporteador
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Correo") = "" Then ' Valido usuario logeado.
            Response.Redirect("Default.aspx")
        End If

        Dim consulta As Integer
        Dim excel As String
        Dim reportName As String
        excel = Page.Request.Form("checkExcel")
        If (excel = "on" And consulta = 1) Then
            DGV_Equipos.AllowPaging = False
        ElseIf (excel = "on" And consulta = 2) Then
            DGV_EquiposAsignados.AllowPaging = False
        End If
        If (IsPostBack) Then
            consulta = Page.Request.Form("ddl_consulta")
            If (excel = "on") Then
                DGV_Equipos.AllowPaging = False
                DGV_Equipos.AllowSorting = False
                DGV_Equipos.PageSize = 99999999
            Else
                DGV_Equipos.AllowPaging = True
                DGV_Equipos.AllowSorting = True
                DGV_Equipos.PageSize = 50
            End If

            If (consulta = 1) Then
                DGV_Equipos.DataSourceID = "DS_EquiposNOAsignados"
                gv_excel.DataSourceID = "DS_EquiposNOAsignados"
                lbl_reporte.Text = "En Stock"
                reportName = "Reporte_equipos_en_Stock"
                pnl_EquiposAsignados.Visible = False
                pnl_equipos.Visible = True
            ElseIf (consulta = 2) Then
                lbl_reporte.Text = "Asignados"
                DGV_EquiposAsignados.DataSourceID = "DS_equiposAsignados2"
                reportName = "ReporteEquiposAsignados"
                pnl_EquiposAsignados.Visible = True
                pnl_equipos.Visible = False
            ElseIf (consulta = 3) Then
                DGV_Equipos.DataSourceID = "DS_EquiposDañados"
                lbl_reporte.Text = "Equipos dañados"
                gv_excel.DataSourceID = "DS_EquiposDañados"
                reportName = "Reporte_equipos_dañados"
                pnl_EquiposAsignados.Visible = False
                pnl_equipos.Visible = True
            ElseIf (consulta = 4) Then
                DGV_Equipos.DataSourceID = "DS_EquiposTrash"
                lbl_reporte.Text = "Trash"
                gv_excel.DataSourceID = "DS_EquiposTrash"
                reportName = "Reporte_equipos_trash"
                pnl_EquiposAsignados.Visible = False
                pnl_equipos.Visible = True
            ElseIf (consulta = 5) Then
                DGV_Equipos.DataSourceID = "DS_TotalEquipos"
                lbl_reporte.Text = "Todos los equipos"
                gv_excel.DataSourceID = "DS_TotalEquipos"
                reportName = "Reporte_todos_los_equipos"
                pnl_EquiposAsignados.Visible = False
                pnl_equipos.Visible = True

            End If
        End If
        'validating to donwload report
        If (excel = "on") Then
            DGV_Equipos.DataSourceID = "DS_TotalEquipos"
            Dim sb As StringBuilder = New StringBuilder()
            Dim sw As StringWriter = New StringWriter(sb)
            Dim htw As HtmlTextWriter = New HtmlTextWriter(sw)
            Dim pagina As Page = New Page
            Dim form = New HtmlForm
            Me.DGV_Equipos.EnableViewState = True
            pagina.EnableEventValidation = False
            pagina.DesignerInitialize()
            pagina.Controls.Add(form)
            form.Controls.Add(Me.DGV_Equipos)
            pagina.RenderControl(htw)
            Response.Clear()
            Response.Buffer = True
            Response.ContentType = "application/ms-excel"
            Response.AddHeader("Content-Disposition", "attachment;filename=" & reportName & ".xls")
            Response.Charset = "UTF-8"
            Response.ContentEncoding = Encoding.Default
            Response.Write(sb.ToString)
            Response.End()

        End If

    End Sub

End Class
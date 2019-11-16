Imports System.Data.SqlClient
Public Class DesenlazarEquipo
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Correo") = "" Then ' Valido usuario logeado.
            Response.Redirect("Default.aspx")
        End If

        Dim ds As New DataSet
        Dim dt As New DataTable
        Dim da As New SqlDataAdapter("Select 'DesenlazarEquipostep2.aspx?user=' + CONVERT(varchar(20), u.IdUsuario) as Link, u.Nombre as Empleado, u.Correo from Dominio_Equipo as DE LEFT JOIN Usuario U ON U.IdUsuario = DE.IdUsuario", System.Configuration.ConfigurationManager.AppSettings("Sistema_SARTI"))

        ds.Tables.Add("Tabla")
        da.Fill(ds.Tables("Tabla"))
        If ds.Tables("Tabla").Rows.Count() > 0 Then
            dgv_empleados.DataSource = ds.Tables("Tabla")
            dgv_empleados.DataBind()
            pnl_tablaEmpleados.Visible = True
            pnl_NoEmpleados.Visible = False
        Else
            pnl_tablaEmpleados.Visible = False
            pnl_NoEmpleados.Visible = True
        End If
    End Sub

End Class
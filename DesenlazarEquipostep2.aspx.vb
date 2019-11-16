Imports System.Data.SqlClient
Public Class DesenlazarEquipostep2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Correo") = "" Then ' Valido usuario logeado.
            Response.Redirect("Default.aspx")
        End If
        Dim i As Integer
        Dim Equipos(i) As String
        Dim QUERY As String
        Dim ds As New DataSet
        Dim dt As New DataTable
        Dim Empleado As String = Page.Request.QueryString("user")
        Dim Equipo As String = Page.Request.QueryString("Equipo")

        If Equipo <> "" Then

            Dim registro As SqlDataReader
            Dim conn As New SqlConnection(System.Configuration.ConfigurationManager.AppSettings("Sistema_SARTI"))
            conn.Open()
            Dim cmd As SqlCommand = New SqlCommand("DesenlazaEquipo", conn)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@Equipo", Equipo)
            cmd.Parameters.AddWithValue("@Usuario", Empleado)

            registro = cmd.ExecuteReader()

            If (registro.Read() = True) Then
                lbl_mensaje.Text = registro("Mensaje")
                pnl_desenlaze.Visible = True
            Else
                pnl_desenlaze.Visible = False
            End If
            conn.Close()
        End If

        QUERY = "SELECT 'DesenlazarEquipostep2.aspx?Equipo=' + convert(varchar(100), E.IdEquipo) + '&user=" & Empleado & "' AS Link, E.Modelo, E.N_Serie, convert(date, DE.FechaEntrega) AS FechaEntrega FROM Dominio_Equipo AS DE INNER JOIN Equipo AS E ON DE.IdEquipo = E.IdEquipo WHERE DE.IdUsuario=" & Empleado & "AND DE.Estatus = 1 ORDER BY E.Modelo"
        Dim da As New SqlDataAdapter(QUERY, System.Configuration.ConfigurationManager.AppSettings("Sistema_SARTI"))

        ds.Tables.Add("Tabla")
        da.Fill(ds.Tables("Tabla"))
        If ds.Tables("Tabla").Rows.Count() > 0 Then
            dgv_equipos.DataSource = ds.Tables("Tabla")
            dgv_equipos.DataBind()
            pnl_equipos.Visible = True
            pnl_mensaje.Visible = False
        Else
            pnl_mensaje.Visible = True
            pnl_equipos.Visible = False
        End If

    End Sub

End Class
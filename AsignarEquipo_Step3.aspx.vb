Imports System.Data.SqlClient
Public Class AsignarEquipo_Step3
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("Correo") = "" Then ' Valido usuario logeado.
            Response.Redirect("Default.aspx")
        End If

        Dim usuario As Integer = Page.Request.QueryString("User")
        Dim equipo As Integer = Page.Request.QueryString("Equipo")
        Dim registro As SqlDataReader
        Dim conn As New SqlConnection(System.Configuration.ConfigurationManager.AppSettings("Sistema_SARTI"))
        conn.Open()
        Dim cmd As SqlCommand = New SqlCommand("Registrar_DominioEquipo", conn)
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Parameters.AddWithValue("@Equipo", equipo)
        cmd.Parameters.AddWithValue("@Usuario", usuario)
        cmd.Parameters.AddWithValue("@Fechaentrega", Date.Now.Date)

        registro = cmd.ExecuteReader()

        If (registro.Read() = True) Then
            If (registro("MENSAJE") = "EXITO") Then
                pnl_exito.Visible = True
                conn.Close()

                ' LLENAMOS LOS DATOS DEL USUARIO.
                Dim ds As New DataSet
                Dim dt As New DataTable
                Dim Query As String = "SELECT Nombre, IdUsuario, DE.departamento , UB.Ubicacion FROM Usuario AS U inner join departamento  AS DE ON  U.IdDepartamento = DE.IDDepartamento INNER JOIN Ubicacion AS UB ON UB.IDUbicacion = U.IdUbicacion WHERE u.IdUsuario = " & usuario
                Dim da As New SqlDataAdapter(Query, System.Configuration.ConfigurationManager.AppSettings("Sistema_SARTI"))

                ds.Tables.Add("Tabla")
                da.Fill(dt)

                If dt.Rows.Count() > 0 Then
                    For Each row As DataRow In dt.Rows
                        lbl_empleado.Text = row("Nombre").ToString
                        lbl_Departamento.Text = row("departamento").ToString
                        lbl_NEmpleado.Text = row("IdUsuario").ToString
                        lbl_ubicacion.Text = row("Ubicacion").ToString
                    Next

                End If

                ' LLENAMOS LOS DATOS DEL EQUIPO A ASIGNAR.
                Dim dse As New DataSet
                Dim dte As New DataTable
                Dim Querye As String = "SELECT Modelo, Marca, N_serie, TE.Definicion, EQ.Detalles, EQ.Falla FROM Equipo AS EQ INNER JOIN Tipo_Equipo AS TE ON EQ.IdTipoEquipo = TE.IDTipoEquipo INNER JOIN Dominio_Equipo AS DE ON DE.IdEquipo = EQ.IdEquipo WHERE DE.IdEquipo = " & equipo
                Dim dae As New SqlDataAdapter(Querye, System.Configuration.ConfigurationManager.AppSettings("Sistema_SARTI"))

                dse.Tables.Add("Tabla")
                dae.Fill(dte)

                If dte.Rows.Count() > 0 Then
                    For Each rowe As DataRow In dte.Rows

                        lbl_modelo.Text = rowe("Modelo").ToString
                        lbl_marca.Text = rowe("Marca").ToString
                        lbl_TipoEquipo.Text = rowe("Definicion").ToString
                        lbl_NSerie.Text = rowe("N_serie").ToString

                        If rowe("Detalles").ToString <> "" Then
                            lbl_detalles.Text = rowe("Detalles").ToString
                        Else
                            lbl_detalles.Text = " N/A"
                        End If

                        If rowe("Falla") <> "" Then
                            lbl_falla.Text = rowe("Falla").ToString
                        Else
                            lbl_falla.Text = "N/A"
                        End If

                    Next

                End If

            Else
                lbl_error.Text = registro("MENSAJE")
                pnl_error.Visible = True
                conn.Close()
            End If

        Else
            conn.Close()
        End If
    End Sub

End Class
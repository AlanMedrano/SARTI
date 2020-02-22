Imports System.Data.SqlClient
Public Class RegistrarUsuario
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Correo") = "" Then ' Valido usuario logeado.
            Response.Redirect("Default.aspx")
        Else
            If Session("t_user") = "maestro" Then
                pnlRegistraUser.Visible = True
                pnl_error.Visible = False
            Else
                pnlRegistraUser.Visible = False
                pnl_error.Visible = True
                lbl_error.Text = "Lo sentimos no cuentas con permisos para registrar a un empleado."
            End If
        End If

        Dim Nombre As String = Request.Form.Item("nombre")
        Dim correo As String = Request.Form.Item("correo")
        Dim puesto As Integer = Request.Form.Item("DDL_Puesto")
        Dim empresa As Integer = Request.Form.Item("DDL_Empresa")
        Dim Departamento As Integer = Request.Form.Item("DDL_departamento")
        Dim ubicacion As Integer = Request.Form.Item("DDL_Ubicacion")
        Dim NEmpleado As Integer = Request.Form.Item("NEmpleado")

        Dim item As New ListItem
        Dim dt As New DataTable
        Dim da As New SqlDataAdapter("SELECT IDUbicacion,Ubicacion FROM Ubicacion order by Ubicacion", System.Configuration.ConfigurationManager.AppSettings("Sistema_SARTI"))
        da.Fill(dt)
        If (dt.Rows.Count() > 0) Then
            For Each row As DataRow In dt.Rows
                DDL_Ubicacion.Items.Add(New ListItem(row("Ubicacion"), row("IDUbicacion")))
            Next
        End If

        Dim DT_E As New DataTable
        Dim DA2 As New SqlDataAdapter("SELECT IdEmpresa,Empresa FROM Empresa order by Empresa", System.Configuration.ConfigurationManager.AppSettings("Sistema_SARTI"))
        DA2.Fill(DT_E)
        If (DT_E.Rows.Count() > 0) Then
            For Each row As DataRow In DT_E.Rows
                DDL_Empresa.Items.Add(New ListItem(row("Empresa"), row("IdEmpresa")))
            Next
        End If

        Dim DT_P As New DataTable
        Dim DA3 As New SqlDataAdapter("SELECT IDPuesto,Descripcion FROM Puesto order by Descripcion", System.Configuration.ConfigurationManager.AppSettings("Sistema_SARTI"))
        DA3.Fill(DT_P)
        If (DT_P.Rows.Count() > 0) Then
            For Each row As DataRow In DT_P.Rows
                DDL_Puesto.Items.Add(New ListItem(row("Descripcion"), row("IDPuesto")))
            Next
        End If

        Dim DT_D As New DataTable
        Dim DA4 As New SqlDataAdapter("SELECT IDDepartamento, Departamento FROM Departamento order by Departamento", System.Configuration.ConfigurationManager.AppSettings("Sistema_SARTI"))
        DA4.Fill(DT_D)
        If (DT_D.Rows.Count() > 0) Then
            For Each row As DataRow In DT_D.Rows
                DDL_departamento.Items.Add(New ListItem(row("Departamento"), row("IDDepartamento")))
            Next
        End If


        'Insertamos un nuevo usuario
        If IsPostBack = True And Session("t_user") = "maestro" Then
            Dim registro As SqlDataReader
            Dim conn As New SqlConnection(System.Configuration.ConfigurationManager.AppSettings("Sistema_SARTI"))
            conn.Open()
            Dim cmd As SqlCommand = New SqlCommand("RegistraUsuario", conn)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@IDUsuario", NEmpleado)
            cmd.Parameters.AddWithValue("@Nombre", Nombre)
            cmd.Parameters.AddWithValue("@Correo", correo)
            cmd.Parameters.AddWithValue("@Puesto", puesto)
            cmd.Parameters.AddWithValue("@Empresa", empresa)
            cmd.Parameters.AddWithValue("@Departamento", Departamento)
            cmd.Parameters.AddWithValue("@Ubicacion", ubicacion)

            registro = cmd.ExecuteReader()
            If registro.Read() = True Then
                If (registro("TIPO_MENSAJE") = "ERROR") Then
                    pnl_error.Visible = True
                    lbl_error.Text = registro("MENSAJE")
                Else
                    pnl_exito.Visible = True
                    lbl_exito.Text = registro("MENSAJE")
                End If

            Else
                pnl_error.Visible = True
                lbl_error.Text = "Al parecer algo salio mal, por favor intentalo nuevamente mas tarde."
            End If
            conn.Close()


        End If
    End Sub

End Class
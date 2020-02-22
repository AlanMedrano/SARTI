Imports System.Data.SqlClient
Public Class ModificarUsuario
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Correo") = "" Then ' Valido usuario logeado.
            Response.Redirect("Default.aspx")
        Else
            If Session("t_user") = "maestro" Then
                pnlModEmp.Visible = True
            Else
                pnlModEmp.Visible = False
            End If
        End If

        Dim usuario As Integer = Page.Request.QueryString("empleado")

        If usuario <> 0 Then
            Session("usuario_modifica") = usuario
        Else
            usuario = Session("usuario_modifica")
        End If

        If IsPostBack Then
            Dim nombre As String = Page.Request.Form.Item("nombre")
            Dim correo As String = Page.Request.Form.Item("correo")
            Dim puesto As String = Page.Request.Form.Item("DDL_Puesto")
            Dim empresa As String = Page.Request.Form.Item("DDL_Empresa")
            Dim departamento As String = Page.Request.Form.Item("DDL_departamento")
            Dim ubicacion As String = Page.Request.Form.Item("DDL_Ubicacion")
            Dim Estatus As String = Page.Request.Form.Item("DDL_Estatus")



            If Estatus = "Inactivo" Then
                '   Validamos que el usuario a inactivar no tenga equipos asignados...
                Dim r2 As SqlDataReader
                Dim cn2 As New SqlConnection(System.Configuration.ConfigurationManager.AppSettings("Sistema_SARTI"))
                cn2.Open()
                Dim command2 As SqlCommand = New SqlCommand("ValidaUserEquipo", cn2)
                command2.CommandType = CommandType.StoredProcedure
                command2.Parameters.AddWithValue("@USUARIO", usuario)
                r2 = command2.ExecuteReader()

                If (r2.Read() = True) Then
                    'lbl_nombre.Text = r2("NUM_EQUIPOS")
                    If r2("NUM_EQUIPOS") > 0 Then
                        pnl_Relacionequipo.Visible = True
                    Else ' Si el usuario no tiene equipos asignados continuamos con las modificaciones...
                        ActualizaUsuario(nombre, correo, puesto, empresa, departamento, ubicacion, Estatus, usuario)



                    End If
                End If
                cn2.Close()
            Else 'Si no se modifica el estatus actualizamos los datos
                ActualizaUsuario(nombre, correo, puesto, empresa, departamento, ubicacion, Estatus, usuario)

            End If



        End If ' Actualizacion de empleado.


        ' Obtenemos los datos del usuario
        Dim r As SqlDataReader
        Dim cn As New SqlConnection(System.Configuration.ConfigurationManager.AppSettings("Sistema_SARTI"))
        cn.Open()
        Dim command As SqlCommand = New SqlCommand("Get_DetalleEmpleado", cn)
        command.CommandType = CommandType.StoredProcedure
        command.Parameters.AddWithValue("@usuario", usuario)
        r = command.ExecuteReader()

        If (r.Read() = True) Then
            lbl_nombre.Text = r("Nombre")
            lbl_correo.Text = r("Correo")
            lbl_nempleado.Text = r("NEmpleado")
            lbl_departamento.Text = r("Departamento")
            lbl_ubicacion.Text = r("Ubicacion")
            lbl_ubicacion.NavigateUrl = r("linkubicacion")
            lbl_puesto.Text = r("puesto")
            lbl_empresa.Text = r("Empresa")
            lbl_Estatus.Text = r("estatus")

        End If
        cn.Close()
        ' LLENAMOS LA TABLA CON LOS EQUIPOS QUE EL USUARIO TIENE ASIGNADO, EN CASO DE NO TENER SE IMPRIME MENSAJE.
        Dim ds As New DataSet
        Dim sqlDA As New SqlDataAdapter("GetEquiposByUser " & usuario.ToString, System.Configuration.ConfigurationManager.AppSettings("Sistema_SARTI"))

        ds.Tables.Add("Tabla")
        sqlDA.Fill(ds.Tables("Tabla"))
        If ds.Tables("Tabla").Rows.Count() > 0 Then
            DGV_EquiposbyUser.DataSource = ds.Tables("Tabla")
            DGV_EquiposbyUser.DataBind()
            pnl_noEquipos.Visible = False
        Else
            pnl_noEquipos.Visible = True
        End If




        If IsPostBack = False Then

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
        End If

    End Sub
    Private Sub ActualizaUsuario(nombre, correo, puesto, empresa, departamento, ubicacion, Estatus, usuario)

        Dim QUERY_UPDATE As String = "UPDATE Usuario SET "
        Dim datos = New String() {nombre, correo, puesto, empresa, departamento, ubicacion, Estatus}
        Dim valores = New String() {"Nombre='", "Correo='", "IdPuesto=", "Empresa=", "IdDepartamento=", "IdUbicacion=", "estatus ='"}
        Dim update(5) As String
        Dim cont As Integer = 0
        Dim i As Integer = 1
        Dim v As Integer = 0
        Dim NumActualizaciones As Integer = 0 ' contador que validara si llevamos registros a actualizar...

        For Each item In datos
            If item <> "" Then
                NumActualizaciones = NumActualizaciones + 1
                If (valores(v) = "Nombre='" Or valores(v) = "Correo='" Or valores(v) = "estatus ='") Then
                    update(cont) = valores(v) & item & "'"
                Else
                    update(cont) = valores(v) & item
                End If

                ' update(cont) = valores(v) & item & "'"
                cont = cont + 1
            End If
            v = v + 1
        Next

        For Each item In update

            If item <> "" Then
                QUERY_UPDATE = QUERY_UPDATE & item
                If update(i) <> Nothing Then
                    QUERY_UPDATE = QUERY_UPDATE & ","
                End If

            End If
            i = i + 1
        Next
        If NumActualizaciones > 0 Then

            QUERY_UPDATE = QUERY_UPDATE & " WHERE IdUsuario= " & usuario

            Dim registro As SqlDataReader
            Dim conn As New SqlConnection(System.Configuration.ConfigurationManager.AppSettings("Sistema_SARTI"))
            conn.Open()
            Dim cmd As SqlCommand = New SqlCommand(QUERY_UPDATE, conn)
            cmd.CommandType = CommandType.Text
            registro = cmd.ExecuteReader()
            pnl_mensaje.Visible = True

        End If

    End Sub

End Class
Imports System.Data.SqlClient
Public Class DetalleUserAdmin
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Correo") = "" Then ' Valido usuario logeado.
            Response.Redirect("Default.aspx")
        End If

        Dim user As Integer = Page.Request.QueryString("user")
        Dim nombre As String = Page.Request.Form.Item("nombre")
        Dim correo As String = Page.Request.Form.Item("correo")
        Dim estatus As String = Page.Request.Form.Item("estatus")
        Dim password As String = Page.Request.Form.Item("Contraseña")
        Dim QUERY_UPDATE As String = "UPDATE Usuario_Administracion SET "

        If user = 0 Then
            user = Session("Modifica_user")
        Else
            Session("Modifica_user") = user
        End If

        If IsPostBack Then

            Dim datos = New String() {nombre, correo, estatus, password}
            Dim valores = New String() {"Nombre='", "Correo='", "estatus='", "Contraseña='"}
            Dim update(3) As String
            Dim cont As Integer = 0
            Dim i As Integer = 1
            Dim v As Integer = 0

            For Each item In datos
                If item <> "" Then
                    update(cont) = valores(v) & item & "'"
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
            QUERY_UPDATE = QUERY_UPDATE & " WHERE IdUser= " & user

            Dim registro As SqlDataReader
            Dim conn As New SqlConnection(System.Configuration.ConfigurationManager.AppSettings("Sistema_SARTI"))
            conn.Open()
            Dim cmd As SqlCommand = New SqlCommand(QUERY_UPDATE, conn)
            cmd.CommandType = CommandType.Text
            registro = cmd.ExecuteReader()
            pnl_mensaje.Visible = True

        End If

        Dim ds As New DataSet
        Dim dt As New DataTable
        Dim QUERY As String = "SELECT Nombre, Correo, estatus from Usuario_Administracion WHERE IdUser = " & user
        Dim da As New SqlDataAdapter(QUERY, System.Configuration.ConfigurationManager.AppSettings("Sistema_SARTI"))

        da.Fill(dt)

        If dt.Rows.Count() > 0 Then
            For Each row As DataRow In dt.Rows
                lbl_nombre.Text = row("Nombre").ToString
                lbl_correo.Text = row("Correo").ToString
                lbl_estatus.Text = row("estatus").ToString
            Next

        End If

    End Sub

End Class
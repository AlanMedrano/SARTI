Imports System.Data.SqlClient
Public Class AgregarEquipo
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Correo") = "" Then ' Valido usuario logeado.
            Response.Redirect("Default.aspx")
        End If
        Dim TipoEquipo As Integer = Request.Form.Item("DDL_TipoDeEquipo")
        Dim Marca As String = Request.Form.Item("marca")
        Dim Modelo As String = Request.Form.Item("modelo")
        Dim FechaCompra As String = Request.Form.Item("feccompra")
        Dim Detalles As String = Request.Form.Item("detalles")
        Dim Falla As String = Request.Form.Item("falla")
        Dim NFactura As String = Request.Form.Item("nfactura")
        Dim Puerto_USB As Integer = Request.Form.Item("usb")
        Dim Puerto_HDMI As Integer = Request.Form.Item("hdmi")
        Dim Puerto_VGA As Integer = Request.Form.Item("vga")
        Dim Puerto_Red As Integer = Request.Form.Item("Puertod_red")
        Dim CD As Integer = Request.Form.Item("cd")
        Dim TiempoGarantia As Integer = Request.Form.Item("tiempogarantia")
        Dim bluetooth As String = Request.Form.Item("inp_bluetooth")
        Dim n_serie As String = Request.Form.Item("NSerie")
        Dim ram As String = Request.Form.Item("ram")
        Dim dduro As String = Request.Form.Item("discoduro")
        Dim procesador As String = Request.Form.Item("procesador")
        Dim FileFactura As String ' PENDIENTE    Filefactura


        Dim dt As New DataTable
        Dim da As New SqlDataAdapter("Obtener_TiposDeEquipos", System.Configuration.ConfigurationManager.AppSettings("Sistema_SARTI"))
        da.SelectCommand.CommandType = CommandType.StoredProcedure
        da.Fill(dt)
        ' LLENAMOS LA OPCION "TIPO DE EQUIPO"
        Dim item As New ListItem

        If (dt.Rows.Count() > 0) Then
            For Each row As DataRow In dt.Rows
                DDL_TipoDeEquipo.Items.Add(New ListItem(row("Definicion"), row("IDTipoEquipo")))
            Next
        End If


        ' INSERTAMOS EL NUEVO EQUIPO
        If (IsPostBack) Then

            Dim Validabluetooth As Integer
            Dim dt2 As New DataTable
            Dim row2 As DataRow

            If (bluetooth = "on") Then
                Validabluetooth = 1
            Else
                Validabluetooth = 0
            End If

            Dim registro As SqlDataReader
            Dim conn As New SqlConnection(System.Configuration.ConfigurationManager.AppSettings("Sistema_SARTI"))
            conn.Open()
            Dim cmd As SqlCommand = New SqlCommand("RegistrarEquipo", conn)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@IdTipoequipo", TipoEquipo)
            cmd.Parameters.AddWithValue("@Marca", Marca)
            cmd.Parameters.AddWithValue("@Modelo", Modelo)
            cmd.Parameters.AddWithValue("@Detalle", Detalles)
            cmd.Parameters.AddWithValue("@FechaCompra", FechaCompra)
            cmd.Parameters.AddWithValue("@NumFactura", NFactura)
            cmd.Parameters.AddWithValue("@Falla", Falla)
            cmd.Parameters.AddWithValue("@TiempoGarantia", TiempoGarantia)
            cmd.Parameters.AddWithValue("@PuertoUSB", Puerto_USB)
            cmd.Parameters.AddWithValue("@HDMI", Puerto_HDMI)
            cmd.Parameters.AddWithValue("@VGA", Puerto_VGA)
            cmd.Parameters.AddWithValue("@PuertoRed", Puerto_Red)
            cmd.Parameters.AddWithValue("@UnidadCD", CD)
            cmd.Parameters.AddWithValue("@Bluetooth", Validabluetooth)
            cmd.Parameters.AddWithValue("@n_serie", n_serie)
            cmd.Parameters.AddWithValue("@ram", ram)
            cmd.Parameters.AddWithValue("@Dduro", dduro)
            cmd.Parameters.AddWithValue("@Procesador", procesador)
            cmd.Parameters.AddWithValue("@Factura", "") ' FileFactura PENDIENTE

            registro = cmd.ExecuteReader()

            If (registro.Read() = True) Then
                If (registro("TIPO_MENSAJE") = "EXITO") Then
                    lbl_exito.Text = registro("MENSAJE")
                    Pnl_exito.Visible = True
                    pnl_error.Visible = False

                ElseIf (registro("TIPO_MENSAJE") = "ERROR") Then
                    lbl_error.Text = registro("MENSAJE")
                    pnl_error.Visible = True
                    Pnl_exito.Visible = False
                End If
            End If
            conn.Close()
        End If
    End Sub

End Class
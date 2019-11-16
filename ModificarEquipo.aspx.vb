Imports System.Data.SqlClient
Public Class ModificarEquipo
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("Correo") = "" Then ' Valido usuario logeado.
            Response.Redirect("Default.aspx")
        End If
        ' 
        If IsPostBack Then
            Dim modelo, marca, fecha_compra, detalles, falla, num_factura, num_serie, procesador, ram, disco_duro As String
            Dim puertos_usb, puertos_hdmi, puertos_vga, puertos_red, unidad_cd, tiempo_garantia As String

            Dim Query As String = "UPDATE Usuario SET "
            Dim Datos = New String() {modelo, marca, fecha_compra, detalles, falla, num_factura, num_serie, procesador, ram, disco_duro, puertos_usb, puertos_hdmi, puertos_vga, puertos_red, unidad_cd, tiempo_garantia}
            Dim valores = New String() {"Modelo='", "Marca='", "FechaCompra='", "Detalles='", "Falla='", "Numfactura='", "N_Serie='", "procesador='", "ram='", "DiscoDuro='", "PuertoUSB=", "PuertoHDMI=", "PuertoVGA=", "PuertoRed=", "UnidadCD=", "TiempoGarantia="}


            modelo = Page.Request.Form.Item("modelo")
            marca = Page.Request.Form.Item("marca")
            fecha_compra = Page.Request.Form.Item("feccompra")
            detalles = Page.Request.Form.Item("detalles")
            falla = Page.Request.Form.Item("falla")
            num_factura = Page.Request.Form.Item("nfactura")
            num_serie = Page.Request.Form.Item("NSerie")
            procesador = Page.Request.Form.Item("procesador")
            ram = Page.Request.Form.Item("ram")
            disco_duro = Page.Request.Form.Item("discoduro")
            puertos_usb = Page.Request.Form.Item("usb")
            puertos_hdmi = Page.Request.Form.Item("hdmi")
            puertos_vga = Page.Request.Form.Item("vga")
            puertos_red = Page.Request.Form.Item("Puertod_red")
            unidad_cd = Page.Request.Form.Item("cd")
            tiempo_garantia = Page.Request.Form.Item("tiempogarantia")









        End If

        If IsPostBack = False Then
            Dim IdEquipo As Integer = Page.Request.QueryString("Equipo")

            ' Obtenemos los datos del usuario
            Dim r As SqlDataReader
            Dim cn As New SqlConnection(System.Configuration.ConfigurationManager.AppSettings("Sistema_SARTI"))
            cn.Open()
            Dim command As SqlCommand = New SqlCommand("GetDatosEquipo", cn)
            command.CommandType = CommandType.StoredProcedure
            command.Parameters.AddWithValue("@IdEquipo", IdEquipo)
            r = command.ExecuteReader()

            If (r.Read() = True) Then

                lbl_Detalles.Text = r("Detalles")
                lbl_DiscoDuro.Text = r("DiscoDuro")
                lbl_fallas.Text = r("Falla")
                lbl_FechaCompra.Text = r("FechaCompra")
                lbl_Garantia.Text = r("TiempoGarantia")
                lbl_Marca.Text = r("Marca")
                lbl_Modelo.Text = r("Modelo")
                lbl_NSerie.Text = r("N_Serie")
                lbl_NumFactura.Text = r("Numfactura")
                lbl_procesador.Text = r("procesador")
                lbl_PuertosHDMI.Text = r("PuertoHDMI")
                lbl_PuertosRed.Text = r("PuertoRed")
                lbl_PuertosUSB.Text = r("PuertoUSB")
                lbl_PuertosVGA.Text = r("PuertoVGA")
                lbl_RAM.Text = r("ram")
                lbl_TipoEquipo.Text = r("TipoEquipo")
                lbl_UnidadCD.Text = r("UnidadCD")
            End If
            cn.Close()

        End If


    End Sub

End Class
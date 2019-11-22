Imports System.Data.SqlClient
Public Class ModificarEquipo
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("Correo") = "" Then ' Valido usuario logeado.
            Response.Redirect("Default.aspx")
        End If
        Dim IdEquipo As Integer = Page.Request.QueryString("Equipo")

        If IdEquipo <> 0 Then
            Session("Modifica_IdEquipo") = IdEquipo
        Else
            IdEquipo = Session("Modifica_IdEquipo")
        End If

        If IsPostBack Then
            Dim modelo, marca, fecha_compra, detalles, falla, num_factura, num_serie, procesador, ram, disco_duro As String
            Dim puertos_usb, puertos_hdmi, puertos_vga, puertos_red, unidad_cd, tiempo_garantia, Bluetooth As String
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
            Bluetooth = Page.Request.Form.Item("inp_bluetooth")

            Dim Query As String = "UPDATE Usuario SET "
            Dim Datos = New String() {Trim(modelo), Trim(marca), Trim(fecha_compra), Trim(detalles), Trim(falla), Trim(num_factura), Trim(num_serie), Trim(procesador), Trim(ram), Trim(disco_duro), Trim(puertos_usb), Trim(puertos_hdmi), Trim(puertos_vga), Trim(puertos_red), Trim(unidad_cd), Trim(tiempo_garantia), Trim(Bluetooth)}
            Dim valores = New String() {"Modelo='", "Marca='", "FechaCompra='", "Detalles='", "Falla='", "Numfactura='", "N_Serie='", "procesador='", "ram='", "DiscoDuro='", "PuertoUSB=", "PuertoHDMI=", "PuertoVGA=", "PuertoRed=", "UnidadCD=", "TiempoGarantia=", "Bluetooth="}
            '   Dim Datos(,) As String = {{"Modelo='", Trim(modelo)}, {"Marca='", Trim(marca)}, {"FechaCompra='",Trim(fecha_compra)}, {,}, {,}}
            Dim update(17) As String
            Dim QUERY_UPDATE As String = "UPDATE Equipo SET "
            'CONTADORES...
            Dim v As Integer
            Dim cont As Integer
            Dim i As Integer
            v = 0
            cont = 0
            i = 1




            For Each item In Datos
                If item <> "" Then ' VALIDAMOS QUE SE HAYA INGRESADO ALGUN DATO A MODIFICAR...
                    If (valores(v) = "PuertoUSB=" Or valores(v) = "PuertoHDMI=" Or valores(v) = "PuertoVGA=" Or valores(v) = "PuertoRed=" Or valores(v) = "UnidadCD=" Or valores(v) = "TiempoGarantia=" Or valores(v) = "Bluetooth=") Then 'VALIDAMOS SI EL VALOR POR MODIFICAR ES TIPO STRING O NUMERICO...
                        update(cont) = valores(v) & item
                    Else
                        update(cont) = valores(v) & item & "'"
                    End If
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




            QUERY_UPDATE = QUERY_UPDATE & " WHERE IdEquipo= " & IdEquipo

            Dim registro As SqlDataReader
            Dim conn As New SqlConnection(System.Configuration.ConfigurationManager.AppSettings("Sistema_SARTI"))
            conn.Open()
            Dim cmd As SqlCommand = New SqlCommand(QUERY_UPDATE, conn)
            cmd.CommandType = CommandType.Text
            registro = cmd.ExecuteReader()
            pnl_mensaje.Visible = True




        End If




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

            If (r("Bluetooth") = 1) Then
                lbl_bluetooth.Text = "Si"
            Else
                lbl_bluetooth.Text = "No"
            End If


        End If

        cn.Close()




    End Sub

End Class
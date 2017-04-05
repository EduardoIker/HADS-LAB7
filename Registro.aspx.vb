Imports AccesoDatos.accesoDatosSQL
Imports System.Security.Cryptography

Public Class WebForm2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        conectar()
    End Sub

    Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Unload
        cerrarConexion()
    End Sub

    Protected Sub TextBox6_TextChanged(sender As Object, e As EventArgs) Handles TextBox6.TextChanged

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim nombre As String
        Dim apellidos As String
        Dim dni As String
        Dim password As String
        Dim pregunta As String
        Dim respuesta As String
        Dim correo As String
        Dim res As String
        Dim rol = "A"

        nombre = TextBox9.Text
        apellidos = TextBox3.Text
        password = TextBox5.Text
        ' Calcular el hash 
        Dim sha1 As New sha1.sha1
        Dim hassedPassword = sha1.getSHA1Hash(password)
        pregunta = TextBox7.Text
        correo = TextBox2.Text
        dni = TextBox4.Text
        respuesta = TextBox8.Text
        If (RadioButton1.Checked) Then
            rol = "P"
        End If
        res = insertar(correo, nombre, apellidos, pregunta, respuesta, dni, hassedPassword, rol)
        Label2.Text = res
    End Sub
End Class
Public Class UserSessionManager
    Private Sub addUser(ByVal email As String)
        Application.Lock()
        Dim usuariosConectados() As String
        usuariosConectados = Application.Contents("listaUsuarios")
        usuariosConectados(usuariosConectados.Length) = email
        Application.Contents("listaUsuarios") = usuariosConectados
        Application.UnLock()
    End Sub
End Class

<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="BloquearUsuarios.aspx.vb" Inherits="Laboratorio2.BloquearUsuarios" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div>
    
        <asp:Panel ID="Panel1" runat="server" BackColor="#CCCCCC" Height="76px">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton1" runat="server">Cerrar Sesión</asp:LinkButton>
            <ajaxToolkit:ConfirmButtonExtender ID="LinkButton1_ConfirmButtonExtender" runat="server" TargetControlID="LinkButton1" 
            ConfirmText="¿Estas seguro de que quieres cerrar sesion?"/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text="Administrador" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Bloquear/Desbloquear Usuario"></asp:Label>
        </asp:Panel>
        <br />
        <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Lista de usuarios"></asp:Label>
        :<br />

    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="email" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ButtonType="Button" EditText="Bloquear/Desbloquear" ShowEditButton="True" />
                <asp:BoundField DataField="email" HeaderText="usuario" ReadOnly="True" SortExpression="email" />
                <asp:CheckBoxField DataField="confirmado" HeaderText="confirmado" SortExpression="confirmado" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HADS17_TAREASConnectionString %>" SelectCommand="GetUsuarios" SelectCommandType="StoredProcedure" UpdateCommand="UPDATE Usuarios SET confirmado = @confirmado WHERE (email = @email)">
            <SelectParameters>
                <asp:SessionParameter Name="admin" SessionField="correo" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="confirmado" />
                <asp:Parameter Name="email" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Administrador/Administrador.aspx">Volver al menu del administrador</asp:HyperLink>
    </form>
</body>
</html>

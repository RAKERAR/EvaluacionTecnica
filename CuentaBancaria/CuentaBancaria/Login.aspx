<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CuentaBancaria.Login" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Cuenta Bancaria</title>
    <meta http-equiv="X-UA-Compatible" content="IE=9" />
    <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=2.0; user-scalable=1;" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <link rel="Shortcut Icon" href="favicon.ico" />
    <link rel="apple-touch-icon" href="apple-touch-icon.png" />
    <link rel="apple-touch-icon-precomposed" href="apple-touch-icon.png" />
    <link href="CSS/master.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="JS/jQuery.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            updateOrientation();
        });

        window.onorientationchange = updateOrientation;

        function updateOrientation() {
            var orientation = window.orientation;
            switch (orientation) {
                case 0:
                    $("#horizontalContent").hide();
                    $("#verticalContent").show();
                    break;
                case 90:
                    $("#verticalContent").hide();
                    $("#horizontalContent").show();
                    break;
                case -90:
                    $("#verticalContent").hide();
                    $("#horizontalContent").show();
                    break;
                case 180:
                    $("#horizontalContent").hide();
                    $("#verticalContent").show();
                    break;
            }
        }
    </script>
    <style type="text/css">
        .login
        {
            top: 50%;
            left: 50%;
            position: absolute;
            margin-left: -135px;
            margin-top: -78px;
        }
    </style>
</head>
<body style="text-align: left; vertical-align: top; margin: 0px 0px 0px 0px; overflow: hidden;">
    <form id="form1" runat="server" method="post">
    <div id="horizontalContent" style="width: 100%; height: 100%; position: absolute;">
        <asp:Login ID="Login1" runat="server" DestinationPageUrl="~/Default.aspx" FailureText="Usuario o contraseña no validos"
            LoginButtonText="Conectar" PasswordLabelText="Contraseña:" UserNameLabelText="Usuario:"
            DisplayRememberMe="False" BackColor="#FFFFFF" BorderColor="#000000" BorderStyle="Solid"
            BorderWidth="1px" Font-Names="Verdana" Font-Size="14px" BorderPadding="4" ForeColor="#333333"
            CssClass="login">
            <TitleTextStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Font-Size="14px" />
            <TextBoxStyle Font-Size="14px" />
            <LoginButtonStyle BackColor="White" BorderColor="#000000" BorderStyle="Solid" BorderWidth="1px"
                Font-Names="Verdana" Font-Size="14px" ForeColor="#FFFFFF" />
            <LayoutTemplate>
                <table border="0" cellpadding="4" cellspacing="0" style="border-collapse: collapse;">
                    <tr>
                        <td>
                            <table border="0" cellpadding="0">
                                <tr>
                                    <td align="center" colspan="2" style="color: White; height: 25px; background-color: #333333;
                                        font-size:14px; font-weight: bold;">
                                        Log In
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 100px; font-size: 10px; font-weight: bold;">
                                        <asp:RequiredFieldValidator Display="Dynamic" ID="UserNameRequired" runat="server"
                                            ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required."
                                            ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Usuario:</asp:Label>
                                    </td>
                                    <td style="width: 150px">
                                        <asp:TextBox ID="UserName" runat="server" Font-Size="14px" Width="150px" Text=""></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="font-size: 10px; font-weight: bold;">
                                        <asp:RequiredFieldValidator Display="Dynamic" ID="PasswordRequired" runat="server"
                                            ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required."
                                            ValidationGroup="Login1">*</asp:RequiredFieldValidator><asp:Label ID="PasswordLabel"
                                                runat="server" AssociatedControlID="Password">Contraseña:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Password" runat="server" Font-Size="14px" TextMode="Password" Width="150px"  Text="1" OnTextChanged="Password_TextChanged"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="color: Red;">
                                        <asp:Literal ID="FailureText2" runat="server" EnableViewState="false"></asp:Literal>
                                         <asp:Label ID="FailureText" runat="server" Text="" Visible="false"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" colspan="2">
                                        <asp:Button ID="LoginButton" runat="server" BackColor="White" BorderColor="#507CD1"
                                            BorderStyle="Solid" BorderWidth="1px" CommandName="Login" Font-Names="Verdana"
                                            Font-Size="14px" ForeColor="#284E98" Text="Conectar" ValidationGroup="Login1"  OnClick="btnEntrar_Click"/>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
        </asp:Login>
    </div>
    <div id="verticalContent" style="width: 100%; height: 100%; position: absolute; display: none;">
        <table cellpadding="0" cellspacing="0" border="0" style="width: 768px; height: 1024px;">
            <tr>
                <td align="center" valign="middle">
                    <asp:Image runat="server" ID="rotate" ImageUrl="~/Imagenes/LogoRotate.png" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>


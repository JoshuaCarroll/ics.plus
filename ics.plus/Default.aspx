<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ICS+</title>
    <style type="text/css">
        body {
            background-color: #29201d;
            color: #fff;
        }
        #pageContainer {
            width: 100%;
            height: 400px;
        }
        #divLogin {
            width: 200px;
            background-color: #665753;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="pageContainer">
            <div id="divLogin">
                <div class="header">User login</div>
                <div class="content">
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="username" AutoCompleteType="Email"></asp:TextBox>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="password" TextMode="Password"></asp:TextBox>
                    <asp:Button ID="btnSignin" runat="server" Text="Sign in" CssClass="signin" OnClick="btnSignin_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>

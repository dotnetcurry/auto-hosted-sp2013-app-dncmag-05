<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CustomerDetailsWeb.Pages.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:DataList ID="DataList1" runat="server" RepeatColumns="3">
               <HeaderTemplate>
                <h1 style="text-align:center;background-color:#000066;color:white">All Customer Details</h1>
            </HeaderTemplate>
            <ItemTemplate>
                <table>
                    <tr>
                        <td colspan="4">
                                        <asp:Image ID="Image1" Height="200px" Width="200px" runat="server" ImageUrl='<%# Eval("Photo") %>' />
                                    </td>
                        <td style="height:200px">
                            <table>
                                <tr>
                                    <td style="height:50px">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("CustomerID") %>' style="text-align:center;background-color:#000066;color:white"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height:50px">
<asp:Label ID="Label2" runat="server" Text='<%# Eval("CustomerName") %>' style="text-align:center;background-color:#000066;color:white"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height:50px">
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("City") %>' style="text-align:center;background-color:#000066;color:white"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height:50px">
                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Country") %>' style="text-align:center;background-color:#000066;color:white"></asp:Label>
                                    </td>
                                </tr>
                                
                    </table>
                            </td>
                    </tr>
                </table>
            </ItemTemplate>
            <FooterTemplate>
                <h4 style="text-align:center;background-color:#000066;color:white">Copy Right Year - 2012/13</h4>
            </FooterTemplate>
        </asp:DataList>
    </div>
    </form>
</body>
</html>

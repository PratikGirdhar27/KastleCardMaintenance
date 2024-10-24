<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddKastleCard.aspx.cs" Inherits="KastleCardMaintenance.WebForm2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Kastle Card</title>
    <style type="text/css">
    .kastleContainer {
        font-family:Verdana;
        font-size:14px;
        color:rgb(93, 123, 157);
        padding: 20px;
        margin: 0 auto;
        width: 400px;        
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="kastleContainer">
        <strong>Choose Employee:</strong><br />
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="EmployeeID" 
             AppendDataBoundItems="true"
            onselectedindexchanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem Selected="True" Value="0" Text="Select"></asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:WRFMasterConnectionString %>" SelectCommand="select (firstName+' '+ISNULL(middleName,'')+' '+lastName)Name,EmployeeID
from [dbo].[Employees]
where EmployeeID not in(select PartyId from v_KastlecardIds where active=1 and PartyIdentifierType=2)
and Active=1
order by Name"></asp:SqlDataSource>
        <br />
        <br />
        <br />
        <strong>Add Card For:</strong><br />
        <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
        <br />
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <br />
        <strong>Kastle Card Number:</strong><br />
        <asp:TextBox ID="txtCardNum" runat="server"></asp:TextBox>
&nbsp;
        <asp:Button ID="btnAddCard" runat="server" onclick="btnAddCard_Click" 
            Text="Add Kastle Card" />
        <br />
    </div>
    </form>
</body>
</html>

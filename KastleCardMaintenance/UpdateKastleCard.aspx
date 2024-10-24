<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateKastleCard.aspx.cs" Inherits="KastleCardMaintenance.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<style type="text/css">
    .kastleHideColumn{display: none;}  
    .kastleContainer {
        font-family:Verdana;
        font-size: 14px;
        color:rgb(93, 123, 157);
        padding: 20px;
        margin: 0 auto;
        width: 400px;        
    }
</style>
    <title>Update Kastle Card</title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="kastleContainer">
        <strong>Choose Employee:</strong><br />
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="PartyId">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:WRFMasterConnectionString %>" SelectCommand="select (lastName+' '+ISNULL(middleName,'')+' '+PreferredFirstName)Name, PartyId,lastName
from v_KastleCardIds
where active=1  and PartyIdentifierType=2
order by lastName"></asp:SqlDataSource>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" 
            GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" 
                    SortExpression="Name" />
                <asp:BoundField DataField="Identifier" HeaderText="Kastle Card Number" 
                    SortExpression="Identifier" />
                <asp:BoundField DataField="PartyId" HeaderText="PartyId" 
                    SortExpression="PartyId" >
                <ControlStyle CssClass=" kastleHideColumn" />
                <HeaderStyle CssClass=" kastleHideColumn" />
                <ItemStyle CssClass=" kastleHideColumn" />
                </asp:BoundField>
            </Columns>
            <EditRowStyle BackColor="#BBBBBB" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:WRFMasterConnectionString %>" SelectCommand="Select (lastName+' '+ISNULL(middleName,'')+' '+PreferredFirstName)Name,CompleteId as Identifier ,PartyId
from [Identification].[v_KastleCardIds]
where Active =1 and PartyIdentifierType=2 and PartyID=@PartyId 
" UpdateCommand="[Identification].usp_UpdateKastleCardIdentifier" 
            UpdateCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="PartyId" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="PartyId" Type="Int32" />
                <asp:Parameter Name="Identifier" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>

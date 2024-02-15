<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewHouses.aspx.cs" Inherits="GraduationProject.ViewHouses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
 <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataKeyNames="id"   OnPageIndexChanging="GridView1_PageIndexChanging"  OnRowCancelingEdit="GridView1_RowCancelingEdit"  OnRowDeleting="GridView1_RowDeleting"  OnRowEditing="GridView1_RowEditing" OnRowUpdating="">  
                    <Columns>  
                        <asp:BoundField DataField="id" HeaderText="S.No." />  
                        <asp:BoundField DataField="name" HeaderText="Name" />  
                        <asp:BoundField DataField="address" HeaderText="address" />  
                        <asp:BoundField DataField="country" HeaderText="Country" />  
                        <asp:CommandField ShowEditButton="true" />  
                        <asp:CommandField ShowDeleteButton="true" /> </Columns>  
                </asp:GridView>  
        </div>
    </form>
</body>
</html>

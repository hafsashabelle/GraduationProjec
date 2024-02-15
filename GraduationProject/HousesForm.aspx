<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HousesForm.aspx.cs" Inherits="GraduationProject.HousesForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
   
    <title>Houses Page</title>

    <!-- Bootstrap -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"
        rel="stylesheet" />
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Title Page-->

      
   
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div class="container">
            <div class="row">
                
                    <h2 style="text-align: center; font-family: Algerian"> Houses </h2>
                <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
                <!-- Include all compiled plugins (below), or include individual files as needed -->
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary btn-lg" style=" outline: none; cursor: pointer; background-color:#4856f7" data-toggle="modal" data-target="#myModal">
                    + Add New 
                </button>
        
            </div>
            <br />

            <div class="container-fluid bg-page" id="conteudo">
                <div class="row">
                    <div class="col-md-6">
                        <asp:TextBox ID="txtsearching" runat="server" placeholder="Search here..." CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <asp:Button ID="btnsearch" runat="server" Text="Search" Style="width: 80px; height: 35px; text-align: center;"  />
                    </div>
                    </div>
                <br />
                    <div class="row">
                                                

                         <asp:GridView ID="GridView1" CssClass="table table-bordered table-hover table-responsive" runat="server" AllowPaging="True" DataKeyNames="House_id"
                                PageSize="4" AllowSorting="True" ShowFooter="True" AutoGenerateColumns="False" HorizontalAlign="Center" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" CellPadding="4" ForeColor="#333333" GridLines="None"  OnPageIndexChanging="GridView1_PageIndexChanging" >
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>

                                   <asp:BoundField DataField="House_id" HeaderText="House ID" SortExpression="Id" />
                             <asp:BoundField DataField="Owner_id" HeaderText="Owner ID" SortExpression="Id" />
                             <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Id" />
                             <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Id" />
                            <asp:BoundField DataField="Rooms" HeaderText="Rooms" SortExpression="Id" />
                            <asp:BoundField DataField="Toilets" HeaderText="Toilets" SortExpression="Id" />
                            <asp:BoundField DataField="Farther_description" HeaderText="Farther info" SortExpression="Id" />
                            <asp:BoundField DataField="Price" HeaderText=" Price" SortExpression="Id" />
                            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Id" />

                             <asp:TemplateField HeaderText="Images">
                                 <ItemTemplate>
                                       <img src="images/<%#  Eval("Images") %>" style="width:80px;height:100px;" />
                                 </ItemTemplate>
                               
                                 
                        </asp:TemplateField>



                                    <asp:CommandField ButtonType="Button" HeaderText="Action" ShowDeleteButton="True" />



                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EFF3FB" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                            </asp:GridView>
                        </div>
                        
               
                
                      <!-- Modal -->
                        <asp:Label ID="Label4" runat="server" Text=""></asp:Label><br />
                        <div class="modal" id="myModal" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"
                            aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header" style="background-color:#4856f7; color:white">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabel">House Registration</h4>
                                    </div>
                                 
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                                    <div class="modal-body">
                                    <div class="row">
                                         <div class="col-md-2">
                    <label class="form-label"> House ID </label>
                      <asp:TextBox ID="txthouseid" runat="server" CssClass="form-control"></asp:TextBox>

                </div>
                                         <div class="col-md-2">
                                        <label class="form-label"> LoadData </label>        
                                <asp:Button ID="btnload" runat="server"   CssClass="btn btn-light" Text="Load" OnClick="btnload_Click" />
                </div>

                <div class="col-md-4">
                    <label class="form-label"> Owner ID </label>
                    <asp:DropDownList ID="ownerid_list" runat="server" CssClass="form-control"></asp:DropDownList>

                </div>
                                        <div class="col-md-4">
                    <label class="form-label"> Address </label>
                    <asp:TextBox ID="txtaddress" runat="server" CssClass="form-control"></asp:TextBox>

                </div>
                                            </div> 
                                        <br />
                         
                    <div class="row">
                                         <div class="col-md-4">
                    <label class="form-label"> Type </label>
                     <asp:TextBox ID="txttype" runat="server" CssClass="form-control"></asp:TextBox>

                </div>

                <div class="col-md-4">
                    <label class="form-label"> Rooms </label>
                    <asp:TextBox ID="txtrooms" runat="server" CssClass="form-control"></asp:TextBox>

                </div>
                                        <div class="col-md-4">
                    <label class="form-label"> Toilets </label>
                    <asp:TextBox ID="txttoilets" runat="server" CssClass="form-control"></asp:TextBox>

                </div>
                                            </div>
                                        <br />
                                     
                                   
                              <div class="row">
                                         <div class="col-md-4">
                    <label class="form-label"> Price</label>
                     <asp:TextBox ID="txtprice" runat="server" CssClass="form-control"></asp:TextBox>

                </div>

                <div class="col-md-4">
                    <label class="form-label"> status</label>
                    <asp:DropDownList ID="Status_list" runat="server" CssClass="form-control">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem> Vacant </asp:ListItem>
                        <asp:ListItem> Occupied </asp:ListItem>
                    </asp:DropDownList>

                </div>
                                    
                                            </div> 
                                           <div class="row">
                                            <div class="col-md-12">
                                                
                    <label class="form-label"> Farther Description </label>
                                                <asp:TextBox ID="txtinfo" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                            </div>
                                        </div>
           
                        
                              
                       
                                        </div>
                          </ContentTemplate>
                </asp:UpdatePanel>

                                      
                                            <div class="row">
                                            <div class="col-md-12">
                                                                          
                 <asp:Label ID="Label1" CssClass="form-label" runat="server" Text="   Image Upload"></asp:Label>
                  <asp:FileUpload ID="fileupload1"  CssClass="form-control form-control-lg" runat="server" />
                   <asp:Label ID="lbmsg" Text="" runat="server"></asp:Label>

                </div></div>
                                          <div class="modal-footer">

                                      
                                         
                                              <div class="row">
                                      <div class="col-md-4">
                                                <asp:Button ID="btnRegister" runat="server" Text="Register" Style="border: 0; text-align: center; background: blue; padding: 14px 40px; color: white; outline: none; cursor: pointer;" OnClick="btnRegister_Click"/>
                                            </div>
                    
                                         <div class="col-md-4">
                                             <asp:Button ID="btnupdate" runat="server" Text="Update" Style="border: 0; text-align: center; background: blue; padding: 14px 40px; color: white; outline: none; cursor: pointer;" OnClick="btnupdate_Click"/>
                                            </div>

                                            </div>
                                            </div>
                               
                                </div>
                            
                  
            </div>
        </div>
            </div>
    </form>
       <script src="js/main.js"></script>
</body>
</html>

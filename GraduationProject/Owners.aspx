<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Owners.aspx.cs" Inherits="GraduationProject.Owners" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Owners</title>
    <!-- Bootstrap -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"
        rel="stylesheet" />
    
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    	<link rel="stylesheet" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css"/>
		<link rel="stylesheet" href="css/style.css"/>
 
</head>
<body >
   <form id="form1" runat="server"  >
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="container">
        <div class="row">
            <u>
            <h2 style="text-align:center; font-family:Algerian">Owner Registration!</h2>
                </u>
            <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
            <!-- Include all compiled plugins (below), or include individual files as needed -->
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <button type="button" class="btn btn-primary btn-lg" style=" color: white; background-color:#4856f7;
           outline: none;
           
           cursor: pointer;"" data-toggle="modal" data-target="#myModal">
              + Add
            </button>
            
            </div>
        <br />
            <div class="container-fluid bg-page" id="conteudo">
                <div class="row">
                <div class="col-md-6">
                <asp:TextBox ID="txtsearching" runat="server" placeholder="Search here..." CssClass="form-control"></asp:TextBox>
                    </div>
                <div class="col-lg-6">
                <asp:Button ID="btnsearch" runat="server" Text="Search" style="width:80px; height:35px; text-align:center;" OnClick="btnsearch_Click" />
                </div>

		    <div class="row">
			    <div class="col-lg-12">
                    
                    <asp:GridView ID="GridView1" CssClass="table table-bordered table-hover table-responsive" runat="server"   DataKeyNames="Owner_id"   AllowSorting="True" AutoGenerateColumns="False"  HorizontalAlign="Center" CellPadding="4" GridLines="None" ShowFooter="True" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowEditing="GridView1_RowEditing" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" ForeColor="#333333"  >
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>

                           <asp:TemplateField HeaderText="Owner_id" SortExpression="Owner_id">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtowner_id" Enabled="false" runat="server" Text='<%# Eval("Owner_id") %>'></asp:TextBox>
                                          
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Owner_id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Name" SortExpression="Id">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtname" CssClass="form-control" Width="95px" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Phone" SortExpression="Id">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtphone" runat="server" Text='<%# Bind("Tell") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Tell") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                     <asp:TemplateField HeaderText="Email" SortExpression="Id">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtemail" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                     <asp:TemplateField HeaderText="Gender" SortExpression="Id">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtgender" runat="server" Text='<%# Bind("Gender") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                     <asp:TemplateField HeaderText="Username" SortExpression="Id">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtuser" runat="server" Text='<%# Bind("Username") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("Username") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                     <asp:TemplateField HeaderText="Password" SortExpression="Id">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtpswrd" runat="server" Text='<%# Bind("Password") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Password") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                     
                                   
                                   
                                  

                                    <asp:CommandField ButtonType="Button" ShowEditButton="True" />

                                    
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
		    </div>	
	    </div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <!-- Modal -->
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label><br />
                    <div class="modal" id="myModal" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color:#4856f7">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel">
                                        Owner Registration</h4>
                                </div>
                                <div class="modal-body" >
			
				<%--<form id="form2" runat="server" action="">--%>
                  

					<div class="form-group">
                        <asp:TextBox ID="txtid" runat="server" placeholder="ID" CssClass="form-control"></asp:TextBox>
                       
                        
					</div>
					
					<div class="form-group">
                         <asp:TextBox ID="txtname" runat="server"  placeholder="Name" CssClass="form-control"></asp:TextBox>
                         <asp:TextBox ID="txtphone" runat="server" placeholder="Phone" CssClass="form-control"></asp:TextBox>
                    </div>
                 <div class="form-group">
                         <asp:TextBox ID="txtemail"  runat="server" placeholder="Email"  CssClass="form-control"></asp:TextBox>
                        <asp:TextBox ID="txtaddress"  runat="server" placeholder="Address"  CssClass="form-control"></asp:TextBox>
                     </div>
					<div class="form-group">
                        <asp:Label ID="Label2" runat="server" Text="Gender" style="color:black;" ></asp:Label>
                        <asp:RadioButton ID="Radiomale"  style="color:black;" runat="server" Text="Male"  GroupName="Gender"   />
						 <asp:RadioButton ID="Radiofemale" runat="server" Text="Female"  GroupName="Gender"  style="color:black;" />
						

					</div>
					<br />
				
					<div class="form-group">
                        <asp:TextBox ID="txtuser" runat="server" placeholder="username" CssClass="form-control"></asp:TextBox>
						<asp:TextBox ID="txtpswrd" runat="server" type="Password" placeholder="Password" CssClass="form-control"></asp:TextBox>
						
					</div>
					
                

                                <div class="modal-footer">
                                    <div class="form-group">
                                    <asp:Button ID="btnregister" runat="server"   Text="Register" style="border: 0 ;
           text-align: center;
           background-color:#4856f7;
           padding: 14px 40px;
           color: white;
           outline: none;
           border: 2px solid #45674b;
           border-radius: 24px;
           cursor: pointer;" OnClick="btnregister_Click"/>
                                   

                              </div>    

                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>


    </form>
    <script src="js/main.js"></script>
</body>
</html>

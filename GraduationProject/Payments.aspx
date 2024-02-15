<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payments.aspx.cs" Inherits="GraduationProject.Payments"  EnableEventValidation="false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
   
    <title>Payment Page</title>

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
    
   
     <script type="text/javascript">
        function PrintPanel() {
            var panel = document.getElementById("<%=pnlContents.ClientID %>");
            var printWindow = window.open('', '', 'height=400,width=800');
            printWindow.document.write('<html><head>');
            printWindow.document.write('</head><body >');
            printWindow.document.write(panel.innerHTML);
            printWindow.document.write('</body></html>');
            printWindow.document.close();
            setTimeout(function () {
                printWindow.print();
            }, 500);
            return false;
        }
     </script>
</head>
<body  >
    <form id="form1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div class="container">
            <div class="row">
                
                <u>
                    <h2 style="text-align: center; font-family: Algerian">Payment Details!</h2>
                </u>
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
                    <div class="col-md-3">
                        <label class="form-label"> Search </label>
                        <asp:TextBox ID="txtserch" runat="server" placeholder="Search here..." CssClass="form-control"></asp:TextBox>
                    </div>
                       <div class="col-md-4">
                    <label class="form-label"> Start date </label>
                    <asp:TextBox ID="txtsdate" runat="server" TextMode="Date" CssClass="form-control" ></asp:TextBox>

                </div>
                      <div class="col-md-4">
                    <label class="form-label"> End date </label>
                    <asp:TextBox ID="txtedate" runat="server" TextMode="Date" CssClass="form-control" ></asp:TextBox>

                </div>
                    <div class="col-lg-4">
                        <asp:Button ID="btnsearch" runat="server" Text="Search" Style="width: 80px; height: 35px; text-align: center;" OnClick="btnsearch_Click" />
                    </div>
                    </div>
                <br />
                    <div class="row">
                        <div class="col-lg-12">
                            <asp:Button ID="btnPrint" runat="server" Text="Print " CssClass="btn btn-primary"  OnClientClick="return PrintPanel();" />
                              
                             <asp:Panel ID="pnlContents" runat="server">
                            <asp:GridView ID="GridView1" CssClass="table table-bordered table-hover table-responsive" runat="server" AllowPaging="True" ShowFooter="True"
                                PageSize="5" AllowSorting="True" AutoGenerateColumns="False" HorizontalAlign="Center" DataKeyNames="House_id" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleting="GridView1_RowDeleting">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="House_id" HeaderText="House ID" SortExpression="Id" />
                                    <asp:BoundField DataField="Tenant_id" HeaderText="Tenant ID" SortExpression="Id" />
                                    <asp:BoundField DataField="Account_number" HeaderText="Acooun number" SortExpression="Id" />
                                     <asp:BoundField DataField="Paid_ammount" HeaderText="Ammount" SortExpression="Id" />
                                     <asp:BoundField DataField="Paid_date" HeaderText="Date" SortExpression="Id" />



                                    <asp:CommandField HeaderText="Action" ShowDeleteButton="True" ButtonType="Button" />



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
                                 </asp:Panel>
                        </div>
                        
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
                                        <h4 class="modal-title" id="myModalLabel" >Payment Form</h4>
                                    </div>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                                    <div class="modal-body">
                                        <div class="row">
                                         <div class="col-md-4">
                    <label class="form-label"> House Name and ID </label>
                     <asp:DropDownList ID="houseid_list" runat="server" CssClass="form-control"></asp:DropDownList>

                </div>
                 <div class="col-md-4">

                     <asp:Button ID="btnload" runat="server" Text="Load" OnClick="btnload_Click" />                          
                </div>

                <div class="col-md-4">
                    <label class="form-label"> Tenant Name </label>
                    <asp:DropDownList ID="Tenantid_list" runat="server" CssClass="form-control"></asp:DropDownList>

                </div>
                                            </div>
                                        <br />
                <div class="row">
                <div class="col-md-4">
                    <label class="form-label"> Account number </label>
                    <asp:TextBox ID="txtaccount" runat="server" CssClass="form-control" ></asp:TextBox>

                </div>
                
                

                <div class="col-md-4">
                    <label class="form-label"> Ammount </label>
                    <asp:TextBox ID="txtammount" runat="server" CssClass="form-control" ></asp:TextBox>

                </div>
                   
                                      
                <div class="col-md-4">
                    <label class="form-label"> Date </label>
                    <asp:TextBox ID="txtdate" runat="server" CssClass="form-control"  TextMode="Date"></asp:TextBox>

                </div>
                    </div>

                  <br />
                    <br />
                                       


                                        <div class="modal-footer">
                                            <div class="col-md-4">
                           <asp:Button ID="btnSubmit" runat="server" Text="Submit" Style="border: 0; text-align: center; background: blue; padding: 14px 40px; color: white; outline: none; cursor: pointer;"   OnClick="btnSubmit_Click" />

                         </div>
                                            <div class="col-md-4">
                                                <asp:Button ID="btnupdate" runat="server" Text="Update" Style="border: 0; text-align: center; background: blue; padding: 14px 40px; color: white; outline: none; cursor: pointer;" OnClick="btnupdate_Click"  />

                         </div>

                                        </div>
                                    </div>
                         </ContentTemplate>
                </asp:UpdatePanel>
                                </div>
                            </div>
                   
            </div>
        </div>
</div>

    </form>
    <script src="js/main.js"></script>
</body>
</html>

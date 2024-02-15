<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="GraduationProject.LoginForm.login" %>

<!doctype html>
                        <html>
                            <head>
                                <meta charset='utf-8'>
                                <meta name='viewport' content='width=device-width, initial-scale=1'>
                                <title>Houses - Rental</title>
                                 <link href="../LoginForm/Houses-Rent.png" rel="icon">
                                <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css' rel='stylesheet'>
                                <link href='https://use.fontawesome.com/releases/v5.7.2/css/all.css' rel='stylesheet'>
                                <script type='text/javascript' src=''></script>
                                <style> @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap');

 * {
     margin: 0;
     padding: 0;
     box-sizing: border-box;
     font-family: 'Poppins', sans-serif
 }

 body {
     background: #ecf0f3
 }

 .wrapper {
     max-width: 350px;
     min-height: 500px;
     margin: 80px auto;
     padding: 40px 30px 30px 30px;
     background-color: #03A9F4;
     border-radius: 15px;
     box-shadow: 13px 13px 20px #cbced1, -13px -13px 20px #fff
 }

 .logo {
     width: 80px;
     margin: auto
 }

 .logo img {
     width: 100%;
     height: 80px;
     object-fit: cover;
     border-radius: 50%;
     box-shadow: 0px 0px 3px #5f5f5f, 0px 0px 0px 5px #ecf0f3, 8px 8px 15px #a7aaa7, -8px -8px 15px #fff
 }

 .wrapper .name {
     font-weight: 600;
     font-size: 1.4rem;
     letter-spacing: 1.3px;
     padding-left: 10px;
     color: #555
 }

 .wrapper .form-field input {
     width: 100%;
     display: block;
     border: none;
     outline: none;
     background: none;
     font-size: 1.2rem;
     color: #666;
     padding: 10px 15px 10px 10px
 }

 .wrapper .form-field {
     padding-left: 10px;
     margin-bottom: 20px;
     border-radius: 20px;
     box-shadow: inset 8px 8px 8px #cbced1, inset -8px -8px 8px #fff
 }

 .wrapper .form-field .fas {
     color: #555
 }

 .wrapper .btn {
     box-shadow: none;
     width: 100%;
     height: 40px;
     background-color: #03A9F4;
     color: #fff;
     border-radius: 25px;
     box-shadow: 3px 3px 3px #b1b1b1, -3px -3px 3px #fff;
     letter-spacing: 1.3px
 }

 .wrapper .btn:hover {
     background-color: #039BE5
 }

 .wrapper a {
     text-decoration: none;
     font-size: 0.8rem;
     color: #03A9F4
 }

 .wrapper a:hover {
     color: #039BE5
 }

 @media(max-width: 380px) {
     .wrapper {
         margin: 30px 20px;
         padding: 40px 15px 15px 15px
     }
 }</style>
                                </head>
                                <body oncontextmenu='return false' class='snippet-body'>
                                <div class="wrapper">
    <div class="logo">
    <img src="Houses-Rent.png" /> </div>
    <div class="text-center mt-4 name">Houses Rental </div>
    <form runat="server" id="form1" class="p-3 mt-3">
        <div class="form-field d-flex align-items-center"> <span class="far fa-user"></span> <asp:TextBox ID="txtemail" runat="server"  placeholder="Username"></asp:TextBox> </div>
        <div class="form-field d-flex align-items-center"> <span class="fas fa-key"></span> <asp:TextBox ID="txtpass" runat="server"  placeholder="Password" TextMode="Password"></asp:TextBox> </div>


        <asp:Button ID="btnlogin" Text="Login" runat="server" CssClass="btn mt-3" OnClick="btnlogin_Click" /> 

        <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>


   </form>
        <div class="text-center fs-6" style="color:black"> <a href="../Tenants.aspx" style="color:black;">Create Account</a>  </div>
</div>
                                <script type='text/javascript1' src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js'></script>
                                <script type='text/javascript1' src=''></script>
                                <script type='text/javascript1' src=''></script>
                                <script type='text/Javascript1'></script>
                                </body>
                            </html>

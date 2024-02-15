using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace GraduationProject.LoginForm
{
    public partial class login : System.Web.UI.Page
    {
        ConnectionClass dbconn = new ConnectionClass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            if (txtemail.Text == "" || txtpass.Text == "")
            {
                Label1.Text = ("Username and Password required");

            }
            else
            {
                SqlConnection con = new SqlConnection("Data Source=DESKTOP-1OF0I2F;Initial Catalog=house;Integrated Security=True");
                SqlDataAdapter sda = new SqlDataAdapter("select username,password,roll,name from admin where username='" + txtemail.Text + "' and Password='" + txtpass.Text + "' union select username,password,roll,name from Tenants where username='" + txtemail.Text + "' and Password='" + txtpass.Text + "' union  select username,password,roll,name from owners where username='" + txtemail.Text + "' and Password='" + txtpass.Text + "'", con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Response.Write("<script>alert('Login Sucessfully " + dt.Rows[0][2] + "  ') </script>");

                    Session["roll"] = dt.Rows[0]["roll"];
                    Session["name"] = dt.Rows[0]["name"];
                    Session["username"] = dt.Rows[0]["username"];

                    //   Session["userid"] = dt.Rows[0]["username"]; ;
                    Response.Redirect("/Dashboard V2/Dashboard VTwo.aspx");


                }
                else
                {
                    Label1.Text = ("Username or Password is incorrect");
                }
            }



        }
    }
}
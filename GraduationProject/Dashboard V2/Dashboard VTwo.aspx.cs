using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace GraduationProject.Dashboard_V2
{
    public partial class Dashboard_VTwo : System.Web.UI.Page
    {
        ConnectionClass cc = new ConnectionClass();
        string sql;
        protected void Page_Load(object sender, EventArgs e)
        {
            sql = "select count(*) from tenants";
            cc.cnn(sql);
            //Response.Redirect("login.aspx");

            Label1.Text = Session["name"].ToString();

            //if (Session["roll"].ToString() == "Admin")
            //{
            //   //Panel1.Visible = true;
            //    Panelowners.Visible = true;
            //    Paneltenants.Visible = true;
            //    Panelbooking.Visible = true;
            //    Panelhouse.Visible = true;
            //    Panelpayments.Visible = true;
            //    Panellogout.Visible = true;

            //}
            //else if (Session["roll"].ToString() == "User")
            //{
            //    Panelowners.Visible =false;
            //    Paneltenants.Visible = true;
            //    Panelbooking.Visible =false;
            //    Panelhouse.Visible = true;
            //    Panelpayments.Visible = true;
            //    Panellogout.Visible = true;
            //}
            //else
            //if (Session["roll"].ToString() == "Owner")
            //{

            //    Panelowners.Visible = true;
            //    Paneltenants.Visible = true;
            //    Panelbooking.Visible = true;
            //    Panelhouse.Visible = true;
            //    Panelpayments.Visible = true;
            //    Panellogout.Visible = true;

            //}
            //else
            //{

            //    //String gg = Session["roll"].ToString() ;
            //    //PanelOwner.Visible = false;
            //    //Paneltanent.Visible = false;
            //    //Paneladmin.Visible = false;
            //    //panelbook.Visible = false;

            //}

            SqlConnection con = new SqlConnection("Data Source=SQL5092.site4now.net;Initial Catalog=db_a85045_houserental;User Id=db_a85045_houserental_admin;Password=Admin1234");
            SqlCommand cmd;
            string query = "select count(*) from tenants select count (*) from owners select COUNT(*) from Payment select Count(*) from houses";

            try
            {


                con.Open();
                cmd = new SqlCommand(query, con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    //  lbltanents.Text = dr[0].ToString();
                    //  lblSales.Text = dr[1].ToString();
                }
                cmd.Dispose();
                con.Close();



            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);

            }
            finally
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }

        }
    }
}
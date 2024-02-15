using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace GraduationProject
{
    public partial class dashboardd : System.Web.UI.Page
    {
        ConnectionClass cc = new ConnectionClass();
        string sql;
        protected void Page_Load(object sender, EventArgs e)
        {
            sql = "select count(*) from tenants";
            cc.cnn(sql);
            //Response.Redirect("login.aspx");
            lblname.Text = Session["name"].ToString();

            if (Session["roll"].ToString() == "Admin")
            {
                Paneladmin.Visible = true;
                PanelOwner.Visible = true;
                Paneltanent.Visible = true;
                panelbook.Visible = true;
                panelhouse.Visible = true;
                panelpayment.Visible = true;
                panellogout.Visible = true;


            }
            else
            {


            }


            if (Session["roll"].ToString() == "Tenant")
            {
                panelbook.Visible = false;
                Paneladmin.Visible = false;
                PanelOwner.Visible = false;
                Paneltanent.Visible = true;
                panelhouse.Visible = true;
                panelpayment.Visible = true;
                panellogout.Visible = true;
                //Paneltanents.Visible = true;
                // Panel2.Visible = false;
            }
            else
            if (Session["roll"].ToString() == "Owner")
            {

                PanelOwner.Visible = true;
                panelbook.Visible = false;
                Paneladmin.Visible = false;
                panelhouse.Visible = true;
                panelpayment.Visible = true;
                panellogout.Visible = true;
                Paneltanent.Visible = true;

            }
            else
            {

                //String gg = Session["roll"].ToString() ;
                //PanelOwner.Visible = false;
                //Paneltanent.Visible = false;
                //Paneladmin.Visible = false;
                //panelbook.Visible = false;

            }

            SqlConnection con = new SqlConnection("Data Source=SQL5092.site4now.net;Initial Catalog=db_a85045_houserental;User Id=db_a85045_houserental_admin;Password=Admin1234");
            SqlCommand cmd;
            string query = "select count(*) from tenants";

            try
            {


                con.Open();
                cmd = new SqlCommand(query, con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    lbltanents.Text = dr[0].ToString();
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
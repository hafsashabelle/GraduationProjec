using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace GraduationProject.Dashboard_V2
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-1OF0I2F;Initial Catalog=house;Integrated Security=True");
            SqlCommand cmd;
            string query = "select (select count(*) from tenants )tenants, (select count (*) from owners) owners, (select COUNT(*) from Payment) Payment, (select Count(*) from houses)houses";

            try
            {


                con.Open();
                cmd = new SqlCommand(query, con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    lblOwners.Text = dr[1].ToString();
                    LabelPayments.Text = dr[2].ToString();
                    Labelhouses.Text = dr[3].ToString();
                    Labeltenants.Text = dr[0].ToString();
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
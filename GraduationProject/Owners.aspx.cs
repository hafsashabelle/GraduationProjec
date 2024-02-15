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
    public partial class Owners : System.Web.UI.Page
    {
        DataSet ds;
        ConnectionClass db = new ConnectionClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillgrid("Normal");
            }
           

                if (Session["roll"].ToString() == "Admin" || Session["roll"].ToString() == "Owner")
                {

                }
                else
                {
                    Response.Redirect(@"~\Dashboard V2\404.html");
                }
           
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-1OF0I2F;Initial Catalog=house;Integrated Security=True");
            con.Open();
            string sql = "select max(Owner_id) from  Owners";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader dr = cmd.ExecuteReader();
            dr.Read();
            int owner_id = Convert.ToInt32(dr[0]);
            owner_id++;
            txtid.Text = owner_id.ToString();
        }

        protected void btnregister_Click(object sender, EventArgs e)
        {
            string gender = string.Empty;
            if (Radiomale.Checked)
            {
                gender = "Male";
            }
            else
            {
                gender = "Female";
            }


            string sql = "insert into Owners(Owner_id, Name, Tell, Email, Address, Gender ,Username, Password)values('" + txtid.Text + "','" + txtname.Text + "','" + txtphone.Text + "','" + txtemail.Text + "', '" + txtaddress.Text + "','" + gender + "','" + txtuser.Text + "','" + txtpswrd.Text + "')";
            db.cnn(sql);

            txtid.Text = "";
            txtname.Text = "";
            txtphone.Text = "";
            txtemail.Text = "";
            txtaddress.Text = "";
            txtuser.Text = "";
            txtpswrd.Text = "";
            gender = "";
            fillgrid("Normal");
        }
        protected void btnsearch_Click(object sender, EventArgs e)
        {
            fillgrid("search");
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            fillgrid("Normal");
        }

        protected void fillgrid(string search)
        {
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-1OF0I2F;Initial Catalog=house;Integrated Security=True");
            string sql;
            if (search == "Normal")
            {

                if (Session["roll"].ToString() == "Admin")
                {
                    sql = "select * from Owners ";

                }
                else
                {
                    sql = "select * from Owners  where  roll like '" + Session["username"] + "'";

                }
            }
            else
            {
                if (Session["roll"].ToString() == "Admin")
                {
                    sql = "select * from Tenants where Owner_id  like '" + txtsearching.Text + "'";

                }
                else
                {
                    sql = "select * from Tenants where Owner_id  like '" + txtsearching.Text + "' and userid like '" + Session["username"] + "'";

                }
            }
            db.cnn(sql);
            SqlDataAdapter da = new SqlDataAdapter(sql, con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

        }


        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            string sql = "delete Owners where Owner_id = '" + id + "'";
            db.cnn(sql);
            Response.Write("<script> alert (' Data has Deleted ') </script>");
            GridView1.EditIndex = -1;
            fillgrid("Normal");
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            TextBox odid = (TextBox)row.FindControl("txtowner_id");
            TextBox txtname1 = (TextBox)row.FindControl("txtname");
            TextBox txtphone1 = (TextBox)row.FindControl("txtphone");
            TextBox txtemail1 = (TextBox)row.FindControl("txtemail");
            //RadioButton txtgender1 = (RadioButton)row.FindControl("txtgender");
            //TextBox txtgender1 = (TextBox)row.FindControl("txtgender");
            TextBox txtuser1 = (TextBox)row.FindControl("txtuser");
            TextBox txtpass = (TextBox)row.FindControl("txtpswrd");
            //CheckBox chkActive = (CheckBox)row.FindControl("chkActive");
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-1OF0I2F;Initial Catalog=house;Integrated Security=True");


            string gender = string.Empty;
            if (Radiomale.Checked)
            {
                gender = "Male";
            }
            else
            {
                gender = "Female";
            }
            SqlCommand cmd = new SqlCommand("update Owners set Name='" + txtname1.Text.ToString() + "', Tell ='" + txtphone1.Text.ToString() + "',Email='" + txtemail1.Text.ToString() + "',Gender = '" + gender.ToString() + "',Username='" + txtuser1.Text.ToString() + "',Password='" + txtpass.Text.ToString() + "'   where Owner_id = '" + odid.Text + "'", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            GridView1.EditIndex = -1;
            Response.Write("<script> alert (' Data Has Updated successfully') </script>");
            fillgrid("Normal");
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            fillgrid("Normal");
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            fillgrid("Normal");

        }
    }
}
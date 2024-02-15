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
    public partial class Tenants : System.Web.UI.Page
    {
        DataSet ds;
        ConnectionClass db = new ConnectionClass();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
              
               try
                {
                
                        if (System.Web.HttpContext.Current.Session["roll"] == null)
                        {
                            GridView1.Visible = false;

                    }
                    else
                    {
                        GridView1.Visible = true;
                        fillgrid("Normal");

                    }
                }
                catch (Exception ex)
                {


                }
                

            }
            
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-1OF0I2F;Initial Catalog=house;Integrated Security=True");
        con.Open();
            string sql = "select max(Tenant_id) from  Tenants";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader dr = cmd.ExecuteReader();
            dr.Read();
            int tenant_id = Convert.ToInt32(dr[0]);
            tenant_id++;
            txtID.Text = tenant_id.ToString();
        }

        protected void btnRegister_Click(object sender, EventArgs e)
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


            string sql = "insert into Tenants(Tenant_id, Name, Tell, Email, Gender ,Username, Password, Responsible_Name, Responsible_Tell,userid )values('" + txtID.Text + "','" + txtname.Text + "','" + txtphone.Text + "','" + txtemail.Text + "', '" + gender + "','" + txtuser.Text + "','" + txtpswrd.Text + "', '" + txtRname.Text + "', '" + txtRphone.Text + "','" + Session["username"] + "')";
            db.cnn(sql);

            txtID.Text = "";
            txtname.Text = "";
            txtphone.Text = "";
            txtemail.Text = "";
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

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            GridViewRow row = GridView1.Rows[e.RowIndex];
           TextBox odid = (TextBox)row.FindControl("txtTenant_id");
            TextBox txtname1 = (TextBox)row.FindControl("txtname");
            TextBox txtphone1 = (TextBox)row.FindControl("txtphone");
            TextBox txtemail1 = (TextBox)row.FindControl("txtemail");
           ///* RadioButton txtgender1 = (RadioButton)row.FindControl("txtgender"*/);
            //TextBox txtgender1 = (TextBox)row.FindControl("txtgender");
            TextBox txtuser1 = (TextBox)row.FindControl("txtuser");
            TextBox txtpass = (TextBox)row.FindControl("txtpswrd");
            TextBox txtRname1 = (TextBox)row.FindControl("txtRname");
            TextBox txtRphone1 = (TextBox)row.FindControl("txtRphone");
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
            SqlCommand cmd = new SqlCommand("update Tenants set Name='" + txtname1.Text.ToString() + "', Tell ='" + txtphone1.Text.ToString() + "',Email='" + txtemail1.Text.ToString() + "',Gender = '" + gender.ToString() + "',Username='" + txtuser1.Text.ToString() + "',Password='" + txtpass.Text.ToString() + "', Responsible_Name = '" + txtRname1.Text.ToString() + "' , Responsible_Tell = '" + txtRphone1.Text.ToString() + "'    where Tenant_id = '" + odid.Text + "'",con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            GridView1.EditIndex = -1;
            Response.Write("<script> alert (' Data Has Updated successfully') </script>");
            fillgrid("Normal");
        }
        protected void fillgrid( string search)
        {
            string sql= "select * from Tenants where 1=0";
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-1OF0I2F;Initial Catalog=house;Integrated Security=True");

            if (search == "Normal")
            {

                if (System.Web.HttpContext.Current.Session["roll"] != null)
                {

                    if (Session["roll"].ToString() == "Admin" || Session["roll"].ToString() == "Owners" || Session["roll"].ToString() == "Tenant") 
                    {
                        sql = "select * from Tenants ";

                    }
                    else
                    {
                        sql = "select * from Tenants where  userid like '" + Session["username"] + "'";

                    }
                }
            }
            else
            {
                if (System.Web.HttpContext.Current.Session["roll"] != null)
                {
                    if (Session["roll"].ToString() == "Admin")
                    {
                        sql = "select * from Tenants where Tenant_id like '" + textsearch.Text + "'";

                    }
                    else
                    {
                        sql = "select * from Tenants where Tenant_id like '" + textsearch.Text + "' and userid like '" + Session["username"] + "'";

                    }
                }
            }

            db.cnn(sql);
            SqlDataAdapter da = new SqlDataAdapter(sql,con);
            ds = new DataSet();
            da.Fill(ds);
           GridView1.DataSource = ds;
            GridView1.DataBind();

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            fillgrid("Normal");
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            string sql = "delete Tenants where Tenant_id = '" + id + "'";
            db.cnn(sql);
            Response.Write("<script> alert (' Data has Deleted ') </script>");
            GridView1.EditIndex = -1;
            fillgrid("Normal");
            
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            fillgrid("Normal");
        }
    }

    }

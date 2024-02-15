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
    public partial class Payments : System.Web.UI.Page
    {
        ConnectionClass db = new ConnectionClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadTenant_id();
            LoadHouse_id();
            loaddate("Normal");

        }

        void clear()
        {
            txtaccount.Text = "";
            txtammount.Text = "";
            txtdate.Text = "";
        }
        void LoadTenant_id()
        {
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-1OF0I2F;Initial Catalog=house;Integrated Security=True");
            con.Open();
            string sql = "select distinct (Tenant_id),name from Tenants";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            Tenantid_list.DataTextField = ds.Tables[0].Columns["name"].ToString();
            Tenantid_list.DataValueField = ds.Tables[0].Columns["Tenant_id"].ToString();

            Tenantid_list.DataSource = ds.Tables[0];
            Tenantid_list.DataBind();
            con.Close();

        }
        void LoadHouse_id()
        {
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-1OF0I2F;Initial Catalog=house;Integrated Security=True");
            con.Open();
            string sql = "select distinct (House_id),concat(name,'-'+i.type +'-'+i.address) Name  from Houses i  inner join owners o  on  i.owner_id=o.owner_id  where  House_id not in (select House_id from  BOOKING)";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            houseid_list.DataTextField = ds.Tables[0].Columns["name"].ToString();
            houseid_list.DataValueField = ds.Tables[0].Columns["House_id"].ToString();

            houseid_list.DataSource = ds.Tables[0];
            houseid_list.DataBind();
            con.Close();

        }
        void loaddate(string search)
        {
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-1OF0I2F;Initial Catalog=house;Integrated Security=True");

            string sql;
            if (search == "Normal")
            {
                sql = "select * from Payment";
            }
            else
            {
                sql = "select * from Payment where paid_Date between '" + txtsdate.Text + "' and '" + txtedate.Text + "' and  House_id like '" + txtserch.Text + "%'";
            }

            db.cnn(sql);
            SqlDataAdapter da = new SqlDataAdapter(sql, con);
            DataSet ds = new DataSet();
            da.Fill(ds, "Payment");
            GridView1.DataSource = ds.Tables["Payment"];
            GridView1.DataBind();
        }




        protected void btnsearch_Click(object sender, EventArgs e)
        {
            loaddate("search");
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
           int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            string sql = "delete Payment where House_id = '" + id + "'";
            db.cnn(sql);
            Response.Write("<script> alert (' Data has Deleted ') </script>");
            GridView1.EditIndex = -1;
            loaddate("Normal");

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            loaddate("Normal");
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            DropDownList odid = (DropDownList)row.FindControl("houseid_list");
            DropDownList tenantid_list1 = (DropDownList)row.FindControl("tenantid_list");
            TextBox txtaccount1 = (TextBox)row.FindControl("txtaccount");
            TextBox txtammount1 = (TextBox)row.FindControl("txtammount");
            TextBox txtdate1 = (TextBox)row.FindControl("txtdate");


            SqlConnection con = new SqlConnection("Data Source=DESKTOP-1OF0I2F;Initial Catalog=house;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("update Payment set Tenant_id= '" + tenantid_list1.Text.ToString() + "' , Account_number='" + txtaccount1.Text.ToString() + "', Paid_ammount='" + txtammount1.Text.ToString() + "' , Paid_date = '" + txtdate1.Text.ToString() + "' where House_id = '" + odid.Text.ToString() + "'", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            GridView1.EditIndex = -1;
            Response.Write("<script> alert (' Data Has Updated successfully') </script>");
            loaddate("Normal");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string sql = "insert into Payment( House_id,Tenant_id, Account_number, Paid_ammount, Paid_date)values('" + houseid_list.Text + "', '" + Tenantid_list.Text.ToString() + "', '" + txtaccount.Text.ToString() + "', '" + txtammount.Text.ToString() + "', '" + txtdate.Text.ToString() + "')";
            db.cnn(sql);
            Response.Write("<script> alert (' Data has inserted') </script>");
            clear();
            loaddate("Normal");
        }

        protected void btnload_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-1OF0I2F;Initial Catalog=house;Integrated Security=True");
            con.Open();
            String sql = "select Tenant_id,Account_number,Paid_ammount,paid_date from Payment where House_id ='" + houseid_list.Text.ToString() + "'";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {

                Tenantid_list.Text = dr.GetValue(0).ToString();
                txtaccount.Text = dr.GetValue(1).ToString();
                txtammount.Text = dr.GetValue(2).ToString();
                txtdate.Text = dr.GetValue(3).ToString();



            }
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            string sql = "update Payment set Tenant_id='" + Tenantid_list.Text.ToString() + "', Account_number ='" + txtaccount.Text.ToString() + "',Paid_ammount='" + txtammount.Text.ToString() + "',paid_date='" + txtdate.Text.ToString() + "' where House_id = '" + houseid_list.Text + "'";
            db.cnn(sql);
            clear();
        }
    }
}
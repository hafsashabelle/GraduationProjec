using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;


namespace GraduationProject
{
    public partial class Booking : System.Web.UI.Page
    {
        ConnectionClass db =  new ConnectionClass();
        protected void Page_Load(object sender, EventArgs e)
        {   if (!IsPostBack)
            {
                LoadTenant_id();
                LoadHouse_id();
                loaddate("Normal");
                if (Session["roll"].ToString() == "Admin" || Session["roll"].ToString() == "Owner")
                {

                }
                else
                {
                    Response.Redirect(@"~\Dashboard V2\404.html");
                }
            }
           
        }

       
        void clear()
        {
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

            tenantid_list.DataTextField = ds.Tables[0].Columns["name"].ToString();
            tenantid_list.DataValueField = ds.Tables[0].Columns["Tenant_id"].ToString();

            tenantid_list.DataSource = ds.Tables[0];
            tenantid_list.DataBind();
            
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
                sql = "select * from Booking  ";
            }
            else
            {
                sql = "select * from Booking where House_id like '" + txtsarch.Text + "'";
            }

            db.cnn(sql);
            SqlDataAdapter da = new SqlDataAdapter(sql, con);
            DataSet ds = new DataSet();
            da.Fill(ds, "Booking");
            GridView1.DataSource = ds.Tables["Booking"];
            GridView1.DataBind();
        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            int rowindex = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            int House_id = Convert.ToInt32(GridView1.Rows[rowindex].Cells[1].Text);
            string sql = " delete  Booking where House_id = '" + House_id + "'";
            db.cnn(sql);
            Response.Write("<script> alert (' Data Has Deleted successfully') </script>");
            loaddate("Normal");
        }


        protected void btnsearch_Click(object sender, EventArgs e)
        {
            loaddate("search");
        }

        protected void btnbook_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFiles)
            {

                try
                {
                    string extention = Path.GetExtension(FileUpload1.FileName);
                    if (extention == ".pdf" || extention == ".txt" || extention == ".docx")
                    {
                        if (FileUpload1.PostedFile.ContentLength <= 10000024)
                        {

                            string fname = Path.GetFileName(FileUpload1.FileName);

                            FileUpload1.SaveAs(Server.MapPath("~/images/") + fname);
                            SqlConnection con = new SqlConnection("Data Source=DESKTOP-1OF0I2F;Initial Catalog=house;Integrated Security=True");

                            {
                                con.Open();
                              
                                SqlCommand cmd = new SqlCommand("insert into Booking( House_id,Tenant_id, Booking_date, Agreement)values('" + houseid_list.SelectedValue.ToString() + "', '" + tenantid_list.SelectedValue.ToString() + "', '" + txtdate.Text + "', '" + fname + "')", con);
                                int t = cmd.ExecuteNonQuery();
                                con.Close();
                                if (t > 0)
                                {
                                    Response.Write("<script>alert('Registrated Successfully')</script>");
                                }
                            }

                        }
                        else
                        {
                           // lbmsg.Text = "File has to be 100 kb";
                           // lbmsg.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                    else
                    {
                       // lbmsg.Text = "Only jpg,jpeg,png accepted";
                        //lbmsg.ForeColor = System.Drawing.Color.Red;
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Registrated Failed  Try Again')</script>");
                }



            }
            clear();
            loaddate("Normal");
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            string sql = "delete booking where House_id = '" + id + "'";
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

        //protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        //{
        //    GridViewRow row = GridView1.Rows[e.RowIndex];
        //    DropDownList odid = (DropDownList)row.FindControl("houseid_list");
        //    DropDownList tenantid_list1 = (DropDownList)row.FindControl("tenantid_list");
        //    TextBox txtdate1= (TextBox)row.FindControl("txtdate");
           

        //    SqlConnection con = new SqlConnection("Data Source=SQL5092.site4now.net;Initial Catalog=db_a85045_houserental;User Id=db_a85045_houserental_admin;Password=Admin1234");
        //    SqlCommand cmd = new SqlCommand("update Booking set Tenant_id= '" + tenantid_list1.Text.ToString()+ "' , Booking_date='" + txtdate1.Text.ToString() + "', Agreement='" + FileUpload1.FileName + "' where House_id = '" + odid.Text.ToString() + "'", con);
        //    con.Open();
        //    cmd.ExecuteNonQuery();
        //    con.Close();
        //    GridView1.EditIndex = -1;
        //    Response.Write("<script> alert (' Data Has Updated successfully') </script>");
        //    loaddate("Normal");

        //}

        protected void btnload_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=SQL5092.site4now.net;Initial Catalog=db_a85045_houserental;User Id=db_a85045_houserental_admin;Password=Admin1234");
            con.Open();
            String sql = "select Tenant_id,Booking_date,Agreement from Booking where House_id ='" + houseid_list.SelectedValue.ToString() + "'";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {

                tenantid_list.SelectedValue = dr.GetValue(0).ToString();
                txtdate.Text = dr.GetValue(1).ToString();
               
               

            }
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            string sql = "update Booking set Tenant_id='" + tenantid_list.SelectedValue.ToString() + "', Booking_date ='" + txtdate.Text.ToString() + "',Agreement='" + FileUpload1.FileName + "' where House_id = '" + houseid_list.SelectedValue.ToString() + "'";
            db.cnn(sql);
            clear();
        }

       
        protected void DownloadFile(object sender, EventArgs e)
        {
            try{
                string filePath = (sender as LinkButton).CommandArgument;
                Response.ContentType = ContentType;
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + Server.MapPath("~/images/") + filePath);
                Response.WriteFile(Server.MapPath("~/images/") + filePath);
                Response.End();
            }
           
             catch (Exception ex)
            {
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Configuration;

namespace GraduationProject
{
    public partial class HousesForm : System.Web.UI.Page
    {
        ConnectionClass db = new ConnectionClass();
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOwner_id();
                fillgrid();
            }
            if (Session["roll"].ToString() == "Admin" || Session["roll"].ToString() == "Owner")
            {

            }
            else
            {
                Response.Redirect(@"~\Dashboard V2\404.html");
            }



        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {

            if (fileupload1.HasFiles)
            {

                try
                {
                    string extention = Path.GetExtension(fileupload1.FileName);
                    if (extention == ".jpg" || extention == ".jpeg" || extention == ".png")
                    {
                        if (fileupload1.PostedFile.ContentLength <= 100024)
                        {

                            string fname = Path.GetFileName(fileupload1.FileName);
                            
                            fileupload1.SaveAs(Server.MapPath("~/images/") + fname);
                            SqlConnection con = new SqlConnection("Data Source=DESKTOP-1OF0I2F;Initial Catalog=house;Integrated Security=True");

                            {
                                con.Open();
                                //SqlCommand cmd = new SqlCommand("insert into houses(House_id,owner_id,Address,type,rooms,toilets,price,status,Images,farther_description) values ('" + txthouseid.Text + "', '" + ownerid_list.Text + " ','" + txtaddress.Text + "' , '" + txttype.Text + "', '" + txtrooms.Text + "', '" + txttoilets.Text + "','" + txtprice.Text + "', '" + Status_list.Text + "', '" + fileupload1.FileName + "', '" + txtinfo.Text + "')", con);
                                // string sql = "insert into houses(House_id,type,owner_id,address,rooms,toilets,price,status,Images) values ('"+txthouseid.ToString()+"', '"+txttype.ToString()+ " ','"+ownerlist.ToString()+ "' , '"+txtaddress.ToString()+"', '"+txtroome.ToString()+"', '"+txttoilet.ToString()+"','"+txtprice.Text+"', '"+Statuslist.Text+"', '"+fileupload1.FileName+"')"; 
                                //  db.cnn(sql);
                                SqlCommand cmd = new SqlCommand("insert into houses (House_id,Owner_id,Address,Type,Rooms,Toilets,Price,status,Images,Farther_description) values('"+txthouseid.Text.ToString()+"','"+ownerid_list.Text.ToString()+"','"+txtaddress.Text.ToString()+"','"+txttype.Text.ToString()+"','"+txtrooms.Text.ToString()+"','"+txttoilets.Text.ToString()+"','"+txtprice.Text.ToString()+"','"+Status_list.Text.ToString()+"','"+fileupload1.FileName+"','"+txtinfo.Text.ToString()+"')", con);
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
                            lbmsg.Text = "File has to be 100 kb";
                            lbmsg.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                    else
                    {
                        lbmsg.Text = "Only jpg,jpeg,png accepted";
                        lbmsg.ForeColor = System.Drawing.Color.Red;
                    }
                }
                catch (Exception ex)
                {
                }
                
               
            
        }

    }

        void LoadOwner_id()
        {
           // SqlConnection con = new SqlConnection("Data Source=SQL5092.site4now.net;Initial Catalog=db_a85045_houserental;User Id=db_a85045_houserental_admin;Password=Admin1234");
          db.con.Open();
            string sql = "select distinct (Owner_id) from Owners";
            SqlCommand cmd = new SqlCommand(sql, db.con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                ownerid_list.Items.Add(dr.GetValue(0).ToString());
            }
            dr.Close();

        }

        protected void fillgrid()
        {
           // SqlConnection con = new SqlConnection("Data Source=SQL5092.site4now.net;Initial Catalog=db_a85045_houserental;User Id=db_a85045_houserental_admin;Password=Admin1234");
            string sql;
           
            sql = "select * from Houses  order by Owner_id desc  ";
            
            db.cnn(sql);
            SqlDataAdapter da = new SqlDataAdapter(sql, db.con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

            GridView1.EditIndex = e.NewEditIndex;
            fillgrid();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            string sql = "delete Houses where House_id = '" + id + "'";
            db.cnn(sql);
            Response.Write("<script> alert (' Data has Deleted ') </script>");
            GridView1.EditIndex = -1;
            fillgrid();
        }

        protected void btnload_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-1OF0I2F;Initial Catalog=house;Integrated Security=True");
            con.Open();
            String sql = "select Owner_id,Address,Type,Rooms,Toilets,Farther_description,Price,Status,Images from Houses where House_id ='" + txthouseid.Text.ToString() + "'";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                ownerid_list.Text = dr.GetValue(0).ToString();
                txtaddress.Text = dr.GetValue(1).ToString();
                txttype.Text = dr.GetValue(2).ToString();
                txtrooms.Text = dr.GetValue(3).ToString();
                txttoilets.Text = dr.GetValue(4).ToString();
                txtinfo.Text = dr.GetValue(5).ToString();
                txtprice.Text = dr.GetValue(6).ToString();
                Status_list.Text = dr.GetValue(7).ToString();


            }
        }

        void clear()
        {
            txtaddress.Text = "";
            txttype.Text = "";
            txtrooms.Text = "";
            txttoilets.Text = "";
            txtinfo.Text = "";
            txtprice.Text = "";

        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            string sql = "update Houses set Address='" + txtaddress.Text.ToString() + "', Type ='" + txttype.Text.ToString() + "',Rooms='" + txtrooms.Text.ToString() + "',Toilets='" + txttoilets.Text.ToString() + "', Farther_description= '" + txtinfo.Text.ToString() + "',Price = '" + txtprice.Text.ToString() + "',Status='" + Status_list.Text.ToString() + "' where House_id = '" + txthouseid.Text + "'";
            db.cnn(sql);
            clear();
            fillgrid();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            fillgrid();
        }
    }
}
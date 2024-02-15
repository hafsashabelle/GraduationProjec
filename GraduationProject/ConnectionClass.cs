using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace GraduationProject
{
    public class ConnectionClass
    {
        public          SqlConnection con = new SqlConnection("Data Source=DESKTOP-1OF0I2F;Initial Catalog=house;Integrated Security=True");
        public void cnn(String sql)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.ExecuteNonQuery();
                con.Close();
            }catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
           }


        }

       
    }
}
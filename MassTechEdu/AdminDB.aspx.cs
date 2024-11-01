using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using Newtonsoft.Json;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MassTechEdu
{
    public partial class AdminDB : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
            if (!IsPostBack)
            {
                loaddata();
                LoadSalesData();
            }
        }

        private void LoadSalesData()
        {
            List<string> months = new List<string>();
            List<decimal> sales = new List<decimal>();

            string query = "exec fetchGraph";

            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                months.Add(reader["MonthYear"].ToString());
                sales.Add(reader.GetDecimal(reader.GetOrdinal("total_value")));
            }
          

            // Convert lists to JSON and set as a client-side variable using Newtonsoft.Json
            string monthsJson = JsonConvert.SerializeObject(months);
            string salesJson = JsonConvert.SerializeObject(sales);
            ClientScript.RegisterStartupScript(this.GetType(), "LoadChartData", $"setChartData({monthsJson}, {salesJson});", true);
        }


        public void loaddata() 
        {
            string q = "exec no_of_users";
            SqlCommand cmd = new SqlCommand(q, conn);   
            SqlDataReader   rdr = cmd.ExecuteReader();
            rdr.Read();
            Label1.Text = rdr["no_of_users"].ToString();
            rdr.Close();
            
            string q1 = "exec no_of_courses";
            SqlCommand cmd1 = new SqlCommand(q1, conn);   
            SqlDataReader   rdr1 = cmd1.ExecuteReader();
            rdr1.Read();
            Label2.Text = rdr1["no_of_courses"].ToString();
            rdr1.Close();
            
            string q2 = "exec no_of_sales";
            SqlCommand cmd2 = new SqlCommand(q2, conn);   
            SqlDataReader rdr2 = cmd2.ExecuteReader();
            rdr2.Read();
            Label3.Text = rdr2["total_value"].ToString();
            rdr2.Close();

        }
    }
}
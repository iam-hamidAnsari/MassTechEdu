using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MassTechEdu
{
    public partial class viewuser : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
            if (!IsPostBack)
            {
                string userId = Request.QueryString["id"];
                LoadUserProfile(userId);
            }
        }
        void LoadUserProfile(string userId)
        {

            {
                string query = $"SELECT id, name, email, profile_img FROM Users WHERE id = {userId}";
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    TextBox1.Text = reader["name"].ToString();
                    TextBox2.Text = reader["email"].ToString();
                    Image1.ImageUrl = reader["profile_img"].ToString();
                    //TextBox3.Text = reader["purchasedAnyCourse"].ToString();
                }
                reader.Close();
            }
        }
    }
}
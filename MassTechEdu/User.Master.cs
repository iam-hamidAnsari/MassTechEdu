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
    public partial class User : System.Web.UI.MasterPage
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();

            if (!IsPostBack)
            {
                fetchName();
            }
            
        }

        public void fetchName()
        {
            string q = $"exec fetchNamePf '{Session["email"].ToString()}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            rdr.Read();
            Label1.Text = rdr["name"].ToString();
            if (rdr["profile_img"] == DBNull.Value || string.IsNullOrEmpty(rdr["profile_img"].ToString()))
            {
                Image1.ImageUrl = "https://cdn-icons-png.flaticon.com/512/3135/3135715.png";
            }
            else
            {
                Image1.ImageUrl = rdr["profile_img"].ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Response.Redirect("LoginPage.aspx");
        }
    }
}
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
    public partial class manageprofile : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
            string email = Session["email"].ToString();
            if (!IsPostBack)
            {
                bindprofile(email);
            }
        }

        public void bindprofile(string email)
        {
            string q = $"exec manageprofile '{email}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            rdr.Read();
            if (rdr["profile_img"] == DBNull.Value)
            {
                Image1.ImageUrl = "https://cdn-icons-png.flaticon.com/512/3135/3135715.png";
            }
            else
            {
                Image1.ImageUrl = rdr["profile_img"].ToString();
            }
            TextBox1.Text = rdr["name"].ToString();
            TextBox2.Text = rdr["contact_no"].ToString();
            TextBox3.Text = rdr["email"].ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                FileUpload1.SaveAs(Server.MapPath("profileImg/") + FileUpload1.FileName);
                string img_path = "profileImg/" + FileUpload1.FileName;
                string q = $"exec updateProfile '{TextBox1.Text}','{TextBox2.Text}','{img_path}','{TextBox3.Text}'";
                SqlCommand cmd = new SqlCommand(q, conn);
                cmd.ExecuteNonQuery();
                bindprofile(TextBox3.Text);
                Response.Write("<script>alert('Profile updated Successfully..')</script>");
            }
            else 
            {
                string q = $"exec updateProfile '{TextBox1.Text}','{TextBox2.Text}',NULL,'{TextBox3.Text}'";
                SqlCommand cmd = new SqlCommand(q, conn);
                cmd.ExecuteNonQuery();
                bindprofile(TextBox3.Text);
                Response.Write("<script>alert('Profile updated Successfully..')</script>");
            }
            
        }
    }
}
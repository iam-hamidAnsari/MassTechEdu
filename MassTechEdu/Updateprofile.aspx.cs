using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MassTechEdu
{
    public partial class Updateprofile : System.Web.UI.Page
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
                string query = $"exec manageprofilebyadmin {userId}";
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.Read())
                {
                    TextBox1.Text = rdr["name"].ToString();
                    TextBox2.Text = rdr["email"].ToString();
                    TextBox3.Text = rdr["contact_no"].ToString();
                    if (rdr["profile_img"] == DBNull.Value)
                    {
                        Image1.ImageUrl = "https://cdn-icons-png.flaticon.com/512/3135/3135715.png";
                    }
                    else
                    {
                        Image1.ImageUrl = rdr["profile_img"].ToString();
                    }
                }
                rdr.Close();
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string userId = Request.QueryString["id"];

            if (FileUpload1.HasFile)
            {

                string filename = Path.GetFileName(FileUpload1.FileName);
                string filePath = Server.MapPath("images/") + filename;
                FileUpload1.SaveAs(filePath);
                string filepath = "images/" + filename;
                Image1.ImageUrl = filepath;
                string q = $"exec updateuser '{TextBox1.Text}','{TextBox3.Text}','{filepath}','{TextBox2.Text}',{userId}";
                SqlCommand cmd1 = new SqlCommand(q, conn);
                cmd1.ExecuteNonQuery();
                Response.Write("<script>alert('Profile updated Successfully..')</script>");
            }
            else
            {
                string q2 = $"exec updateuserwithoutimg '{TextBox1.Text}','{TextBox3.Text}','{TextBox2.Text}',{userId}";
                SqlCommand cmd3 = new SqlCommand(q2, conn);
                cmd3.ExecuteNonQuery();
                Response.Write("<script>alert('Profile updated Successfully..')</script>");
            }
        }
    }
}
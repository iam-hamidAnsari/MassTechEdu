using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MassTechEdu;

namespace MassTechEdu
{
    public partial class LoginPage : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string email=TextBox1.Text,pass = TextBox2.Text;
            string q= $"exec login '{email}'";
            SqlCommand cmd = new SqlCommand(q,conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                string salt = rdr["password"].ToString();
                string passHash = rdr["password_hash"].ToString();

                string cnvrtpass = Password.HashPassword(pass,salt);
                if (cnvrtpass.Equals(passHash))
                {
                    Session["email"] = email;
                    if (rdr["urole"].Equals("admin"))
                    {
                        Response.Redirect("AdminDB.aspx");
                    }
                    else if (rdr["urole"].Equals("user"))
                    {
                        if (rdr["purchasedAnyCourse"].Equals("t"))
                        {
                            Response.Redirect("MyCourse.aspx");
                        }
                        else if (rdr["purchasedAnyCourse"].Equals("f"))
                        {
                            Response.Redirect("UserOurCourse.aspx");
                        }
                    }
                }
                else 
                {
                    Response.Write("<script>alert('Invalid Password!!')</script>");
                }
            }
            else 
            {
                Response.Write("<script>alert('Invalid Email ID!!')</script>");
            }
        }
    }
}
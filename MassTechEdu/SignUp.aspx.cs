using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MassTechEdu;

namespace MassTechEdu
{
    public partial class SignUp : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
            MultiView1.ActiveViewIndex = 0;
        }

        public string OTPGen()
        { 
            Random rnd = new Random();
            return rnd.Next(1000,9999).ToString();
        }

        public void SendOtpEmail(string email, string otp)
        {
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("mpoke1928@gmail.com");
            mail.To.Add(email);
            mail.Subject = "OTP verification";
            mail.Body = $"Hi User\nHere Is Your OTP : {otp}";
            SmtpClient smtp = new SmtpClient("smtp.gmail.com");
            smtp.Port = 587;
            smtp.Credentials = new NetworkCredential("mpoke1928@gmail.com", "dhfx widi jvps itnr"); // Add your email password here
            smtp.EnableSsl = true;
            smtp.Send(mail);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string email = TextBox3.Text;
            string otp = OTPGen();
            MultiView1.ActiveViewIndex = 1;
            string q = $"exec genotp '{otp}','{email}'";
            SqlCommand cmd = new SqlCommand(q,conn);
            cmd.ExecuteNonQuery();
            SendOtpEmail(email, otp);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string email = TextBox3.Text;
            string q = $"exec verifyOTP '{TextBox4.Text}','{email}'";
            SqlCommand cmd = new SqlCommand(q,conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                MultiView1.ActiveViewIndex = 2;
            }
            else 
            {
                Response.Write("<script>alert('Invalid OTP!!')</script>");
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string name = TextBox1.Text,contact_no = TextBox2.Text,email = TextBox3.Text,password = TextBox6.Text;
            string salt = Password.GenerateSalt();
            string passwordHash = Password.HashPassword(password,salt);
            string q = $"exec Reguser '{name}','{email}','{salt}','{passwordHash}','{contact_no}'";
            SqlCommand cmd = new SqlCommand(q,conn);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('User Registerd Succesfully!!')</script>");
            Response.Redirect("LoginPage.aspx");
        }
    }
}